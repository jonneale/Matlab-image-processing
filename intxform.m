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
% The input image may be either colour or greyscale, output will be
% calculated individually for each colour channel in the input

image = imread(s);
converted_image = im2double(image);
if (ischar(map))
    if (strcmp(map,'inverse'))
        transformed_image = imcomplement(converted_image);
    end
    if (strcmp(map,'darken'))
        t = linspace(0,1,256);
        map = t.^2;
        transformed_image = interp1(t,map,converted_image);
    end
    if (strcmp(map,'lighten'))
        t = linspace(0,1,256);
        map = t.^0.5;
        transformed_image = interp1(t,map,converted_image);
    end
else
    t = linspace(0,1,numel(map));
    transformed_image = interp1(t,map,converted_image);
end
%Transform image array back from double to uint8 format so that scales are
%the same and to allow compatibility with imshow
transformed_image = im2uint8(transformed_image);
%Pass the number of elements in the images third dimension as the number of
%colour channels to exercise 1.
figure(1), exercise1(image,length(image(1,1,:)));
figure(2), exercise1(transformed_image,length(image(1,1,:)));
end