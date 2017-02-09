close all, clear all

% Matlab-harkkatyö, vaihe 5
% Muurahaiset neliölaatikossa +  aukko seinässä
% Kysyy käyttäjältä muurahaisten lukumäärän, aika-askeleen ja nopeuden.
% Laskee muurahaisten koordinaatit ja piirtää ne laatikkoon, sekä pitää
% käyttäjän ajantasalla muurahaisten kulusta.

lkm = input('Anna muurahaisten lukumäärä: '); %muurahaisten kokonaismäärä
askel = input('Anna aika-askeleen pituus (suositus ~1): '); %aika-askel
nopeus = input('Anna nopeus (suositus ~10): '); %muurahaisten nopeus
tilanne = 1; c = 2; %tilanne kertoo onko muurahaisia vielä laatikossa, c on laskettujen pisteiden lukumäärä
loppuaika = 0; valiaika = 0; %loppuaika kertoo kuinka kauan kestää, että kaikki muurahaiset ulkona, väliaika taas kun puolet on ulkona

m = struct();
T = {}; P = {}; v = []; k = []; l = [];

for i = 1:lkm
    P{i} = [;];
end

m = setfield(m,'paikka',P); %muurahaisen x- ja y-koordinaatit
m = setfield(m,'kulma',k); %missä kulmassa muurahainen liikkuu, nollakulma positiivinen x-akseli, kulma kasvaa vastapäivään
m = setfield(m,'nopeus',v); %olisi mahdollista laittaa muurahaisille eri nopeuksia
m = setfield(m,'laatikossa',l); %onko muurahainen laatikossa, 1, vai ei, 0.
m = setfield(m,'piirto',T); %piirtoa varten

for j = 1:lkm   %alkupisteet
    
    x = rand*1000; %arvotaan alkupisteet
    y = rand*1000;
    kulma = rand*360; %arvotaan alkukulma
    paikka = [x;y];
    m.paikka{j} = paikka; %tallennetaan arvot murkkustructiin
    m.kulma(j) = kulma;
    m.laatikossa(j) = 1; 
    
end

while tilanne ~= 0 %lasketaan pisteitä niin kauan kunnes kaikki muurahaiset ovat ulkona
    
    for rivi = 1:lkm
        
        if m.laatikossa(rivi) == 1 %jos muurahainen on laatikossa, niin tehdään allaolevat vertailut
            
            seina = tormaako(m.paikka{rivi}(1,c-1),m.paikka{rivi}(2,c-1)); %onko muurahaisen edellinen piste törmännyt seinään
        
            if seina == 0 %jos ei törmää, lasketaan seuraava piste
                m.paikka{rivi}(1,c) = m.paikka{rivi}(1,c-1)+askel*nopeus*cos(m.kulma(rivi)); %x-koordinaatti
                m.paikka{rivi}(2,c) = m.paikka{rivi}(2,c-1)+askel*nopeus*sin(m.kulma(rivi)); %y-koordinaatti
                m.laatikossa(rivi) = 1;
            elseif seina == 1 %jos törmää, niin arvotaan uusi kulma ja lasketaan seuraava piste
                m.kulma(rivi) = ratkokulma(m.paikka{rivi}(1,c-1),m.paikka{rivi}(2,c-1));
                m.paikka{rivi}(1,c) = m.paikka{rivi}(1,c-1)+askel*nopeus*cos(m.kulma(rivi));
                m.paikka{rivi}(2,c) = m.paikka{rivi}(2,c-1)+askel*nopeus*sin(m.kulma(rivi));
                m.laatikossa(rivi) = 1;
            else %jos ulkona laatikosta, niin piirretään muurahainen alueen ulkopuolelle piiloon :D
                m.paikka{rivi}(1,c) = 10000;
                m.paikka{rivi}(2,c) = 10000;
                m.laatikossa(rivi) = 0;
            end
            
        else %jos muurahainen on jo ulkona laatikosta
            m.paikka{rivi}(1,c) = 10000;
            m.paikka{rivi}(2,c) = 10000;
            m.laatikossa(rivi) = 0;
        end
        
    end
    
    tilanne = sisalla(m.laatikossa, lkm); %selvitetään kuinka monta muurahaista on laatikossa
    
    if tilanne == 0 %jos kaikki ulkona
        break;
    elseif tilanne == lkm/2 && mod(lkm, 2) == 0 % parillisilla luvuilla, jos puolet muurahaisista jäljellä
        if valiaika == 0
            valiaika = loppuaika; %tallennetaan väliaika, jos ei ole aikaisemmin tallennettu
        end
        c = c + 1;
        loppuaika = loppuaika + askel;
    elseif tilanne == (lkm-1)/2 && mod(lkm,2) ~=0 % parittomilla luvuilla
        if valiaika == 0
            valiaika = loppuaika;
        end
        c = c + 1;
        loppuaika = loppuaika + askel;
    else
        c = c + 1;
        loppuaika = loppuaika + askel;
    end
    
end

piirralaatikko()
for d = 1:lkm % muodostetaan handlet jokaiselle muurahaiselle
    
    h = plot(m.paikka{d}(1,1),m.paikka{d}(2,1),'p');
    axis([-50 1100 -50 1050])
    m.piirto{d} = h;
    
end

for s = 1:c %käydään lasketut pisteet läpi
    
    for n = 1:lkm
        
        if m.paikka{n}(1,s) < 10000 && m.paikka{n}(1,s+1) == 10000 %jos muurahainen lähtee ulos
            set(m.piirto{n},'xdata',m.paikka{n}(1,s),'ydata',m.paikka{n}(2,s), 'Color', 'k','Marker','*') %päivitetään muurahaisen paikka
            disp(['Muurahainen numero ', num2str(n), ' ulkona!'])
        
        else
            set(m.piirto{n},'xdata',m.paikka{n}(1,s),'ydata',m.paikka{n}(2,s)) %päivitetään muurahaisen paikka
        end
        
    end
    %M(s) = getframe;
    drawnow
    
end
hold off

%movie2avi(M, 'laatikko.avi', 'fps', 50);

disp('Kaikki muurahaiset ulkona!') %kerrotaan lopputiedot
loppuaika
valiaika
