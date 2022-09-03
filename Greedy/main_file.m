N_cities = 25;
XY = position_matrix(N_cities);
hold on
scatter(XY(1,:),XY(2,:))
dist_XY = distance_matrix(XY);
[opt_path,total_dist] = Greedy(XY,dist_XY)
hold off
