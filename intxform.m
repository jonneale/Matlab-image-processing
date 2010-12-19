function z = intxform (s, map)
%INTXFORM Intensity transformation.
% Z = INTXFORM(S, MAP) maps the intensities of input
% image S using mapping function, MAP, whose values are assumed to
% be in the range [0 1]. MAP specifies an intensity transformation
% function as described in Section 3.2 of Digital Image Processing Second
% edition
% For example, to create a map
% function that squares the input intensities of an input image of
% class uint8 and then use function INTXFORM to perform the mapping
% we write:
%
% t = linspace(0, 1, 256);
% map = t.^2;
% z = intxform(s, map);
%
% The output image is of the same class as the input.
image = imread(s)
converted_image = im2double(image);
t = linspace(0,1,numel(map));
transformed_image = interp1(t,map,converted_image);
imshow(transformed_image);
end