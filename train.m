function [x, y, model, pca_model, k_means_model] = train(total)
% X = features
% Y = label
x = [];
y = {};

for n = 1:length(total)-1
    display(['Reading img',num2str(n)])
    for i = 1:8
        for j = 1:8
            y_temp = total{n+1,3}{i,j};
            if strcmp(y_temp,'')
                continue;
            end           
            fields = fieldnames(total{n+1,2}{i,j});
            x_temp = zeros(1,length(fields));
            for f = 1:length(fields)
                x_temp(f) = [getfield(total{n+1,2}{i,j},fields{f})];
            end
            
            x = [ x ; x_temp ];
            y = [ y ; y_temp ];
        end
    end
end

[x, pca_x,k_means_x,pca_coeff,centroid] = preprocess(x,length(unique(y)));
save('pca_coeff.mat','pca_coeff')
save('centroid.mat', 'centroid')

model = fitcknn(x,y,'NumNeighbors',5);
save('model.mat','model')

pca_model = fitcknn(pca_x,y,'NumNeighbors',5);
save('pca_model.mat','pca_model')

