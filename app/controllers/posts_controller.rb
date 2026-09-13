class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
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
end
