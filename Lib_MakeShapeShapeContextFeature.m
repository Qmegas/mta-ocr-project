function [BH] = Lib_MakeShapeShapeContextFeature(Seq)



mean_dist_global=[]; % use [] to estimate scale from the data
nbins_theta=12;
nbins_r=5;


r_inner=1/8;
r_outer=2;


nsamp=size(Seq,1);
out_vec=zeros(1,nsamp); 
[BH,~]=Lib_sc_compute(Seq',zeros(1,nsamp),mean_dist_global,nbins_theta,nbins_r,r_inner,r_outer,out_vec);

end
%Diff =abs (w_emd1-w_emd2);
