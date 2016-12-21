% Author: Steven Karr
% Date: 9-20-15
% Class: CS 534, Dyer
% Purpose: Driver for demosaic function. Displays computed grayscale error
% from all RGB channels of P2-crayons-demosaic.jpg and P2-crayons.jpg
% Dependencies: demosaic.m

%Clean up before execution
clear
clc

%Obtain input image
img1 = imread('P2-crayons-raw.bmp');
img2 = imread('P2-union-raw.bmp');

%Execute demosaic function
img1 = demosaic(img1);
img2 = demosaic(img2);

%Write output image to file
imwrite(img1,'P2-crayons-demosaic.jpg','jpg');
imwrite(img2,'P2-union-demosaic.jpg','jpg');

%Reads in images to compare to
img3 = imread('P2-crayons.jpg');
img4 = imread('P2-union.jpg');

%Obtains error (all RGB channels)
error1 = demosaicerror(img1,img3);
error2 = demosaicerror(img2,img4);

%Writes error images to file
imwrite(error1, 'P2-crayons-error.jpg','jpg');
imwrite(error2, 'P2-union-error.jpg','jpg');
%End
