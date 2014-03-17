declare
fun {Append L1 L2 }
   case L1
   of nil then  L2
   [] H|T then H|{Append T L2}
   end
end

{Browse { Append [1 2 3 4] [5 6]}}



{Browse {Fact 5}}
