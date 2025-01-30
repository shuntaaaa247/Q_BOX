class AnswersController < ApplicationController
  def create # アンケート詳細画面(/questions/[question_id])から選択肢を追加した時に呼び出される(GET /answers/create)
    puts("answerのcreateが呼ばれました")
    puts(answer_params)
    Answer.create(username: answer_params[:username], description: answer_params[:description], question_id: answer_params[:question_id])
    redirect_to request.referer
  end

  def update # アンケート詳細画面(/questions/[answer_id])にて、選択肢に投票した際に呼び出される(PATCH /answers/answer_id)
    puts("answerのupdateが呼ばれました")
    answer = Answer.find(params[:answer]) # パスパラメータに含まれる選択肢idから選択肢を取り出す
    answer.increment!(:like) # 選択肢の投票数(like)をインクリメントする
    redirect_to request.referer
  end

  private
  def answer_params
    params.require(:answer).permit(:username, :description, :question_id)
  end
end
