function [modified_path]=perturbation(a,current_path)

switch a
    case 1
[modified_path]=insertion(current_path); 
    case 2
[modified_path]=exchange(current_path);
    case 3
[modified_path]=reversion(current_path);
    case 4
[modified_path]=combination(current_path);
end

