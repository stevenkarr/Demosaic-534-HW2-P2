function [ K ] = demosaicerror( I, J )
% Author: Steven Karr
% Date: 9-20-15
% Class: CS 534, Dyer
% Purpose: Computes error between vendor and student's demosaicing
% Dependencies: none

%Convert image data type to double
I = im2double(I);
J = im2double(J);

%Obtain values for rows and columns of passed image
%(These SHOULD be the same, if we are really comparing two valid images)
[rows,cols,channels] = size(I);

%Calculate differences for each channel
R = I(:,:,1) - J(:,:,1);
G = I(:,:,2) - J(:,:,2);
B = I(:,:,3) - J(:,:,3);

%Square the differences calculated for each channel
R = R.^2;
G = G.^2;
B = G.^2;

%Scales to [0,1] and then to [0,255]
for r=1:rows
    for c=1:cols
        R(r,c) = 255 * R(r,c)/(max(I(r,c,1),J(r,c,1)))^2;
        G(r,c) = 255 * G(r,c)/(max(I(r,c,2),J(r,c,3)))^2;
        B(r,c) = 255 * B(r,c)/(max(I(r,c,2),J(r,c,3)))^2;
    end
end

%Add errors from each channel to create grayscale channel
K = R + G + B;
K = uint8(K);
end

