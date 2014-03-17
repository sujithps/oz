declare
fun {Transform L}
   case L
   of nil then nil
   [] Y|E then
      local N F T R IsList FillList U  in
	 N=L.1
	 F=L.2.1
	 T=L.2.2.1
	 R= {Record.make N F}
	 
	 fun {IsList M}
	    case M
	    of H|P then true
	    [] nil then true
	    [] H then false
	    end
	 end
	 
	 fun {FillList C A B}
	    if B == nil then C
	    elseif  A == nil then C
	    else
	       
	       case A
	       of H|P then
		  {FillList {AdjoinAt C H {Transform B.1}} P B.2}
	       [] nil then
		  C
	       [] H then C
	       end
	    end
	 end      
	 
	 
	 {FillList R F T}
	 
      end
   [] Y then Y 
   end
end

{Browse {Transform [a [c] [[b [c] [d] ] 2 1]]}}
