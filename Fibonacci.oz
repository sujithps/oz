local Fib in
   fun {Fib N}
      local FibAux in
	 fun {FibAux N Acc1 Acc2}
	    if N==0 then Acc1
	    elseif N<2 then Acc2
	    else
	       local Y in
		  Y = Acc1 + Acc2 
		  {FibAux N-1 Acc2 Y}
	       end
	       
	    end
	 end
	 {FibAux N 0 1}
      end
   end
   {Browse { Fib 1000}}   
end
