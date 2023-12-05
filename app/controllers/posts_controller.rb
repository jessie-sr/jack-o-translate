class PostsController < ApplicationController
    before_action :authenticate_user!
  
    def index
        if params[:user_filter] == 'mine'
          @posts = current_user.posts
        else
          @posts = Post.all
        end
      
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

    def edit
        @post = current_user.posts.find(params[:id])
        # This ensures that users can only edit their own posts
    end

    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Your post has been updated."
            redirect_to @post
        else
            render :edit
        end
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
  