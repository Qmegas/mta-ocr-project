function [ finalPhrase ] = Main( image, DB_letters )
% This is the main function for OCR.
% input:image - which as word in hand write which need to be tested.
% Output finalPhrase = the word  after OCR

% Pre processing

keySet = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27};
valueSet = {'א', 'ב', 'ג', 'ד', 'ה', 'ו', 'ז', 'ח', 'ט', 'י', 'כ' 'ל', 'מ', 'נ', 'ס', 'ע', 'פ', 'צ', 'ק', 'ר', 'ש', 'ת', 'ך', 'ם', 'ן', 'ף', 'ץ'};

    %Step 1 - Binarization
    I = Step1_Binarization(image);
    
    %Step 2 - Thinning
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
    
    %Calculationg frames distance
    letter_spaces = zeros(length(Frames) - 1, 1);
    for k=1:(length(Frames) - 1)
        letter_spaces(k) = abs(Frames{k}(1) + Frames{k}(3) - Frames{k+1}(1));
    end
    
    space_average = mean(letter_spaces);

    %Step 5 - Creating vector
    letter_vectors = cell(length(Frames), 1);
    for k = 1:length(Frames)
        frame_data = Frames{k};
        letter_matrix = I(frame_data(2):(frame_data(2)+frame_data(4)), frame_data(1):(frame_data(1)+frame_data(3)));
        letter_vectors{k} = Step5_Letter2Vector(letter_matrix);
    end
    
    %Step 6 - Running DTW for each component
    final_letters = zeros(length(Frames), 1);
    finalPhrase = '';
    for k = 1:length(Frames)
        comparison_table = Step6_DTW(letter_vectors{k}, DB_letters);
        
		%Find smallest value
		minTable = find(comparison_table == min(comparison_table));
		% There is might be a chance that the find function returns more
		% than one anwers, therefoer we do this initialization in two
		% steps.
		final_letters(k) = minTable(1);
		finalPhrase = strcat(mapOfChars(round(final_letters(k) / 4)), finalPhrase);
    end
end

