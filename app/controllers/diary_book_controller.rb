
class DiaryBookController < ApplicationController
  def diario

    @diary_books =	AccountXEntry.search(params[:search])
	      respond_to do |format|
		     
		       format.html 
		       format.json { head :no_content }
		       format.js  
		  
		       
		    
		    
	    end
    end
end
