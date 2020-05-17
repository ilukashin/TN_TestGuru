class FeedbackMailer < ApplicationMailer
  def send_feedback(message)
    mail(to: 'gregoryawesoman@icloud.com', subject: 'Feedback from TestGuru') do |format|
      format.text { render plain: message }
    end
  end
end
