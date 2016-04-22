class MessagesController < ApplicationController

  # Require authentication for the following functions
  before_action :require_admin_authentication, :only => [
      :index,
      :delete, :destroy
  ]

  # Lists all the messages.
  # Requires authentication.
  # GET http://francismb.com/messages
  def index
    @messages = Message.all
  end

  # Shows the contents of a message.
  # GET http://francismb.com/messages/ID
  def show
    @message = Message.find(params[:id])
  end

  # Shows the form to make a new message.
  # GET http://francismb.com/messages/new
  def new

  end

  # Processes the form sent from the action #new and
  # creates a new message if the information is valid.
  # POST http://francismb.com/messages
  def create
    message = Message.new(message_params)
    if message.valid? && message.save
      render :json => {:name => message.name}, :status => :ok
    else
      render :json => {:errors => message.errors}, :status => 422
    end
  end

  # Confirms if you want to delete a message.
  # Requires authentication.
  # GET http://francismb.com/messages/delete/ID
  def delete
    @message = Message.find(params[:id])
  end

  # Deletes a persisted delete from the database.
  # Requires authentication.
  # DELETE http://francismb.com/messages/ID
  def destroy
    message = Message.find(params[:id])
    if message
      message.delete
    end
    redirect_to :action => :index
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :message)
  end

end
