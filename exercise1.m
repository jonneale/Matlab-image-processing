function exercise1(path,number_of_channels)

%If path is a file path, load the image at that path, otherwise, if it is
%an array of class uint8, assume it is an image
if ischar(path)
    input = imread(path);
else
    input = path;
end

actual_number_of_channels = length(input(1,1,:));
%If the user specifies too many colour channels, throw informative
%exception and exit
if number_of_channels > actual_number_of_channels
    eid = sprintf('Images:wrongNumberOfColourChannelsSpecified');
    error(eid,'You specified %s colour channels, but the specified image only contains %s',...
          number_of_channels, actual_number_of_channels);
end

for i=1:number_of_channels
    subplot(2,number_of_channels,i), imshow(input(:,:,i));
    subplot(2,number_of_channels,i+number_of_channels), imhist(input(:,:,i));
end


end
