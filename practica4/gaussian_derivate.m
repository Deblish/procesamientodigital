%Retrieves a matrix based in the derivate nth of the gaussian 
%function (given by pascal's triangle level)
function [derivate] = gaussian_derivate(level, n)
    if n == 0
        derivate = pascal_vector(level);
    elseif n>0
        derivate = conv([1 -1], gaussian_derivate(level, n-1));
    end
end