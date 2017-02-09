close all, clear all

% Matlab-harkkatyö, osa 5
% Toinen osa vitososiota, missä lasketaan ja piirretään kuvaaja siitä,
% miten muurahaisten kokonaismäärä vaikuttaa aikaan milloin puolet
% muurahaisista on ulkona laatikosta.

disp('Hitaammilla koneilla ei suositella isoja lukuja, max 50, ehkä?')
disp('Läppäri i5-prossulla jaksoi ajaa max 500 murkkua ja sen laskemiseen meni jo tosi pitkään')
disp('Sata muurahaista voi laskea ihan hyvällä omalla tunnolla kohtalaisella koneella :)')
n = input('Anna muurahaisten maksimimäärä: ');

aika = zeros(1,n); maara = zeros(1,n); %alustetaan aika- ja määrävektorit

for i = 1:n
    
    %disp(['Kierros ', num2str(i)]) kommentoitu koska hidastaa ajoa, mutta
    %helottaisi seuraamista
    aika(1,i) = laatikkomurkku(i);
    maara(1,i) = i;
   
end

figure(2)
puoletKuvaaja(maara, aika);
hold off
