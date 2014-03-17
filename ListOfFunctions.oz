declare
fun {FunnyFunc FunL L}
    case L of H|T then {FunL.1 H}|{FunnyFunc FunL.2 T}
    else nil
    end
end

proc {Test FunL L SolL}
   {Browse {FunnyFunc FunL L  } == SolL}
end

fun {Square X}
   X*X
end

fun {Double X}
   X*2
end

fun {Triple X}
   X*3
end
local FunL L SolL in
   FunL=[Square Double Triple]
   L=[1 2 3]
   SolL=[1 4 9]
   {Test FunL L SolL}
end
