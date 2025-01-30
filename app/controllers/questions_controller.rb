class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    puts(params[:id])
    puts("questionのshowが呼ばれました")

    @response = 0
    answers = Answer.where(question_id: params[:id])
    answers.each do |a|
      @response = @response + a.like
    end
  end

  def new
    @question = Question.new
  end

  def create
    p = question_params
    q = Question.create({ "username" => p[:username], "description" => p[:description] })

    p_answers = [ p[:answer_1], p[:answer_2], p[:answer_3], p[:answer_4] ]
    p_answers.each do |p_ans|
      if p_ans != ""
        Answer.create(username: p[:username], description: p_ans, question_id: q.id)
      end
    end

    redirect_to root_path
  end

  def search
    puts "questions#searchが呼ばれました"
    query = params[:query]
    puts query
    @questions = Question.where("description LIKE?", "%#{query}%")
    render template: "questions/index"
  end

  def list
    puts "questions#listが呼ばれました"
    id = params[:id]
    hash = generate_hash(id)
    # question = Question.find(id)
    # hash = {}
    # answers = Answer.where(question_id: question.id)
    # hash[:question_id] = question.id
    # hash[:username] = question.username
    # hash[:description] = question.description
    # hash[:answers] = answers
    # hash[:created_at] = question.created_at
    # hash[:updated_at] = question.updated_at
    render json: hash
  end

  def download_json
    # file = File.open("public/q_box.json", "w")
    # file.puts
    puts "questions#download_jsonが呼ばれました"
    id = params[:id]
    hash = generate_hash(id)
    send_data hash.to_json, filename: "#{hash[:description]}.json", type: "application/json"
  end

  private
  def question_params
    params.require(:question).permit(:username, :description, :answer_1, :answer_2, :answer_3, :answer_4)
  end
end

def generate_hash(id)
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
