declare
fun {Prefix L1 L2}
   case L1
   of nil then true
   [] H|T then
      case L2
      of M|N then 
	 if H==M then {Prefix T N}
	 else false end
      [] nil then false
      end
   [] H then {Prefix [H] L2}
   end
end

declare
fun {FindString L1 L2}
   if L1==nil then true
   elseif L2==nil then false
   elseif L1==L2 then true
   else
      case L1
      of nil then true
      [] H|T then
	 if {Prefix H L2} then {FindString T L2.2}
	 else
	    {FindString L1 L2.2}
	 end
      end
   end
end
{Browse {FindString [[d e f]] [a b c [d e f]]}}
