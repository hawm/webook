class BookmarksController < ApplicationController
  
  def toggle
    bookmark = @current_user.bookmarks.find_or_initialize_by(book_id: params[:book_id])
    url = book_url(bookmark.book)
    if bookmark.new_record?
      redirect_to url, notice: 'Bookmark toggled' if bookmark.save
    elsif bookmark.destroy
      redirect_to url, alert: 'Bookmark toggled', status: :unprocessable_entity
    else
      redirect_to url, alert: 'Unknow error', status: :unprocessable_entity
    end
  end

end
