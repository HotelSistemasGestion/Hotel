class AccountingReportController < ApplicationController
  helper_method :nombre_cuenta
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

       while $cont2  <@ledgers.count do  
       if(@ledgers[$cont2].accounting_account_id ==@array_cuenta[$cont2])
         @algo[$cont2]=@ledgers[$cont2]
       end   
     $cont2 +=1      
     end

  	 end

  def balance
  	 @balances = AccountXEntry.search_conta(params[:search_conta])
  	 $cont=0
      $cont2=0
  	 @array_cuenta=[]
  	 @array_filtrar=[]
  	 @algo=[]
  	 while $cont<@balances.count do 
	  	 @array_cuenta[$cont]=@balances[$cont].accounting_account_id  	
	  	 $cont +=1  	 	
  	 end

  	  @array_filtrar=@array_cuenta.uniq

       while $cont2<@balances.count do  
       if(@balances[$cont2].accounting_account_id ==@array_cuenta[$cont2])
         @algo[$cont2]=@balances[$cont2]
       end   
     $cont2 +=1      
     end
  end

  def nombre_cuenta(name)
   arr_juntar=name.split(' ')
    cont_juntar=0
    juntar=''
      while cont_juntar<arr_juntar.count
          juntar += arr_juntar[cont_juntar]
            cont_juntar+=1
      end
      return juntar
  end
end
