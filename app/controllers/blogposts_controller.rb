class BlogpostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_blog_post, except: %i[index new create]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    @blogpost = Blogpost.all
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @blogpost = current_user.blogposts.build
  end

  def create
    @blogpost = current_user.blogposts.build(blogpost_params)
    if @blogpost.save
      redirect_to @blogpost, notice: "Blog post created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update(blogpost_params)
      redirect_to @blogpost
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.destroy
      redirect_to root_path, notice: "Blog post deleted!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(:title, :body, :is_draft, :user_id)
  end

  def set_blog_post
    @blogpost =
      (
        if user_signed_in?
          Blogpost.find(params[:id])
        else
          Blogpost.draft.find(params[:id])
        end
      )
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def authorize_user!
    unless current_user == @blogpost.user
      redirect_to root_path,
                  alert: "You are not authorized to perform this action."
    end
  end
end
