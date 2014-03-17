local Prime in
   fun {Prime N}
      local Loop in
	 fun {Loop S N A}
	    if S > (N div 2) then A
	    else
	       if A ==0 then 0
	       else
		  {Loop S+1 N (N mod S)}
	       end
	    end
	 end
	 if N <2 then 1
	 else
	    {Loop 2 N 1}
	 end
      end
   end
   {Browse {Prime 01}==1}
end
