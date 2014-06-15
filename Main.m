function [ final_letters ] = Main( DB_letters )

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

    %Step 5 - Creating vector
    letter_vectors = cell(length(Frames), 1);
    for k = 1:length(Frames)
        frame_data = Frames{k};
        letter_matrix = I(frame_data(2):(frame_data(2)+frame_data(4)), frame_data(1):(frame_data(1)+frame_data(3)));
        letter_vectors{k} = Step5_Letter2Vector(letter_matrix);
    end
    
    %Step 6 - Running DTW for each component
    final_letters = zeros(length(Frames), 1);
    for k = 1:length(Frames)
        comparison_table = Step6_DTW(letter_vectors{k}, DB_letters);
        
        %Find smallest value
        final_letters(k) = find(comparison_table == min(comparison_table));
        
        %TODO: output letter
    end
end

