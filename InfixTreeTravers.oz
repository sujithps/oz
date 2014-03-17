declare
fun {Infix Tree}
   local GetList  in
      fun {GetList T L}
	 local A B C  in
	 if T == leaf then L
	 else
	    A = {GetList T.left L}	    
	    B = {GetList T.right L}
	   C=[ T.1]
           { Append {Append {Append L A} C} B} 
          %	   {Append A B }
	 end
	 end
      end
      {GetList Tree nil}
   end
end
   
local T in
   T=btree(4 left:btree(2 left:btree(1 left:leaf right:leaf) right:btree(3 left:leaf right:leaf))  right:btree(5 left:leaf right:leaf))
      
   
   {Browse {Infix T}}
end
