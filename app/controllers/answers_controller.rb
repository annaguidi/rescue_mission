class AnswersController < ApplicationController

  def index
    @questions = Question.all.order('created_at DESC, id DESC')
  end

  def show
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.new.find
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question


    if @answer.save
      flash[:notice] = "You successfully answered a question"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to answer the question, needs to be at least 60 characters long"
      @answers = @question.answers
      render :"questions/show"
    end
  end

  def update
    @question = Question.find(params[:question_id])
    if current_user == @question.user
      @answers = @question.answers
      @answers.each do |answer|
        answer.update(best_answer: "false")
        answer.save
      end
      @answer = Answer.find(params[:id])
      @answer.update(best_answer: "true")
      @answer.save
      redirect_to question_path(@question)
    else
      flash[:notice] = "Not allowed to star an answer"
      redirect_to question_path(@question)
    end
  end

private


  def answer_params
    params.require(:answer).permit(
    :body
    )
  end

end
