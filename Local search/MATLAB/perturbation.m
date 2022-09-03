function [recorrido_perturbado]=perturbation(a,recorrido_actual)

switch a
    case 1
[recorrido_perturbado]=insercion(recorrido_actual); 
    case 2
[recorrido_perturbado]=exchange(recorrido_actual);
    case 3
[recorrido_perturbado]=reversion(recorrido_actual);
    case 4
[recorrido_perturbado]=combination(recorrido_actual);
end

