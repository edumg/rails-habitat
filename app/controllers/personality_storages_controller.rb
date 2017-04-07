class PersonalityStoragesController < ApplicationController

  before_action :get_session_id, only: [:create, :edit, :update, :destroy]


  def edit
  end

  def create

  end

  def destroy
  end

  def new

  end

  def udpate
  end

  private

  def get_session_id
    @session_id = session.id
  end

end
