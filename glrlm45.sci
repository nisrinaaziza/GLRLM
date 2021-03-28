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
    maxrunlength45=Nx
elseif Nx>Ny then
    maxrunlength45=Ny
else maxrunlength45=Nx
end
GLRLM45=zeros(nL1,maxrunlength45)

for m=1:Nx
    i=Nx-m+1
    for j=1:Ny
        graylevel=F(i,j)
        for l=1:nL1
            if L1(l)==graylevel then
                NoGrayLevel=l
            end
        end        
        if (i==Nx) || (j==1) || (i<Nx & j>1 & graylevel<>F(i+1,j-1)) then  
           for k=j:maxrunlength45
               printf("m=%i,i=%i,j=%i,k=%i\n",m,i,j,k)
               if i-(k-j)>0 then
                  if F(i-(k-j),k)==graylevel then
                     runlength=k-j+1
                  else
                     break 
                  end
               end
           end
           GLRLM45(NoGrayLevel,runlength)=GLRLM45(NoGrayLevel,runlength)+1
        end
    end
end        
disp(F)
disp(GLRLM45)
