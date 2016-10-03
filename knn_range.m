function [accuracies,data_train,normData_train,data_test, normData_test,data_val, normData_val,train_class,test_class,val_class] = knn_range(data_train, data_test, data_val)

[data_train, normData_train] = catToNum1(data_train);
[data_test, normData_test] = catToNum1(data_test);
[data_val, normData_val] = catToNum1(data_val);


[test_class] = k_classifyTest2(data_train, normData_train, data_test, normData_test,0);
[train_class] = k_classifyTest2(data_train, normData_train, data_train, normData_train,1);
[val_class] = k_classifyTest2(data_train, normData_train, data_val, normData_val,0);


accuracies = zeros(8,3);

accuracies =[cal_accu(train_class,data_train),cal_accu(test_class,data_test),cal_accu(val_class,data_val)];

end