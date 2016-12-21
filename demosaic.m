function [ J ] = demosaic( I )
% Author: Steven Karr
% Date: 9-20-15
% Class: CS 534, Dyer
% Purpose: Performs histogram equalization and produces histograms of
% input and output luminance values.
% Dependencies: none

%Convert image data type to double
I = im2double(I);

%Obtain values for rows and columns of passed image
[rows,cols] = size(I);

%Create arrays for each color channel
R = zeros(rows,cols);
G = zeros(rows,cols);
B = zeros(rows,cols);

%Extract color values that are already valid within initial image
R(1:2:end, 1:2:end) = I(1:2:end, 1:2:end); %Top left of square
G(2:2:end, 1:2:end) = I(2:2:end, 1:2:end); %Top right of square
G(1:2:end, 2:2:end) = I(1:2:end, 2:2:end); %Bottom left of square
B(2:2:end, 2:2:end) = I(2:2:end, 2:2:end); %Bottom right of square

%Create filters for use with 'imfilter' to demosaic image
%Values originate from whether there are: 2 (.5), 4 (.25), or 1 (1)
%adjacent squares of the corresponding color, respectively
filterR = [0.25,0.5,0.25;0.5,1,0.5;0.25,0.5,0.25];
filterG = [0,0.25,0;0.25,1,0.25;0,0.25,0];
filterB = [0.25,0.5,0.25;0.5,1,0.5;0.25,0.5,0.25];

%Create 3 channel output image; set default vals to 0
J = zeros(rows,cols,3);

%Assign each constructed color channel to corresponding channel in J
J(:,:,1) = imfilter(R,filterR,0);
J(:,:,2) = imfilter(G,filterG,0);
J(:,:,3) = imfilter(B,filterB,0);
end

