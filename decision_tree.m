function [gini_accu,ce_accu] = decision_tree(train_data , new_data , val_data)

[data_train, normData_train] = catToNum1(train_data);
[data_test, normData_test] = catToNum1(new_data);
[data_val, normData_val] = catToNum1(val_data);

label_train = data_train(:,22);
label_test = data_test(:,22);
label_val = data_val(:,22);

normData_train = normData_train(:,1:21);
normData_test = normData_test(:,1:21);
normData_val = normData_val(:,1:21);

[g_train, ce_train] = tree_accu(normData_train, label_train); 
[g_test, ce_test] = tree_accu(normData_test, label_test); 
[g_val, ce_val] = tree_accu(normData_val, label_val); 

gini_accu = [g_train , g_test , g_val];
ce_accu = [ce_train , ce_test , ce_val];

end


