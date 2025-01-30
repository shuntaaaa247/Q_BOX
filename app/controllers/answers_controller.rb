class AnswersController < ApplicationController
  def create
    puts("answerのcreateが呼ばれました")
    puts(answer_params)
    Answer.create(username: answer_params[:username], description: answer_params[:description], question_id: answer_params[:question_id])
    redirect_to request.referer
  end

  def update
    puts("answerのupdateが呼ばれました")
    answer = Answer.find(params[:answer])
    answer.increment!(:like)
    redirect_to request.referer
  end

  private
  def answer_params
    params.require(:answer).permit(:username, :description, :question_id)
  end
end
