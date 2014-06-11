function [ output_args ] = Main( )

    %Step 1 - Binarization
    I = Step1_Binarization('Test.png');
    
    %Step 2 - Thining
    I = Step2_Thining(I);
    
    %Step 3 - Split to components
    Frames = Step3_Componenting(I);
    
    %Step 4 - Merging components
    Frames = Step4_ComponentMerging(Frames);
    
    %Debug
    imshow(I);
    for k = 1:length(Frames)
        rectangle('EdgeColor', [1 0 0], 'Position', Frames{k});
    end
    
    return;
    
    %Step 5 - Creating vector
    letter_vectors = cell(length(Frames), 1);
    for k = 1:length(Frames)
        frame_data = Frames{k};
        letter_matrix = I(frame_data(2):(frame_data(2)+frame_data(4)), frame_data(1):(frame_data(1)+frame_data(3)));
        letter_vectors{k} = Step5_Letter2Vector(letter_matrix);
    end
    
    %Step 6 - Running DTW for each component
    for k = 1:length(Frames)
        comparison_table = Step6_DTW(letter_vectors{k});
    end
    
    %Step 6.5 - Find bigest value + output letter
    %TODO
end

