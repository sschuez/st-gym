class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ] 

  def index
    @posts = policy_scope(Post).ordered
  end

  def new
    @post = Post.new
    authorize @post
  end
   
  def create
    @post = Post.new(post_params)
    authorize @post

    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
  end

  def edit
  end

  def update
    post_params_with_image = post_params[:image] == "" ? post_params.except(:image) : post_params
    if @post.update(post_params_with_image)
      redirect_to post_path(@post)
      flash[:notice] = "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Post #{@post.title} was successfully destroyed." }
      format.html { redirect_to posts_path, notice: "Post was successfully destroyed." }
    end
  end

  def publish
    @post = Post.find(params[:id])
    authorize @post, :update?

    @post.toggle!(:published)
    state = @post.published? ? "published" : "unpublished"

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Post #{@post.title} was successfully #{state}." }
      format.html { redirect_to post_path(@post), notice: "Post was successfully published." }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(
      :title, 
      :subtitle, 
      :body, 
      :image, 
      :published
    )
  end
end