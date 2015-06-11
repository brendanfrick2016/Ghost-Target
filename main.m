clear all
img = imread('img1.jpg');

MAX_N = 5;
total = cell(5,1);
data = cell(MAX_N,1);
for x = 1:5
    img = imread(['img', num2str(x),'.jpg']);
    for n = 1:MAX_N
        data{n} = cell((2).^(n+1));
        mynxel = nxel((2*n).^2,img);
        [a,b] = size(mynxel);
        for i = 1:a
            for j = 1:b
                data{n}{i,j} = readImage(mynxel{i,j});
            end
        end
    total{x,1} = data;
    end
end

% scores = zeros(5,MAX_N)
% 
% for n = 1:MAX_N
%     for i = 1:MAX_N
%         for j = 1:MAX_N
%             scores(1,MAX_N) = scores(1,MAX_N) + data{1,1};
%             scores(2,MAX_N) = scores(2,MAX_N) + data{1,1};
% end

