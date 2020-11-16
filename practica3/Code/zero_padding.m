%Zero padding function to fill with zeros a matrix

function [m] = zero_padding(original_m, final_size)
    original_m(final_size, final_size)=0;
    m=original_m;
end