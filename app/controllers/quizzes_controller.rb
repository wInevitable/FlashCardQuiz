class QuizzesController < ApplicationController
  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.set_id = 1 # remove once sets have been implemented

    if @quiz.save
      flash[:notice] = "Quiz Completed."
    else
      flash[:error] = "There was an error saving the Quiz."
    end

    redirect_to root_url
  end

  def show
    @quiz = Quiz.where(id: params[:id]).first
    render json: @quiz
  end

  private
  def quiz_params
    params.require(:quiz).permit(:score, :set_id)
  end
end
