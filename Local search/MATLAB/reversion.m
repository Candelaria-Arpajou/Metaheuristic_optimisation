function [ new_path ] = reversion( path )
new_path = path;
indexes = randperm(size(new_path,2),2);
i1 = indexes(1);
i2 = indexes(2);
if i1 < i2
    new_path(i1:i2) = path(i2:-1:i1);
else
    new_path(i1:-1:i2) = path(i2:i1);
    
end
end

