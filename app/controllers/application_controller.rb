class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  helper_method :mailbox, :conversation

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
end
