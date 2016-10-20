class DiaryBookController < ApplicationController
  def diario
    @diary_books = AccountXEntry.all
    respond_to do |format|
      format.js
    end
   


  end

end
