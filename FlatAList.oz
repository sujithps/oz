declare
fun {FlattenList L}
   local IsList Flat in
      fun {IsList W}
	 case W
	 of Q|E then true
	 [] nil then true
	 [] Q then false
	 end
      end
      
      fun {Flat Y R}
	 case Y
	 of H|T then
	    if {IsList H} then {Flat T {Append R {Flat H nil}}}
	    else
	       {Flat T {Append R [H]}}
	    end	   
	 [] nil then R
	 [] M then {Append R [M] }
	 end
      end
      {Flat L nil}
   end
end
{Browse {FlattenList 5}}
