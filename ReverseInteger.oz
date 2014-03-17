local MainMirror in
   fun {MainMirror Int}
      local Mirror in
	   local Length Pow in
	     fun {Length X A}
	        if X==0 then A
	        else
		       {Length (X div 10) A+1}
	       end
	     end
	     fun {Pow M N}
	       if N==0 then 1
	       else
		  M*{Pow M N-1}
	       end
	     end
	     fun {Mirror Int Acc}	       
	       if {Length Int 0}==0 then Acc
	       else
		       {Mirror (Int div 10) ((Acc*10)+(Int mod 10)) }    
	       end 
	     end
	 end
	 {Mirror Int 0}
      end
   end
   {Browse {MainMirror 12345}}
end
