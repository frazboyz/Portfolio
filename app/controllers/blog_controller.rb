class BlogController < ApplicationController

  layout "application", :only => [:index, :show]
  layout "admin", :only => [:new, :create, :delete, :destroy]
  before_action :require_authentication, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def create
    post = Post.new(post_params)
    if post && post.save
      flash[:message] = "Post created sucessfully"
      redirect_to :controller => :admin, :action => :blogs
    else
      flash[:error] = "Could not create post"
      render :new
    end
  end

  def edit
  end

  def update
    post = Post.find_by_id(params[:id])
    if post
      post.update(:title => params[:title], :content => params[:content])
      flash[:message] = "Post updated sucessfully"
      redirect_to :controller => :admin, :action => :blogs
    else
      flash[:error] = "Could not update post"
      render :edit
    end
  end

  def destroy
    post = Post.find_by_id(params[:id])
    if post
      post.destroy
      flash[:message] = "Post sucessfully deleted"
    else
      flash[:error] = "Was not able to find post"
    end
    redirect_to :controller => :admin, :action => :blogs
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
