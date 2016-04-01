class WelcomeController < ApplicationController
  PER = 10

  def index
    @boards = Board.page(params[:page]).per(PER)
  end
end
