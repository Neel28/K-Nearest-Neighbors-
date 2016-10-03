load buying_train.mat
load maint_train.mat
load doors_train.mat
load persons_train.mat
load lugg_train.mat
load safety_train.mat
load class_train.mat

load buying_test.mat
load maint_test.mat
load doors_test.mat
load persons_test.mat
load lugg_test.mat
load safety_test.mat
load class_test.mat

load buying_val.mat
load maint_val.mat
load doors_val.mat
load persons_val.mat
load lugg_val.mat
load safety_val.mat
load class_val.mat

load hw1boundary.mat

train_data = [buying_train,maint_train,doors_train,persons_train,lugg_train,safety_train,class_train];

new_data = [buying_test,maint_test,doors_test,persons_test,lugg_test,safety_test,class_test];

val_data = [buying_val,maint_val,doors_val,persons_val,lugg_val,safety_val,class_val];

[accuracy_test , accuracy_train] = knn_classify(train_data, class_train, new_data, class_test, 10);

%[accuracy_val , accuracy_train] = knn_classify(train_data, class_train, val_data, class_val, 2);

%[accuracy_val , accuracy_train] = knn_classify(train_data, class_train, val_data, class_val, 5);

%accuracy_test
%accuracy_train
%accuracy_val

%Decision tree

%Decision Boundary

%decsion_boundary()

%part b k range from 1-15
%train_data
%new_data which is test_data

%[accuracies,data_train,normData_train,data_test, normData_test,data_val, normData_val,train_class,test_class,val_class] = knn_range(train_data , new_data , val_data);

%[gini_accu , ce_accu] = decision_tree(train_data , new_data , val_data);






















