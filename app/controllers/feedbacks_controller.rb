class FeedbacksController < ApplicationController
  
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.with(@feedback).send_feedback.deliver_now
      flash[:notice] = 'Feedback was successfully sended.'
      redirect_to root_path
    else
      flash[:alert] = 'Failed to send feedback'      
      render :new
    end
  end

  def feedback_params
    params.require(:feedback).permit(:email, :text)
  end
end
