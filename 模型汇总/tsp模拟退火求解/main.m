%cityXY = rand(2, 31);
%x = TSPSA(cityXY, 100, 0.5, 4000, 1000);

%cityXY = rand(2, 71);
%x = TSPSA(cityXY, 100, 0.5, 4000, 20);

%cityXY = rand(2, 101);
%x = TSPSA(cityXY, 100, 0.5, 4000, 20);

%cityXY = rand(2, 101);
%x = TSPSA(cityXY, 100, 0.5, 4000, 40);

load cityXY;
x = TSPSA(cityXY, 25, 0.95, 2500, 1000);

hold off;
plotcities(x);
axis equal;