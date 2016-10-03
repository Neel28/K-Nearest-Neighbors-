function [gini, ce] = tree_accu(data, label)

gini = zeros(10,1);
ce = zeros(10,1);
for leaves = 1:10
    tree = ClassificationTree.fit(data,label,'prune','off','MinLeaf',leaves,'SplitCriterion','gdi');
    prediction = predict(tree,data);
    
    num = 0;
    for row=1:size(data,1)
        if prediction(row,1)==label(row,1)
            num = num+1;
        end
    end
    
    gini(leaves,1) = (num*100)/size(data,1);  
end

for leaves = 1:10
    tree = ClassificationTree.fit(data,label,'prune','off','MinLeaf',leaves,'SplitCriterion','deviance');
    prediction = predict(tree,data);
    
    num = 0;
    for row=1:size(data,1)
        if prediction(row,1)==label(row,1)
            num = num+1;
        end
    end
    
    ce(leaves,1) = (num*100)/size(data,1);  
end


end