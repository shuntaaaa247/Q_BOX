class QuestionsController < ApplicationController
  def index # アンケートの一覧を表示(ルートパス)
    @questions = Question.all # アンケートを全件取得
  end

  def show # アンケートの詳細を表示(GET /questions/[question_id])
    @question = Question.find(params[:id])
    puts(params[:id])
    puts("questionのshowが呼ばれました")

    @response = 0 # 回答数をカウントする変数
    answers = Answer.where(question_id: params[:id])
    answers.each do |a|
      @response = @response + a.like # それぞれの選択肢の投票数を足し算し回答数を算出
    end
  end

  def new # 新規アンケート作成画面を表示(GET /questions/new)
    @question = Question.new
  end

  def create # 新規アンケートを作成(POST /questions)
    p = question_params
    q = Question.create({ "username" => p[:username], "description" => p[:description] }) # アンケート(Question)を作成

    p_answers = [ p[:answer_1], p[:answer_2], p[:answer_3], p[:answer_4] ] # アンケートの選択肢(Answer)を作成
    p_answers.each do |p_ans|
      if p_ans != ""
        Answer.create(username: p[:username], description: p_ans, question_id: q.id)
      end
    end

    redirect_to root_path
  end

  def search # アンケートの検索結果を表示(GET /questions/search?query="検索ワード")
    puts "questions#searchが呼ばれました"
    query = params[:query]
    puts query
    @questions = Question.where("description LIKE?", "%#{query}%") # データベースからアンケートを検索
    render template: "questions/index"
  end

  def list # アンケート結果をJSON形式で表示(GET /questions/question_id/list)
    puts "questions#listが呼ばれました"
    id = params[:id] # パスパラメータからアンケートのIDを取得
    hash = generate_hash(id) # アンケート結果をJSON形式で取得
    render json: hash
  end

  def download_json # アンケート結果をJSONファイルでダウンロードする
    puts "questions#download_jsonが呼ばれました"
    id = params[:id]
    hash = generate_hash(id)
    send_data hash.to_json, filename: "#{hash[:description]}.json", type: "application/json" # JSONファイルを出力する
  end

  private
  def question_params
    params.require(:question).permit(:username, :description, :answer_1, :answer_2, :answer_3, :answer_4)
  end
end

def generate_hash(id) # アンケートのIDを受け取りアンケート結果をJSON形式で返す
  hash = {}
  question = Question.find(id)
  answers = Answer.where(question_id: question.id)
  hash[:question_id] = question.id
  hash[:username] = question.username
  hash[:description] = question.description
  hash[:answers] = answers
  hash[:created_at] = question.created_at
  hash[:updated_at] = question.updated_at
  hash
end
