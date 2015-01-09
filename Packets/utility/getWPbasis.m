function basis = getWPbasis(n,Family,par)
% this function obtain wavelet packet basis of full depth w.r.t. a signal
% of length n
% n        length of signal
% Family   wavelet used for wavelet packet
% par      parameter for wavelet packet
% 

if nargin < 2
    Family = 'Daubechies';
    par = 4;
end

d = log2(n);% depth of the wp tree
k = 0;% shift of basis in space, ==0 for full depth
j = d;% full depth decomposition

disp(['The signal length is : ' num2str(n) ])
disp(['The depth of wavelet packet decomposition is : ' num2str(d) ])
disp(['The wavelet used is :' Family num2str(par)])

basis = cell(n,1);
for b = 0:(n-1) 
    basis{b+1} = MakeWaveletPacket(j,b,k,Family,par,n);
end
