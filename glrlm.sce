
clear; //hapus semua variable yang tersimpan di memory
clc; //bersihkan console


//matriks_pixel_file_gambar=imread("");
//F=[0,0,1,1;0,0,1,1;0,2,2,2;2,2,3,3]
F=grand(15,15,"uin",0,
5);
[Nx,Ny]=size(F);
L1=unique(F)';
nL1=size(L1,"*");
//if Nx==Ny then
//    maxrunlength=Nx
//elseif Nx>Ny then
    maxrunlength0=Ny
//else
//    maxrunlength=Nx        
//end
GLRLM0=zeros(nL1,maxrunlength0)
for i=1:Nx
    for j=1:Ny
        graylevel=F(i,j)
        for l=1:nL1
            if L1(l)==graylevel then
                NoGrayLevel=l
            end
        end        
        if (j==1) || (j>1 & graylevel<>F(i,j-1)) then
           for k=j:maxrunlength0
               if F(i,k)==graylevel then
                  runlength=k-j+1
               else
                  break 
               end
           end
           printf("i=%i, j=%i\n",i,j)
           GLRLM0(NoGrayLevel,runlength)=GLRLM0(NoGrayLevel,runlength)+1
        end
    end
end        
disp(F)
disp(GLRLM0)
