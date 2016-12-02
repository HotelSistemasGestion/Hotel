
class DiaryBookController < ApplicationController
  def diario

    @diary_books =	AccountXEntry.search_conta(params[:search_conta])

	      respond_to do |format|
		     
		       format.html 
		       format.json { head :no_content }
		       format.js        
		    
	    end
    end

end
