
function [r] = linear_interp(mat, n)
    kernel = ones(1, 2*n-1);
    x=1;
    for i=1:size(kernel,2)
        kernel(i)=x;
        if i<n
            x = x+1;
        elseif i>=n
            x = x-1;
        end
    end
    kernel = kernel/n;
    
    mat_a = zero_fill_interp(mat, n);

    r=conv2(kernel.', kernel, mat_a);
end