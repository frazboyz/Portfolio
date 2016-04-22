class ServerController < ApplicationController
    
    # Require authentication for the following actions
    before_action :require_authentication, only: [
        :index, :show    
    ]
    
    # Require admin authenitcation for the following actions
    before_action :require_admin_authentication, only: [
        :new, :create,
        :edit, :update
    ]
    
    # Redirects to #show
    # GET http://francismb.com/server
    def index
        server = Server.first
        if server == nil
            server = Server.new
            server.save
        end
        redirect_to :action => :show, :id => server.id
    end
    
    # Shows the contents of a server.
    # GET http://francismb.com/server/ID
    def show
        @server = Server.find(params[:id])
    end
    
    # Shows the form to make a new server.
    # GET http://francismb.com/server/new
    def new
    end
        
    # Processes the form sent from the action #new and
    # creates a new server if the information is valid.
    # POST http://francismb.com/server
    def create
      @server = Server.new(params[:content])
      if @server.save
        redirect_to :action => :show, :id => @server.id
      else
        @errors = @server.errors
        render :action => :new
      end
    end
    
    # Shows the form to edit a persisted server
    # GET http://francismb.com/server/ID/edit
    def edit
      @server = Server.find(params[:id])
    end
    
    # Processes the form sent from the action #edit and
    # updates the server if the information is valid.
    # PUT http://francismb.com/server/ID
    def update
      @server = Server.find(params[:id])
      @server.content = params[:server][:content]
      if @server.save
        redirect_to :action => :show, :id => @server.id
      else
        @errors = @server.errors
        render :action => :edit
      end
    end

end
