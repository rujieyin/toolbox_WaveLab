function wbasis = WpWdesign(Family1,par1,Family2,par2,n,L)
% this function build the design matrix WpW*, with full depth wavelet packet transform
% Wp(Family1,par1) and adjoint wavelet transform W*(Family2,par2)

if nargin < 5
    n = 1024;%signal length
end
if nargin < 6
    L = floor(log2(n))-3;%coarsest level in wavelet decomp., L = 1 for full decomp.
end

basis = getWPbasis(n,Family1,par1);
qmf = MakeONFilter(Family2,par2);
wbasis = cellfun(@(x)FWT_PO(x,L,qmf),basis,'UniformOutput',0);
wbasis = cell2mat(wbasis);