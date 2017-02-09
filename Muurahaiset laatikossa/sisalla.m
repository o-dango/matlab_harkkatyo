function [ maara ] = sisalla( m, lkm )
%sisalla-funktiolla lasketaan kuinka monta muurahaista on vielä laatikon
%sisällä
%   m on structin osio, mikä kertoo onko muurahainen laatikossa vai ei.
%   Nolla kertoo että muurahainen on ulkona ja ykkönen että se on
%   laatikossa. Muuttujaan maara tallennetaan laatikossa olevien
%   muurahaisten kokonaismäärä ja palautetaan se kutsuvaan ohjelmaan. Lkm
%   kertoo olemassa olevien muurahaisten määrän.

maara = 0;

for i = 1:lkm
    maara = maara + m(i);
end

end

