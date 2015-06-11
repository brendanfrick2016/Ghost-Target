function [x,pca_x,k_means_x,pca_coeff,centroid] = preprocess(x,clusters)
    [pca_coeff,pca_x,latent] = pca(x);
    [k_means_x,centroid] = kmeans(x,clusters);
end