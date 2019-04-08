class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def index
    @comment = current_user.comment
  end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    comment.lines = lines_params[:lines]

    if comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end
  end

private
  #ストロングパラメータ実装
  def lines_params
    params.require(:comment).permit(:lines)
  end
end
