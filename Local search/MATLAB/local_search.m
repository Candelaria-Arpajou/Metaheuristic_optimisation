function [optimal_distance,best_path] = local_search(p_matrix,path);

figure('units','normalized','outerposition',[0 0 1 1]);
whitebg([1 1 0.8])
titles = ['insercion','exchange','reversion','combination'];
for a=1:4;

    current_path = path;
    best_path = current_path;

    current_distance = distance(p_matrix, path);
    initial_distance = current_distance;
    optimal_distance = initial_distance;

    MAX_ITER = 1000;
    ITER = 1;
    ID=zeros(MAX_ITER,2);
    ID(ITER,1)= ITER;
    ID(ITER,2) = initial_distance;
    while ITER <= MAX_ITER;
        ITER = ITER+1;

        modified_path = perturbation(a, current_path ); 
        new_distance = distance(p_matrix, modified_path); 
        ID(ITER,1)= ITER;
        ID(ITER,2) = optimal_distance;

        if new_distance < current_distance;
            current_distance = new_distance;
            current_path = modified_path;

            %best_path = current_path;
            optimal_distance = new_distance;

            best_path = [current_path, current_path(1)];
            
            subplot(2,4,a);
            plot(p_matrix(1,best_path),p_matrix(2,best_path),'-.*')
            pause(0.1)
            drawnow
        end
    end

    subplot(2,4,(a+4));
    switch a
        case 1
            plot(ID(:,1),ID(:,2),'b-','linewidth',1.5);
        case 2
            plot(ID(:,1),ID(:,2),'-','color',[0.8500, 0.3250, 0.0980],'linewidth',1.5);
        case 3
            plot(ID(:,1),ID(:,2),'-','color',[0, 0.5, 0],'linewidth',1.5);
        case 4
            plot(ID(:,1),ID(:,2),'-','color',[0.4940, 0.1840, 0.5560],'linewidth',1.5);
end

axis([0 1200 0 15]);
xlabel('Iteration');
ylabel('Distance');

end
