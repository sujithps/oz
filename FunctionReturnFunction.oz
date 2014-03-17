declare
fun {Build D C}
   fun {$ H}
      local Temp in
	 fun {Temp S E W}
	    case S
	    of Q|A then
	       if Q == W then E.1
	       else
		  {Temp A E.2 W}
	       end
	    [] nil then 'bottom'
	    [] Q then
	       if Q == W then E.1
	       else
		  'bottom1'
	       end
	    end
	 end
	 {Temp D C H}
      end
   end
end

local F D C in
   D= [1 2 3]
   C =[~1 ~2 ~3]
   F={Build D C }
   {Browse { F 2 }} 
end
