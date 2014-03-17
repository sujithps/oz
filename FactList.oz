declare
fun {Fact N}
   local FactInv in
      fun {FactInv N  L I}
	 if N==1 then  L.2
	 else
	   {FactInv N-1 {Append L  [ I*{Nth L {Length L}}] } I+1 }
	 end
      end
      {FactInv N+1 [1] 1}
   end
end
