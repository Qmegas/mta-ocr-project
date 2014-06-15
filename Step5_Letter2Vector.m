function [ letter_vector ] = Step5_Letter2Vector( letter_matrix )
    sizes = size(letter_matrix);
    final_vector = zeros(sum(sum(letter_matrix > 0)), 2);
    vector_size = 0;
    
    for row = 1:sizes(1)
        for col = 1:sizes(2)
            if letter_matrix(row, col) > 0
                vector_size = vector_size + 1;
                final_vector(vector_size, 1) = row;
                final_vector(vector_size, 2) = col;
            end
        end
    end
    
    letter_vector = final_vector;
end
