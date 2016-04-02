class BoardsController < ApplicationController
  PER = 10
  before_action :set_board, only: [:show, :update]

  def show
    comments_all = Comment.where(board: params[:id]).order(:updated_at)

    @owner_first_comment = Comment.where(board: params[:id]).order(:updated_at).first

    @comments = Comment
                  .where(board: params[:id]).order(:updated_at)
                  .where.not(id: @owner_first_comment.id)
                  .page(params[:page]).per(PER)
  end

  def new
    @categories = Category.all
    @board = Board.new
    @board.comments.build
  end

  def create
    @board = Board.new(board_params)
    @board.comments.each do |comment|
      comment.commentator = board_params[:owner]
    end

    respond_to do |format|
      if @board.save
        format.html { redirect_to root_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @board.update(board_params)
      flash[:notice] = "コメントを登録しました"
      head 201
    else
      render json:{messages: board.errors.full_messages}, status: 422
    end
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:category_id, :title, :owner,
                                   comments_attributes: [
                                    :id,
                                    :text,
                                    :commentator
                                    ])
  end
end
