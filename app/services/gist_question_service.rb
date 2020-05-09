class GistQuestionService

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @response = @client.create_new_gist(gist_params)
    self
  end

  def success?
    @response.html_url.present?
  end

  def gist_link
    @response.html_url
  end

  private

  def default_client
    GitHubClient.new
  end

  def gist_params
    {
      description: I18n.t('.services.gist_question_service.description', title: @test.title),
      public: false,
      files: { 
        I18n.t('.services.gist_question_service.filename') => { content: gist_content }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content << @question.answers.pluck(:body)
    content.join("\n")
  end

end
