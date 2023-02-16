clear all, close all;

dane;
speed=200;                 %set the modulation speed

factor=5/speed;

fprob=factor*8000;
fmain=1000*factor;

t=(0:1/fprob:0.2-1/fprob);
syg=ones(1,size(t)*[0 n]');

for i=1:n,
	if plain_text(1,i)<0.5
		plain_text(1,i)=0;
		x=sin(2*pi*fmain*t);
	end
	if plain_text(1,i)>=0.5
		plain_text(1,i)=1;
		x=sin(2*pi*(fmain+400*factor)*t);
	end

	x111(i,:)=x(1,:);
	k=(i-1:400/fprob:i);
	subplot(2,1,1);
	plot(k,plain_text(1,i));axis([0 n -5 5]);hold on;
	k=(i-1:1/fprob:i);
	a=x;
end

x111;
m=size(x,2);%row size
%n=4;%liczba kolumn
xxx=zeros(1,m*n);
 for j=1:n,
  for i=1:m,
      xxx(1,(j-1)*m+i)=x111(j,i);
  
 end
end
xxx;
k=(0:(n/20)/fprob:n-(1/fprob));

%subplot(2,1,2);
%plot(k,xxx);axis([0 n -5 5]);hold on;

%sound(xxx)
wavwrite(xxx,'ost2_20_bits_8kHz.wav')
