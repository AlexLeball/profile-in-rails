class BlogPostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_blog_post, only: [:show, :edit, :update]
  helper_method :can_edit?


  def index
    @blog_posts = BlogPost.all
  end

  def show
    # Already set by before_action
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end

  def edit
    can_edit?
  end

  def update
    can_edit?
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Blog post was successfully updated.'
    else
      render :edit
    end
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :published_at, :photo)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def authorize_admin
    unless current_admin
      redirect_to root_path, alert: 'You do not have permission to perform this action.'
    end
  end

  def can_edit?
    current_admin.present?
  end
end
