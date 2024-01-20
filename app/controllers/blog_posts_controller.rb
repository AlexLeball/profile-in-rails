class BlogPostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  def new
    @blog_post = BlogPost.new
  end
  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to blog_post_path(@blog_post)
    else
      render :new
    end
  end

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  # def edit
  #   @blog_post = BlogPost.find(params[:id])

  # end

  # def update
  #   @blog_post = BlogPost.find(params[:id])
  # end
private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end

end
