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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if current_user == @question.user
      @question = Question.find(params[:id])
      if @question.update(question_params)
        flash[:notice] = "Successfully edited a question!"
        redirect_to question_path(@question)
      else
        flash[:alert] = "This entry is not valid"
        render :edit
      end
    else
      flash[:notice] = "You are not allowed to edit this question"
      redirect_to question_path(@question)
    end
  end

  def create
    if @current_user
      @question = Question.new(question_params)
      @question.user = @current_user
      if @question.save
        flash[:notice] = "Successfully posted a Question!"
        redirect_to question_path(@question)
      else
        flash[:alert] = "Did not post question"
        render :new
      end
    else
      flash[:notice] = "You need to be signed in to submit a question"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if current_user == @question.user
      @question.destroy
      flash[:notice] = "Successfully deleted a Question!"
      redirect_to questions_path
    else
      flash[:notice] = "You are not allowed to delete this question"
      redirect_to questions_path
    end
  end

  private
  def question_params
    params.require(:question).permit(
      :title,
      :body,
    )
  end

end
