class PostsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @posts = current_user.posts
  
      if params[:time_filter] == 'day'
        @posts = @posts.where('created_at >= ?', 1.day.ago)
      elsif params[:time_filter] == 'week'
        @posts = @posts.where('created_at >= ?', 1.week.ago)
      end
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = current_user.posts.new(post_params) 
      if @post.save
        redirect_to @post
      else
        render :new
      end
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def destroy
      @post = current_user.posts.find(params[:id])
      @post.destroy
      flash[:notice] = "Post deleted."
      redirect_to posts_path
    end
  
    private
  
    def post_params
      params.require(:post).permit(:content, :language)  # Customize as needed
    end
  end
  