function [T, index] = filter_weight_fib_abs (tab, idx, percent)

    

    T = cell(1, length(percent));
    index = cell(1, length(percent));

    for p = 1:size(percent,2)
        num = int16(length(tab)*percent(p)/100);
        index{p} = idx(1:num);
        T{p} = tab(index{p});
    end
end