class BlogpostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_blog_post, except: %i[index new create]

  def index
    @blogpost = Blogpost.all
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(blogpost_params)
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
    params.require(:blogpost).permit(:title, :body)
  end

  def set_blog_post
    @blogpost = Blogpost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
