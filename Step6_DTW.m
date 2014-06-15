function [ DistsShapeContext ] = Step6_DTW( letter_vector, DB_letters )
    NumOfSamples = size(DB_letters, 1);
    
    [TestSeqAsShapeContext] = Lib_MakeShapeShapeContextFeature(letter_vector);
    
    DistsShapeContext = zeros(NumOfSamples, 1);
    k = 1;
    
    for j = 1:NumOfSamples
        NextLetSeq = DB_letters{j};
        
        [NextLetSeqAsShapeContext] = Lib_MakeShapeShapeContextFeature(NextLetSeq);
        
        % DTW Distance using P = 2
        [Diff,~,~,~,~] = Lib_DTW_CalcDistance(TestSeqAsShapeContext, NextLetSeqAsShapeContext);
        DistsShapeContext(k) = Diff;
        k = k + 1;
    end
end
