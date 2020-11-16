%function to generate square gussian filter of size x

function [m]=generate_filter(size)
    A=pascal_vector(size);
    B=A.';
    m=B*A;
    m=m/sum(sum(m));
end