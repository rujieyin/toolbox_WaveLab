function basis = get2dWPbasis(n,Family,par)
% this function obtain wavelet packet basis of full depth w.r.t. a 2d signal
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

basis = cell(n);
for bx = 0:(n-1) 
    for by = 0:(n-1)
    basis{bx+1,by+1} = Make2dWaveletPacket(d,bx,by,k,k,n,Family,par)
    end
end
