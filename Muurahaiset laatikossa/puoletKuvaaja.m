function [  ] = puoletKuvaaja( maara, aika )
%puoletKuvaaja kertoo muurahaisten kokonaismäärän ja kuinka kauan aikaa
%menee siihen, että puolet muurahaisista on ulkona laatikosta
%   x-akselilla muurahaisten kokonaismäärä, y-akselilla aika, kun puolet
%   muurahaisista on ulkona

hold on
plot(maara, aika, 'm*', 'LineWidth', 2)
plot(maara, aika, 'b', 'LineWidth', 1)
title('Murkkukuvaaja')
xlabel('lukumäärä')
ylabel('puoliintumisaika')
grid on


end

