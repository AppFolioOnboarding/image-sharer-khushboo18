module Api
  class FeedbacksController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
      feedback = Feedback.new(feedback_params)
      if feedback.save
        render json: {
          status: :ok, message: 'Thanks for your feedback!'
        }.to_json
      else
        render json: {
          status: :not_found, message: 'Error in saving feedback :('
        }.to_json
      end
    end

    def new; end

    private

    def feedback_params
      params.require(:feedback).permit(:name, :comments)
    end
  end
end
