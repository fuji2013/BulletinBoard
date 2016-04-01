class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.board_id = params[:board_id]

    if comment.save
      flash[:notice] = "コメントを登録しました"
      head 201
    else
      render json:{messages: comment.errors.full_messages}, status: 422
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :commentator)
  end
end
