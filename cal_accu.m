function [accu] = cal_accu(class,comp)

accu = zeros(8,1);

for k=1:8
    num = 0;
    for row=1:size(class,1)
        if class(row,k)==comp(row,22)
            num = num+1;
        end
    end
    accu(k,1) = (num*100)/size(class,1);
end