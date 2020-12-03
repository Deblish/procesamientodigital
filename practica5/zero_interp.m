
function [r] = zero_interp(mat, n)
    kernel = ones(1, n+1);
    kernel(n+1)=0;
    ra = zero_fill_interp(mat, n);
    numRows = size(ra, 1);
    r = zeros(size(ra, 1)+n, size(ra, 2)+n);
    for i=1:numRows
       if mod(i, n)==1
            aux = conv(kernel, ra(i, :));
       end
       r(i,:)=aux;
    end
    r=r(1:size(ra, 1),1:size(ra,2));
end