function [ valiaika ] = laatikkomurkku( lkm )
%laatikkomurkku on tarkoitettu murkkuscriptin kanssa ajettavaksi
%   Kevyempi laatikkomurkkufunktio, joka palauttaa ajan milloin puolet
%   muurahaisista on ulkona laatikossa. Piirto-ominaisuus hidastaa
%   laskunopeutta huomattavasti eikä suositella ajettavaksi
%   perunaläppärillä :) 
%   Koodi löytyy kommentoituna laatikkomuurahaiset.m -tiedostosta

askel = 1;
nopeus = 10;
tila = 1; tilanne = 1; c = 2;
loppuaika = 0; valiaika = 0;

m = struct();
T = {}; P = {}; v = []; k = [];

for i = 1:lkm
    P{i} = [;];
end

m = setfield(m,'paikka',P);
m = setfield(m,'kulma',k);
m = setfield(m,'nopeus',v);
m = setfield(m,'laatikossa',tila);
m = setfield(m,'piirto',T);

for j = 1:lkm   %alkupisteet
    
    x = rand*1000;
    y = rand*1000;
    kulma = rand*360;
    paikka = [x;y];
    m.paikka{j} = paikka;
    m.kulma(j) = kulma;
    m.laatikossa(j) = 1;
    
end

while tilanne ~= 0
    
    for rivi = 1:lkm
        
        if m.laatikossa(rivi) == 1
            
            seina = tormaako(m.paikka{rivi}(1,c-1),m.paikka{rivi}(2,c-1));
        
            if seina == 0
                m.paikka{rivi}(1,c) = m.paikka{rivi}(1,c-1)+askel*nopeus*cos(m.kulma(rivi));
                m.paikka{rivi}(2,c) = m.paikka{rivi}(2,c-1)+askel*nopeus*sin(m.kulma(rivi));
            elseif seina == 1
                m.kulma(rivi) = ratkokulma(m.paikka{rivi}(1,c-1),m.paikka{rivi}(2,c-1));
                m.paikka{rivi}(1,c) = m.paikka{rivi}(1,c-1)+askel*nopeus*cos(m.kulma(rivi));
                m.paikka{rivi}(2,c) = m.paikka{rivi}(2,c-1)+askel*nopeus*sin(m.kulma(rivi));
            else
                m.paikka{rivi}(1,c) = 10000;
                m.paikka{rivi}(2,c) = 10000;
                m.laatikossa(rivi) = 0;
            end
            
        else
            m.paikka{rivi}(1,c) = 10000;
            m.paikka{rivi}(2,c) = 10000;
        end
        
    end
    
    tilanne = sisalla(m.laatikossa, lkm);
    
    if tilanne == 0
        break;
    elseif tilanne == lkm/2 && mod(lkm, 2) == 0
        if valiaika == 0
            valiaika = loppuaika;
            break;
        end
        c = c + 1;
        loppuaika = loppuaika + askel;
    elseif tilanne == (lkm-1)/2 && mod(lkm,2) ~=0
        if valiaika == 0
            valiaika = loppuaika;
            break;
        end
        c = c + 1;
        loppuaika = loppuaika + askel;
    else
        c = c + 1;
        loppuaika = loppuaika + askel;
    end
    
end

% piirto-osio tästä alaspäin, epäkommentoi omalla vastuulla :)
% piirralaatikko()
% for d = 1:lkm
%     
%     h = plot(m.paikka{d}(1,1),m.paikka{d}(2,1),'p');
%     axis([-50 1100 -50 1050])
%     m.piirto{d} = h;
%     
% end
% 
% for s = 1:c
%     
%     for n = 1:lkm
%         if m.paikka{n}(1,s) < 10000 && m.paikka{n}(1,s+1) == 10000
%             disp(['Muurahainen numero ' ,num2str(n),  ' ulkona!'])
%         end
%         set(m.piirto{n},'xdata',m.paikka{n}(1,s),'ydata',m.paikka{n}(2,s))
%     end
%     
%     drawnow
%     
% end
% hold off
% 
% disp('Kaikki muurahaiset ulkona!')
% disp(['Aikaa kului ', num2str(loppuaika), ' aikayksikköä.'])

end

