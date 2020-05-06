class GitHubClient

  def initialize
    @client = Octokit::Client.new(access_token: ENV['GH_ACCESS_TOKEN'])
  end

  def create_new_gist(params)
    @client.create_gist(params.to_json)
  end
  
end
