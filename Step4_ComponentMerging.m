function [ new_frames ] = Step4_ComponentMerging( frames )
% merging components
% test rectangle intersection area.it there are intersection than take the
% min value to the cell
%
% Input:  frames cell (4* 1)  which contains the positions of x, y,  and  size of width, height.
% Output:new  frames after merging.

    i = 1;
    
    while i < length(frames)
        for j = (i+1):length(frames)
            if rectint(frames{i}, frames{j}) > 0
                %component intersection found
                new_x = min([frames{i}(1), frames{j}(1)]);
                new_y = min([frames{i}(2), frames{j}(2)]);
                new_width = max([frames{i}(1) + frames{i}(3), frames{j}(1) + frames{j}(3)]) - new_x;
                new_height = max([frames{i}(2) + frames{i}(4), frames{j}(2) + frames{j}(4)]) - new_y;
                frames{i} = [new_x, new_y, new_width, new_height];
                
                %delete merged component
                frames(j,:) = [];
                
                break;
            end
        end
        i = i + 1;
    end
    
    new_frames = frames;
end
