function [ thinned_image ] = Step2_Thining( bw_image )
    thinned_image = bwmorph(bw_image, 'thin', Inf);
end

