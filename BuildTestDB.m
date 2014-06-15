function [ DB_letters ] = BuildTestDB(  )
    files = ['01.png'; '02.png'];
    files_num = size(files, 1);
    LETERS_PER_IMAGE = 4;
    
    DB_letters = cell(files_num*LETERS_PER_IMAGE, 1);
    letter_count = 1;
    
    for i = 1:files_num
        I = Step1_Binarization(files(i, :));
        I = Step2_Thining(I);
        Frames = Step3_Componenting(I);
        Frames = Step4_ComponentMerging(Frames);
        
        for k = 1:LETERS_PER_IMAGE
            frame_data = Frames{k};
            letter_matrix = I(frame_data(2):(frame_data(2)+frame_data(4)), frame_data(1):(frame_data(1)+frame_data(3)));
            DB_letters{letter_count} = Step5_Letter2Vector(letter_matrix);
            letter_count = letter_count + 1;
        end
    end
end

