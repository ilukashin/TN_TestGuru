class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @response = @client.create_new_gist(gist_params)
    self
  end

  def success?
    @response.html_url.present?
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      public: false,
      files: { 
        'filename' => { content: gist_content }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content << @question.answers.pluck(:body)
    content.join("\n")
  end

end
