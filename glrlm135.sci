clear; //hapus semua variable yang tersimpan di memory
clc; //bersihkan console

//matriks_pixel_file_gambar=imread("");
//F=[0,0,1,1;0,0,1,1;0,2,2,2;2,2,3,3];
F=[2,0,0,1;0,0,1,1;3,1,0,3;3,3,3,2];
//F=grand(15,15,"uin",0,5);
[Nx,Ny]=size(F);
L1=unique(F)';
nL1=size(L1,"*");


if Nx==Ny then
    maxrunlength135=Nx
elseif Nx>Ny then
    maxrunlength135=Ny
else maxrunlength135=Nx
end
GLRLM135=zeros(nL1,maxrunlength135)

for m=1:Nx
    i=Nx-m+1
    for n=1:Ny
        j=Ny-n+1
        graylevel=F(i,j)
        for l=1:nL1
            if L1(l)==graylevel then
                NoGrayLevel=l
            end
        end        
        if (i==Nx) || (j==Ny) || (i<Nx & j<Ny & graylevel<>F(i+1,j+1)) then  
           for k=0:j-1
               printf("m=%i,i=%i,n=%i,j=%i,k=%i\n",m,i,n,j,k)
               if i-k>0 then
                  printf("a=%i,g=%i\n",F(i-k,j-k),graylevel)
                  if F(i-k,j-k)==graylevel then
                     runlength=k+1
                  else
                     break 
                  end
               end
           end
           GLRLM135(NoGrayLevel,runlength)=GLRLM135(NoGrayLevel,runlength)+1
        end
    end
end        
disp(F)
disp(GLRLM135)
