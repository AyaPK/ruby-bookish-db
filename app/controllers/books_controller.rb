require 'httparty'
class BooksController < ApplicationController
  # before_action :authenticate_user!

  def index
        @books = Book.all
    puts "a"
    if params[:search_bar_used] && params[:search_bar_used] != ""
      @books.map do |x|
        puts params[:search_bar_used]
      end

      @books = @books.select do |x|
        x.Title.downcase.include?(params[:search_bar_used].downcase) || x.Author.downcase.include?(params[:search_bar_used].downcase)
      end
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    if params[:google_book_search] && params[:google_book_search] != ""
      url = "https://www.googleapis.com/books/v1/volumes?q=#{params[:google_book_search]}&maxResults=15&key=#{ENV["GOOGLE_API_KEY"]}"
      response = HTTParty.get(url)
      @results = response.parsed_response
    end
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    @book.Title = @book.Title.split.map { |x| x.capitalize }.join(" ")
    @book.Author = @book.Author.split.map { |x| x.capitalize }.join(" ")

    if @book.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit, :status, :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path, status: :see_other
  end

  def search

  end

  private
  def book_params
    params.require(:book).permit(:Title, :Author, :ISBN, :cover, :imageUrl)
  end
end
