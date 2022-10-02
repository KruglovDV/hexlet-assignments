# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    HOST = 'https://rails-collective-blog-ru.hexlet.app'
    SIGN_UP_PAGE_PATH = '/users/sign_up'
    CREATE_USER_PATH = '/users'

    def hack(email, password)
      registration_page_response = Net::HTTP.get_response(URI(URI::join(HOST, SIGN_UP_PAGE_PATH)))
      cookie = registration_page_response['set-cookie'].split(';').first
      doc = Nokogiri::HTML(registration_page_response.body)
      token = doc.css('input[name="authenticity_token"]').first['value']

      res = Net::HTTP.post(
        URI(URI::join(HOST, CREATE_USER_PATH)),
        URI.encode_www_form({
          'authenticity_token' => token,
          'user[email]' => email,
          'user[password]' => password,
          'user[password_confirmation]' => password
        }),
        { cookie: cookie }
      )
      puts res.code === '302' ? 'user created!' : 'user not created'
      res
    end
  end
end
