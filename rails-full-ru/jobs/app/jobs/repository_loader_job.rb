class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(repository_id)
    repository = Repository.find_by(id: repository_id)
    return if repository.nil?

    begin
      repository.fetch!
      client = Octokit::Client.new
      github_repository = Octokit::Repository.from_url(repository.link)
      repository_info = client.repository(github_repository)
      repository.update(get_repository_attributes(repository_info))
      repository.complete!
    rescue
      repository.fail!
    end
  end

  private

  def get_repository_attributes(info)
    {
      owner_name: info[:owner][:login],
      repo_name: info[:name],
      repo_created_at: info[:created_at],
      repo_updated_at: info[:updated_at]
    }.merge(
      { **info }.slice(:description, :default_branch, :watchers_count, :language)
    )
  end

end
