class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order('created_at DESC, id DESC')
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Successfully posted a Question!"
      redirect_to questions_path
    else
      flash[:alert] = "Did not post question, make sure to post a title"
      render :new
    end
  end

private
  def question_params
  params.require(:question).permit(
    :title,
    :body
  )
  end

end
