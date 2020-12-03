%Zero filling for the interpolation
function [r] = zero_fill_interp(mat, order)
    [numRows,numCols] = size(mat);
    b = order-1;
    r = zeros(numRows*order, numCols*order);
    for i=1:numRows
        for j=1:numCols
            r(order*i-b, order*j-b) = mat(i, j);
        end
    end
end