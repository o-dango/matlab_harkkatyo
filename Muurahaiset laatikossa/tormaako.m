function [ luku ] = tormaako( m1,m2 )
%tormaako-funktiolla tarkastellaan, törmääkö muurahainen johonkin seinistä tai osuuko se laatikon aukkoon.
%   m1 on muurahaisen x-koordinaatti ja m2 on muurahaisen y-koordinaatti.
%   Jos muurahainen törmää seinään, palauttaa funktio 1, aukkoon osuessa 2
%   ja muulloin 0.

if m1 <= 0 %vasen seinä
    luku = 1;
    
elseif m1 >= 1000; %oikea seinä
    
    if m2 >= 300 && m2 <= 700; %aukko
        luku = 2;
    else
        luku = 1;
    end

elseif m2 <= 0 %alaseinä
    luku = 1;
    
elseif m2 >= 1000; %yläseinä
    luku = 1;
    
else %laatikossa
    luku = 0;
end 

end

