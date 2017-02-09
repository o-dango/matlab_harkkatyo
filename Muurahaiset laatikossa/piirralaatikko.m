function [  ] = piirralaatikko(  )
%piirralaatikko piirtää muurahaisille laatikon.
%   piirtää ennaltamäärätyn laatikon, olisi mahdollista muokata
%   sellaiseksi, että käyttäjä voisi määrätä laatikon ja aukon koon.

x = [0:1000]; %aukottomien seinien pituus
y1 = [0:300]; %aukon alemmanpuoleinen seinä
y2 = [700:1000]; %aukon ylemmänpuoleinen seinä
y5 = [300:700]; %lasersäteen pituus
x1 = [0:300]; %aukkoseinien pituus
x2 = [1000:1075]; %ovien pituus
y3=@(x) x-300; %ovien funktio
y4=@(x) -1*x+1300;

hold on
plot(x,x*0,'black',x*0,x,'black','LineWidth',2) %vasen seinä ja alaseinä
plot(1000+0*x1,y1,'black',1000+0*x1,y2,'black',x,1000+0*x,'black','LineWidth',2) %oikea seinä aukkoineen ja yläseinä
plot(x2,y3(x2),'black',x2,y4(x2),'black','LineWidth',2) %aukon ovet
plot(1000+0*y5, y5, 'r') %lasersäde
title('Muurahaiset laatikossa')
axis([-50 1100 -50 1050])
grid on

end

