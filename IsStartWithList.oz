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
   else false
   end
end

{Browse {Prefix [1 2] [1 2]}}
