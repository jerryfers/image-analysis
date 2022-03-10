function [M] = smooth(M2, m, n)


M3 = zeros(m,n);

for p = 1:m
    for q = 1:n
        try
            nb = 0;
            seg = 0;
            if M2(p + 1,q) > 0
                nb = nb + 1;
                seg = M2(p + 1,q);
            end
            if M2(p - 1,q) > 0
                nb = nb + 1;
                seg = M2(p - 1,q);
            end
            if M2(p,q + 1) > 0
                nb = nb + 1;
                seg = M2(p,q + 1);
            end
            if M2(p,q - 1) > 0
                nb = nb + 1;
                seg = M2(p,q - 1);
            end
            if M2(p,q) > 0
                if nb < 2
                    M3(p,q) = -1;
                end
            else
            end
        catch
        end
    end
end

for p = 1:m
    for q = 1:n
        if M3(p,q) == -1
            M2(p,q) = 0;
        end
    end
    
 for p = 1:m
    for q = 1:n
        try
            nb = 0;
            seg = 0;
            if M2(p + 1,q) > 0
                nb = nb + 1;
                seg = M2(p + 1,q);
            end
            if M2(p - 1,q) > 0
                nb = nb + 1;
                seg = M2(p - 1,q);
            end
            if M2(p,q + 1) > 0
                nb = nb + 1;
                seg = M2(p,q + 1);
            end
            if M2(p,q - 1) > 0
                nb = nb + 1;
                seg = M2(p,q - 1);
            end
                if nb == 4
                    M2(p,q) = seg;
                end
        catch
        end
    end
end

M = M2;
    
end

