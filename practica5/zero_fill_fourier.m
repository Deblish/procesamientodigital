%Zero filling for the interpolation in Fourier
function [r] = zero_fill_fourier(mat, order)
    [numRows,numCols] = size(mat);
    r = complex(zeros(numRows*order, numCols*order));
    ri = ceil(numRows/order)+1;
    rf = ceil(numRows+numRows/order);
    ci = ceil(numCols/order)+1;
    cf = ceil(numCols+numCols/order);
    r(ri:rf, ci:cf) = mat;
end