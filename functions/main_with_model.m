display('Testing data')
total_test = cell(5+1,1);
test_folder = 'C:\Users\brend_000\Documents\MATLAB\Machine Learning\Ghost Target\Images\cambridge';
for x = 1:5
    display(['Reading img', num2str(x)])
    img = imread([test_folder,'\img', num2str(x),'.jpg']);
    data = cell(8,8);
    mynxel = nxel(8,img);
    [a,b] = size(mynxel);
    for i = 1:a
        for j = 1:b
            data{i,j} = readImage(mynxel{i,j});
        end
    end
    total_test{1,1} = 'Image';
    total_test{x+1,1} = ['img',num2str(x)];
    total_test{1,2} = 'Feature';
    total_test{x+1,2} = data;
 
    load([test_folder,'_labels\img',num2str(x),'.mat']);
    total_test{1,3} = 'Label Set';
    total_test{x+1,3} = imgLabel;
end
load('model.mat')
load('pca_model')


[x_test, y_test, accuracy, test_labels, confusion_matrix] = validate(total_test,model,'naive');
save('Results\confusion_matrix_naive.mat','confusion_matrix');

[x_test, y_test, accuracy, test_labels, pca_confusion_matrix] = validate(total_test,pca_model,'pca');
save('Results\confusion_matrix_pca.mat','pca_confusion_matrix');
