class CopiesController < ApplicationController
  def index
    @copies = Copy.all
  end

  def show
  end

  def create
    @book = Book.find(params[:book_id])
    @book = @book.copies.create(comment_params)
    redirect_to book_path(@book)
  end

  private
  def comment_params
    params.require(:copy).permit(:Borrower, :DueDate)
  end
end
