function shll = shift_left(a, b, w32)
    shl = xl_lsh(a, b);
    if (w32 && b >= 32)
        shl = 0;
    else
        if(~w32 && b >= 16)
            shl = 0;
        end
    end
    
    if(~w32)
        shl = shl & x0000ffff;
    end
    shll = shl;