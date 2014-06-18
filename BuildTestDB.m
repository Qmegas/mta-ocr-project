function [ DB_letters ] = BuildTestDB(  )
    %this function  build the BD
	%Output: DB_letters  cell which contain all the letters has a vector of pixel location  of  the above list letters images.
	% each letter has 4 examples.
	files = [   'Letters\א.jpg';
				'Letters\ב.jpg';
				'Letters\ג.jpg';
				'Letters\ד.jpg';
				'Letters\ה.jpg';
				'Letters\ו.jpg';
				'Letters\ז.jpg';
				'Letters\ח.jpg';
				'Letters\ט.jpg';
				'Letters\י.jpg';
				'Letters\כ.jpg';
				'Letters\ל.jpg';
				'Letters\מ.jpg';
				'Letters\נ.jpg';
				'Letters\ס.jpg';
				'Letters\ע.jpg';
				'Letters\פ.jpg';
				'Letters\צ.jpg';
				'Letters\ק.jpg';
				'Letters\ר.jpg';
				'Letters\ש.jpg';
				'Letters\ת.jpg';
				'Letters\ך.jpg';
				'Letters\ם.jpg';
				'Letters\ן.jpg';
				'Letters\ף.jpg';
				'Letters\ץ.jpg'];

    files_num = size(files, 1);
    LETTERS_PER_IMAGE = 4;
    
    DB_letters = cell(files_num*LETTERS_PER_IMAGE, 1);
    letter_count = 1;
    
    for i = 1:files_num
        I = Step1_Binarization(files(i, :));
        I = Step2_Thining(I);
        Frames = Step3_Componenting(I);
        Frames = Step4_ComponentMerging(Frames);
        
        for k = 1:LETTERS_PER_IMAGE
            frame_data = Frames{k};
            letter_matrix = I(frame_data(2):(frame_data(2)+frame_data(4)), frame_data(1):(frame_data(1)+frame_data(3)));
            DB_letters{letter_count} = Step5_Letter2Vector(letter_matrix);
            letter_count = letter_count + 1;
        end
    end
end
