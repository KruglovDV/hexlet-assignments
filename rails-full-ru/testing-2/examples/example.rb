Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'names/fetch', to: 'names#fetch', as: :fetch_name
    end
  end
end

# Простейший способ тестирования API
class Api::V1::NamesControllerTest < ActionDispatch::IntegrationTest
  test '#fetch' do
    get api_v1_fetch_name_url
    assert_response :success
  end
end

class Api::V1::NamesController < Web::ApplicationController
  def fetch
    render json: {
      country: '',
      possibility: 0.1
    }
  end
end

# Проверка содержимого ответа
class Api::V1::NamesControllerTest < ActionDispatch::IntegrationTest
  test '#fetch' do
    get api_v1_fetch_name_url
    json_response = JSON.parse(response.body)

    assert_response :success
    assert_equal 'RU', json_response['country']
    assert_equal 0.1, json_response['possibility']

    refute_nil json_response['country']
    refute_nil json_response['possibility']
  end
end

class Api::V1::NamesController < Web::ApplicationController
  def fetch
    result = FetchNameInformationService.new.(name: params[:name])
  end
end

# app/services/fetch_name_information_service.rb
# Сервис возвращает информацию об имени и верояность его использования в странах
# http://api.nationalize.io/?name=David

class FetchNameInformationService
  FETCH_NAME_BASE_URL = 'http://api.nationalize.io'
  def call(name:)
    uri = URI("#{FETCH_NAME_BASE_URL}?name=#{name}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  rescue StandardError
    {
      country: nil,
      possibility: nil
    }
  end
end


# test/services/fetch_name_information_service_test.rb
require 'test_helper'
require_relative 'app/services/fetch_name_information_service.rb'

# При каждом запуске тестов выполняется реальный запрос к API
class FetchNameInformationServiceTest < ActiveSupport::TestCase
  test '#call' do
    result = FetchNameInformationService.new.(name: params[:name])

    assert result['country'].is_a? Array
  end
end


# ./Gemfile
group :test do
  # https://github.com/bblimke/webmock
  gem "webmock"
end

# ./test/test_helper.rb
require 'webmock/minitest'

# test/services/fetch_name_information_service_test.rb
require 'test_helper'
require_relative 'app/services/fetch_name_information_service.rb'


# app/services/fetch_name_information_service.rb
# Сервис возвращает информацию об имени и верояность его использования в странах
# http://api.nationalize.io/?name=David

class FetchNameInformationService
  FETCH_NAME_BASE_URL = 'http://api.nationalize.io'
  def call(name:)
    uri = URI("#{FETCH_NAME_BASE_URL}?name=#{name}")
    response = Net::HTTP.get(uri)

    {
      country: response['country'][0]['country_id'],
      possibility: response['country'][0]['probability']
    }
  rescue StandardError
    {
      country: '',
      possibility: ''
    }
  end
end

# При каждом запуске тестов выполняется реальный запрос к API
class FetchNameInformationServiceTest < ActiveSupport::TestCase
  test '#call' do
    name = 'John'
    stub_request(:get, "#{FetchNameInformationService::FETCH_NAME_BASE_URL}?name=#{name}")
    result = FetchNameInformationService.new.(name: name)

    assert result[:country].is_a? String
    assert result[:possibility].is_a? String
  end
end

class Api::V1::NamesControllerTest < ActionDispatch::IntegrationTest
  test '#fetch' do
    name = 'David'
    stub_request(:get, "#{FetchNameInformationService::FETCH_NAME_BASE_URL}?name=#{name}")
    get api_v1_fetch_name_url(name: name)

    json_response = JSON.parse(response.body)

    assert_response :success
    assert json_response['country'].is_a?(String)
    assert json_response['possibility'].is_a?(String)
  end
end

# Webmock может подменять ответы от внешних сервисов.
stub_request(:get, "www.example.com").
  to_return({body: "abc"}, {body: "def"})
Net::HTTP.get('www.example.com', '/')    # ===> "abc\n"
Net::HTTP.get('www.example.com', '/')    # ===> "def\n"
