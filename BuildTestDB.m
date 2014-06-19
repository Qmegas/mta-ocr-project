function [ DB_letters ] = BuildTestDB(  )
    %this function  build the BD
	%Output: DB_letters  cell which contain all the letters has a vector of pixel location  of  the above list letters images.
	% each letter has 4 examples.
	files = [   'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
				'Letters\�.jpg';
                'Letters\c.jpg'];

    files_num = size(files, 1);
    LETTERS_PER_IMAGE = 4;
    
% creat the cell size of  files_num (28)* LETTERS_PER_IMAGE(4),.
    DB_letters = cell(files_num*LETTERS_PER_IMAGE, 1);
    letter_count = 1;
    
% for each  file  make all steps
%1 binarization
% 2 thining.
% 3 componenting.
% 4 Component merging.
    for i = 1:files_num
        I = Step1_Binarization(files(i, :));
        I = Step2_Thining(I);
        Frames = Step3_Componenting(I);
        Frames = Step4_ComponentMerging(Frames);
    % add the letter vector to the cell.
        for k = 1:LETTERS_PER_IMAGE
            frame_data = Frames{k};
            letter_matrix = I(frame_data(2):(frame_data(2)+frame_data(4)), frame_data(1):(frame_data(1)+frame_data(3)));
            DB_letters{letter_count} = Step5_Letter2Vector(letter_matrix);
            letter_count = letter_count + 1;
        end
    end
end
