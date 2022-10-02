# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    link = permitted_params[:link]
    client = Octokit::Client.new
    github_repository = Octokit::Repository.from_url(link)
    info = client.repository(github_repository)
    repository_attributes = get_repository_attributes(info, link)
    @repository = Repository.new(repository_attributes)

    if @repository.save
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :new, status: :unprocessable_entity
    end
    # END
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end

  def get_repository_attributes(info, link)
    {
      link: link,
      owner_name: info[:owner][:login],
      repo_name: info[:name],
      repo_created_at: info[:created_at],
      repo_updated_at: info[:updated_at]
    }.merge(
      { **info }.slice(:description, :default_branch, :watchers_count, :language)
    )
  end
end
