class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to :questions, notice: 'Question created successfully.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to :questions, notice: 'Question updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to :questions, notice: 'Question deleted successfully.'
  end

  private

  def question_params
    params.require(:question).permit([
      :text,
      :category_id
      ])
  end

end
