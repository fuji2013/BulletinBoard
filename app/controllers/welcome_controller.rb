class WelcomeController < ApplicationController
  PER = 10

  def index
    @boards = Board.order("updated_at DESC"). page(params[:page]).per(PER)
  end
end
