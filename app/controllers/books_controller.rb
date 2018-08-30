class BooksController < ApplicationController
before_action :authenticate_user!, only: [:top, :index, :show, :edit]

 def index
     @book = Book.new
     @books = Book.all
     @user = current_user
 end

  def new
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    a = @book.user_id
    b = current_user.id
    @user = current_user
    if a.to_i == b.to_i
    else
      redirect_to user_path
    end

    # if user = User.find(params[:id]) 
    #   current_user.id = @book.user_id
    #   redirect_to user_path
    # else
    #     @book = Book.find(params[:id])
    #     @user = @book.user
    #   end

  end

  def show
        @book = Book.find(params[:id])
        p '----id'
        p @book
        p @book.user_id

        @user = User.find(@book.user_id)
        p '----@user'
        p @user
  end

  def create
       @book = Book.new(post_params)
       @book.user_id = current_user.id
       if @book.save
      redirect_to book_path(@book.id), notice: 'successfully'
    else
      @user = current_user
      @userbook = @user.books
      p @book.errors.full_messages
      render  template: "users/show"

    @books = Book.all
    end
  end

    def update
        book = Book.find(params[:id])
        book.update(post_params)
        redirect_to book_path(book.id), notice: 'successfully'
    end

    def destroy
      book = Book.find(params[:id])
        book.destroy
        redirect_to user_path(current_user)
    end
    
 private

  def post_params
      params.require(:book).permit(:title, :body)
  end

end