class DiaryBookController < ApplicationController
  def diario
    @diary_books = AccountXEntry.all

 
  end


end
