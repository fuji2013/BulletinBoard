class BoardsController < ApplicationController
  PER = 10
  before_action :set_board, only: [:show]

  def show
    comments_all = Comment.where(board: params[:id]).order(:updated_at)

    @owner_first_comment = comments_all.limit(1).first
    @comments = nil
    if comments_all.size > 1
      @comments = comments_all.offset(2).page(params[:page]).per(PER)
    end
  end

  def new
    @categories = Category.all
    @board = Board.new
    @comment = Comment.new
  end

  def create
    @board = Board.new(board_params)
    @comment = Comment.new(board: @board, text: comment_params[:text], commentator: board_params[:owner] )
    @board.comments = [@comment]

    if @board.save
      redirect_to root_path
    end
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:category_id, :title, :owner)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
