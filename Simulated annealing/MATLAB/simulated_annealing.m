function [ best_path, best_distance ] = simulated_annealing( p_matrix, orden, T0)

figure('units','normalized','outerposition',[0 0 1 1]);
whitebg([1 1 0.8])

for a=1:4;
    MAX_ITER = 2000;
    ITER = 1;
    initial_distance = distance(p_matrix, orden);
    best_distance = initial_distance;
    new_orden = [orden, orden(1)];
    
    ID_ITER = [];

    betta = 1.2;
    alpha = 0.67;
    M = 5;
    T = T0;
    N_eval = 0;
    while ITER <= MAX_ITER
        for i=1:M   
            N_eval = N_eval + 1;
            pertub_orden = perturbation( a,orden ); 
            new_distance = distance(p_matrix, pertub_orden);
            delta_dist = new_distance - initial_distance;

            if or(delta_dist < 0.0, exp(-delta_dist/T)> rand(1))    
                orden = pertub_orden; 
                initial_distance = new_distance;
                new_orden = [pertub_orden, pertub_orden(1)]; 
                subplot(2,4,a);
                plot(p_matrix(1,new_orden),p_matrix(2,new_orden),'-*')
                drawnow
            end
            
            if new_distance < best_distance
                best_distance = new_distance;
                best_path = new_orden;
            end   
            
        ID_ITER = [ID_ITER;[N_eval initial_distance]];
        
        end
        T = alpha*T;
        M = ceil(M*betta);
        ITER = ITER+M;
    end
    
subplot(2,4,(a+4));
switch a
    case 1
        plot(ID_ITER(:,1),ID_ITER(:,2),'b-','linewidth',1.5);
        title('INSERTION','fontsize',14);
        %text(1,18,cellstr(strcat('Final distance: ',num2str(initial_distance))),'fontsize',10,'horizontalalignment','left');
        text(1,16,cellstr(strcat('Optimal distance: ',num2str(best_distance))),'fontsize',10,'horizontalalignment','left');
    case 2
        plot(ID_ITER(:,1),ID_ITER(:,2),'-','color',[0.8500, 0.3250, 0.0980],'linewidth',1.5);
        title('EXCHANGE','fontsize',14);
        %text(1,18,cellstr(strcat('Final distance: ',num2str(initial_distance))),'fontsize',10,'horizontalalignment','left');
        text(1,16,cellstr(strcat('Optimal distance: ',num2str(best_distance))),'fontsize',10,'horizontalalignment','left');
    case 3
        plot(ID_ITER(:,1),ID_ITER(:,2),'-','color',[0, 0.5, 0],'linewidth',1.5);
        title('REVERSION','fontsize',14);
        %text(1,18,cellstr(strcat('Final distance: ',num2str(initial_distance))),'fontsize',10,'horizontalalignment','left');
        text(1,16,cellstr(strcat('Optimal distance: ',num2str(best_distance))),'fontsize',10,'horizontalalignment','left');
    case 4
        plot(ID_ITER(:,1),ID_ITER(:,2),'-','color',[0.4940, 0.1840, 0.5560],'linewidth',1.5);
        title('COMBINATION','fontsize',14);
        %text(1,18,cellstr(strcat('Final distance: ',num2str(initial_distance))),'fontsize',10,'horizontalalignment','left');
        text(1,16,cellstr(strcat('Optimal distance: ',num2str(best_distance))),'fontsize',10,'horizontalalignment','left');
end

axis([0 2000 0 20]);
xlabel('Iteration');
ylabel('Distance');

end

