class LedgerController < ApplicationController
  def mayor
  	 @ledgers = AccountXEntry.all
  	 $cont=0
  	 @array_cuenta=[]
  	 @array_filtrar=[]
  	 @algo=[]
  	 while $cont<@ledgers.count do 
	  	 @array_cuenta[$cont]=@ledgers[$cont].accounting_account_id  	
	  	 $cont +=1  	 	
  	 end

  	  @array_filtrar=@array_cuenta.uniq
    
     @algo=AccountXEntry.where("accounting_account_id": @array_cuenta)


  	 end

end
