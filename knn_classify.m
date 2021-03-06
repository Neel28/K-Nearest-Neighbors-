function [new_accu, train_accu] = knn_classify(train_data, train_label, new_data, new_label, K)
% k-nearest neighbor classifier
% Input:
%  train_data: N*D matrix, each row as a sample and each column as a
%  feature
%  train_label: N*1 vector, each row as a label
%  new_data: M*D matrix, each row as a sample and each column as a
%  feature
%  new_label: M*1 vector, each row as a label
%  K: number of nearest neighbors
%
% Output:
%  new_accu: accuracy of classifying new_data
%  train_accu: accuracy of classifying train_data (using leave-one-out
%  strategy)
%
% CSCI 567: Machine Learning, Spring 2016, Homework 1

new_accu = 0;
train_accu = 0;

[data_train, normData_train] = catToNum1(train_data);
[data_test, normData_test] = catToNum1(new_data);

[classify_test , new_accu] = k_classifyTest1(data_train,normData_train,data_test,normData_test,K,0);

[classify_train, train_accu] = k_classifyTest1(data_train,normData_train,data_train,normData_train,K,1);

end


