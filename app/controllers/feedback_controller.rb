class FeedbackController < ApplicationController

  def new;  end

  def create
    message = params[:text] + "\nFrom #{current_user.email}"

    mailer = FeedbackMailer.new
    if mailer.send_feedback(message).deliver!.errors.empty?
      flash[:notice] = 'Feedback was successfully sended.'
      redirect_to root_path
    else
      flash[:alert] = 'Failed to send feedback'      
      render :new
    end
  end
end
