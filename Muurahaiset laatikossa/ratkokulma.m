function [ kulma ] = ratkokulma( m1, m2 )
%ratkokulma arpoo uuden kulman muurahaiselle.
%   m1 on x-koordinaatti laatikossa ja m2 y-koordinaatti laatikossa. Näiden
%   avulla määritellä miltä väliltä muurahaisen uusi kulma arvotaan.

if m1 <= 0 %vasen seinä
    kulma = rand*pi-pi/2;
 
elseif m1 >= 1000 %oikea seinä
    kulma = rand*pi+pi/2;
    
elseif m2 <= 0 %alaseinä
    kulma = rand*pi;
    
else %yläseinä
    kulma = rand*pi-pi;
    
end
    
    end

