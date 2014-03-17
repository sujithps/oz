declare
fun {IsList L}
   case L
   of H|T then true
   [] nil then true
   [] H then false
   end

end
{Browse {IsList [[5]]}}
