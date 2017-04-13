class PersonalityController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :done]
  before_action :get_session_id, only: [:create, :edit, :update, :destroy, :done]

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

    @results.each do |result|
      puts result
      @answer = Answer.find_by photo: result
      new_person_storage = Personalitystorage.new
      new_person_storage.session = @session_id
      new_person_storage.answer_id = @answer.id
      new_person_storage.question_id = 1
      new_person_storage.save
    end

  end

  def create
  end

  private

  def get_session_id
    @session_id = session.id
  end

end


