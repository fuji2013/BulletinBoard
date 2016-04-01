class BoardsController < ApplicationController
  PER = 10
  before_action :set_board, only: [:show]

  def show
    @owner_first_comment = Comment.where(board: params[:id]).order(:updated_at).limit(1).first
    @comments = Comment.where(board: params[:id]).order(:updated_at).offset(2).page(params[:page]).per(PER)
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end
end
