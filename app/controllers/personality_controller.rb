class PersonalityController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :done]
  before_action :get_session_id, only: [:create, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
    @questions = Question.all
  end

  def done
    @results = params[:results].split(',')
  end

  def create
  end

  private

  def get_session_id
    @session_id = session.id
  end

end
