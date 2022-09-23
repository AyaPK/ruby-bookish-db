class CopiesController < ApplicationController
  def index
    @books = Book.all
    @copies = Copy.all
  end

  def show
    #hgc
  end

  def create
    @book = Book.find(params[:book_id])
    @book = @book.copies.create(comment_params)
    redirect_to book_path(@book)
  end

  def destroy
    @copy = Copy.find(params[:id])
    @copy.destroy

    redirect_to copies_path, status: :see_other
  end

  private
  def comment_params
    params.require(:copy).permit(:Borrower, :DueDate)
  end
end
