% Author: Steven Karr
% Date: 9-20-15
% Class: CS 534, Dyer
% Purpose: Compute and display grayscale error from demosaicing process
% from all RGB channels of P2-crayons-demosaic.jpg and P2-crayons.jpg

Explanation of resultant error from mosiac process: In the bottom left of the original image, there is a blue crayon with a white line around the base of its tip. Because the line is an edge between a strong blue and a strong white, the interpolation blends the two colors to obtain a lighter shade of blue. Thus, this method can show artifacts around edges.