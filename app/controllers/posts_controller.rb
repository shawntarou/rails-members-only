class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authorize_creator, only: %i[ edit update ]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
    if current_user.id == @post.user_id
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to @post
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_post
      @post = Post.find(params.expect(:id))
  end

  def post_params
    params.expect(post: [ :title, :body ])
  end

  def authorize_creator
    unless @post.user == current_user
      redirect_to posts_path, alert: "You are not authorized to edit this post."
    end
  end
end
