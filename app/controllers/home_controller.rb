class HomeController < ApplicationController
  def index
    @book = Book.first
  end
end
