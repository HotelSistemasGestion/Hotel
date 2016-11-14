class LedgerController < ApplicationController
  def mayor
  	 @ledgers = AccountXEntry.search_conta(params[:search_conta])
  	 $cont=0
      $cont2=0
  	 @array_cuenta=[]
  	 @array_filtrar=[]
  	 @algo=[]
  	 while $cont<@ledgers.count do 
	  	 @array_cuenta[$cont]=@ledgers[$cont].accounting_account_id  	
	  	 $cont +=1  	 	
  	 end

  	  @array_filtrar=@array_cuenta.uniq

       while $cont2<@ledgers.count do  
       if(@ledgers[$cont2].accounting_account_id ==@array_cuenta[$cont2])
         @algo[$cont2]=@ledgers[$cont2]
       end   
     $cont2 +=1      
     end

  	 end

end
