function shrl = shift_right(a, b, w32, is_signed)
    shr = 0;
    if (w32 == 1 && b >= 32)
        if (is_signed == 1 && a < 0)
            shr = xfix({xlUnsigned,32,0},4294967295);
        else
            shr = 0;
        end
    else
        if (w32 == 0 && b >= 16)
            if (is_signed == 1 && a < 0)
                xfix({xlUnsigned,32,0},65535);
			else
				shr = 0;
            end
        else
            if (is_signed == 1)
                if (w32 == 1)
                    sa = xfix({xlSigned, 32, 0}, a);
                    shr = xl_concat(zeros(1, 32-xl_nbits(sa)), xl_slice(sa, 31, xl_nbits(sa)));
                else
                    sa = xfix({xlSigned, 16, 0}, a);
                    shr = xl_concat(zeros(1, 16-xl_nbits(sa)), xl_slice(sa, 16, xl_nbits(sa)));
                end
            else
                shr = xl_rsh(a, b);
            end
        end
    end
    shrl = shr;