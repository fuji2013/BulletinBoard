class WelcomeController < ApplicationController
  def index
    @boards = Board.all
  end
end
