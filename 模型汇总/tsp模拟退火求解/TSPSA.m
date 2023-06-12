function s = TSPSA(cityXY, T0, a, MAXIT, N)
    k = 0;
    t = T0;
    x = cityXY;
    n = length(x);
    xs = x;
    ds = distance(xs);
    b = 0;
    for i = 1:N
        while (k < MAXIT)
            dx = distance(x);
            if (dx < ds)
                xs = x;
                %ds = distance(xs);
                ds = dx;
            end
            y = swapcities(x);
            dy = distance(y);
            h = min(1, exp(-(dy - dx)/t));
            U = rand();
            if (U < h)
                x = y;
                b = b + 1;
            end
            k = k + 1;
        end
        t
        b/4000
        b = 0;
        %x = xs;
        distance(x)
        %t = t * a;
        t = t * (1 - 1 / (50 + log(i)));
        k = 0;
    end
    s = xs;
end


