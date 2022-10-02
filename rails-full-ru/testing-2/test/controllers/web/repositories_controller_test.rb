# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should create repository' do
    repo_url = 'https://github.com/octocat/Hello-World'
    mock_url = 'https://api.github.com/repos/octocat/Hello-World'
    response = load_fixture('files/response.json')
    stub_request(:get, mock_url)
      .to_return(body: response, status: 200, headers: { content_type: 'application/json' })

    repository_params = { link: repo_url }
    post repositories_path params: { repository: repository_params }

    created_repository = Repository.find_by(repository_params)

    assert created_repository
    assert_redirected_to repositories_path
  end
  # END
end
