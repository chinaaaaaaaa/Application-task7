class FavoritesController < ApplicationController
    
 def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.create(user_id: current_user.id, book_id: params[:id])
    favorite.save
    
 end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.find_by(user_id: current_user.id, book_id: params[:id]).destroy
    favorite.destroy
    
  end
  
  private
  
  def book_params
   @book = Book.find(params[:id])
  end
end
