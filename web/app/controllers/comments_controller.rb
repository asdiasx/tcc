class CommentsController < ApplicationController
  before_action :select_post
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = @post.comments
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        new_comment_notification
        format.html { redirect_to post_url(@post), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: post_comment_url(@post, @comment) }
      else
        error_response(format)
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.post_id == @post.id && @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: post_comment_url(@post, @comment) }
      else
        error_response(format)
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.post_id == @post.id && @comment.destroy
        format.html { redirect_to post_url(@post), notice: "Comment was successfully destroyed." }
        format.json { head :no_content }
      else
        error_response(format)
      end
    end
  end

  private

  def set_comment
    id = params[:id]
    @comment = Comment.find(id)
  end

  def select_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: @post.id)
  end

  def error_response(format)
    format.html { render :edit, status: :unprocessable_entity }
    format.json { render json: @comment.errors, status: :unprocessable_entity }
  end

  def new_comment_notification
    job = NewCommentWorker.perform_in(1.seconds, @post.title, @comment.id)
    puts "===================="
    puts "Created job: #{job}"
    puts "===================="
  end
end
