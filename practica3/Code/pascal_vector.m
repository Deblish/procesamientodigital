%Function that retrieves a vector from Pascal's triangle level

function [row] = pascal_vector(m)
    if m == 1
        row = 1;
    elseif m == 2;
        row = [1 1];
    else
        row = [1,1];
          for i=2:m-1
            row = conv([1 1],row);
          end
    end
end