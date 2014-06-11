function [ binarized_image ] = Step1_Binarization( file_name )
    I = rgb2gray(imread(file_name));  %Grayscale
    level = graythresh(I);            %Calc threshhold
    binarized_image = ~im2bw(I, level);             %Binarize + invert
end

