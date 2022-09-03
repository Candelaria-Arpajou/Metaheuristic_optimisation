function [ path_list,total_distance ] = Greedy(p_matrix, distance_matrix )
n_cities = length(distance_matrix);
copy_d_matrix = distance_matrix;
initial_city = randi([1,n_cities]);
next_city = initial_city;
path_list = [initial_city];
list_distances = [];

for i = 1:n_cities-1
    [min_value,min_index] = min(copy_d_matrix(next_city,:));
    list_distances(i) = min_value;
    
    copy_d_matrix(next_city,:) = inf;
    copy_d_matrix(:,next_city) = inf;
    
    path_list(i+1) = min_index;
    next_city = min_index;
    plot(p_matrix(1,path_list),p_matrix(2,path_list),'-')
    pause(0.5)
    drawnow
end
path_list(end + 1) = path_list(1);
list_distances(end + 1) = distance_matrix(path_list(end),path_list(end-1));
plot(p_matrix(1,path_list),p_matrix(2,path_list),'-')
total_distance = sum(list_distances);

end

