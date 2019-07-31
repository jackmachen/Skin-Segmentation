I=imread('new.jpg');
figure,imshow(I);
I=double(I);
I2=I;
I2=rgb2hsv(I);
figure,imshow(I2);
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
y=16+0.258*R+0.505*G+0.090*B;
cb=128-0.148*R+0.291*G+0.439*B;
cr=128+0.439*R-0.368*G-0.071*B;
[w h]=size(I(:,:,1));
hue=I2(:,:,1);
saturation=I2(:,:,2);
value=I2(:,:,3);
for i=1:w
  for j=1:h
    if 140<=cr(i,j) && cr(i,j)<=165 && 140<=cb(i,j) && cb(i,j)<=195 && hue(i,j)<=0.1 && 0.01<=hue(i,j) && 0<=y(i,j) && y(i,j)<=255
      segment(i,j)=1;
     else
        segment(i,j)=0;
     end
  end
end
im(:,:,1)=I(:,:,1).*segment;
im(:,:,2)=I(:,:,2).*segment;
im(:,:,3)=I(:,:,3).*segment;
figure,imshow(segment);
figure,imshow(uint8(im));