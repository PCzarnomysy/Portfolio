# Idea
Pomysł związany z matematycznym sposobem przewidywania wyników meczów sportowych w przypadku powyższego tematu zrodził się w 2016 roku. 
Początkowo był on związany głównie z meczami piłki nożnej, z czasem ewoluował, umożliwiając przewidywanie wyników również innych dyscyplin, m.in. koszykówki, piłki ręcznej lub siatkówki.
Załączony w repozytorium plik, pod nazwą PLPrzewidywator.xlsx jest plikiem demonstracyjnym, pokazującym sposób działania skoroszytu oraz przekształcania danych i doskalowanym wyłącznie na potrzeby piłki nożnej.
Celem było jak najdokładniejsze określenie szans danej drużyny w meczu przeciwko innej drużynie.

# Format pliku
Skoroszyt został podzielony na dwa arkusze. Arkusz "Dane" obejmuje dane wejściowe oraz kolejne kolumny przekształcające dane i przystosowujące je do obliczeń. 
Arkusz "Wyliczenia" oblicza prawdopodobieństwo wystąpienia wyniku, oraz wygranej w meczu w oparciu o wyselekcjonowane drużyny. Arkusze są ze sobą powiązane.

# Dane
Dane wejściowe, znajdujące się w kolumnach B-F obejmują mecze polskiej Ekstraklasy z sezonu 2022/2023 i pochodzą z serwisu flashscore.com. 
Są one posortowane od ostatniego meczu 34 kolejki do pierwszego meczu 1 kolejki. Dane nie wymagały czyszczenia. Mogą one zostać zamienione, pozostałe kolumny zaktualizują się automatycznie.

# Przekształcenie danych

Aby wskazać potencjalną aktualną siłę drużyn przekształcono dane wejściowe na trzy składniki - wyniki osiągane w całym sezonie, wyniki osiągane w meczach u siebie lub na wyjeździe oraz wyniki z ostatnich 6 meczów.
Wyniki w meczach domowych i wyjazdowych są wykorzystywane do wyliczeń w zależności od lokalizacji rozgrywanego meczu przez daną drużynę.

W kolumnach I-L zagregowano dane z kolumnn D-F za pomocą przykładowych formuł:

"=JEŻELI.BŁĄD(INDEKS(F$2:F$500;1);"")" - w kolumnach I-K - służy ona posortowaniu meczów w trzy kolumny i zagregowaniu meczów domowych i wyjazdowych;

"=JEŻELI(CZY.TEKST(I11);LICZ.JEŻELI(I$2:I11;I11);0)" - w kolumnie L - służy ona zliczeniu liczby meczów poszczególnej drużyny.

Następnie w kolumnie N-AD zsumowano liczbę bramek oraz zliczono mecze które rozegrała dana drużyna. Dane zostały podzielone na gole stracone i strzelone w całym sezonie, u siebie, na wyjeździe i w ostatnich 6 meczach.
Drużyny w kolumnie N zostały posortowane alfabetycznie za pomocą formuły:

"=JEŻELI.BŁĄD(INDEKS($I$2:$I$419; PODAJ.POZYCJĘ(MIN.K(JEŻELI(LICZ.JEŻELI(N$1:$N15; $I$2:$I$419)=0; LICZ.JEŻELI($I$2:$I$419; "<"&$I$2:$I$419); ""); 1); LICZ.JEŻELI($I$2:$I$419; "<"&$I$2:$I$419); 0));"")"

W najnowszym Office 365 możliwe jest użycie funkcji "UNIKATOWE"

![Zrzut ekranu 2023-06-21 235206](https://github.com/PCzarnomysy/Portfolio/assets/136918183/7e5a489f-7c2d-4de9-b490-574301ab6579)

Dane z kolumn N-AD zostały w kolumnach AE-AM podzielone na średnią liczbę bramek zdobytych lub straconych przez poszczególne drużyny. 
Kolumna AN jest kolumną kontrolną określaną za pomocą funkcji "JEŻELI". W przypadku, jeżeli dana drużyna rozegra mniej niż 6 meczów wartość przyjmuje liczbę 0, co powoduje brak wyliczenia siły drużyny.
Wspominana liczba 6 meczów stanowi subiektywnie określoną liczbę meczów, po której rozegraniu dane umożliwiają określenie siły danej drużyny.

![Zrzut ekranu 2023-06-21 235225](https://github.com/PCzarnomysy/Portfolio/assets/136918183/1cb629cf-307a-492f-9173-8546be924a68)

# Określenie siły drużyn

W kolumnach AO-AQ, w wierszach 2-5 na podstawie danych przekształconych na wcześniejszych etapach wyliczono średnią liczbę bramek padających w całym sezonie w lidze, meczach domowych, wyjazdowych oraz w ostatnich 6 spotkaniach.

W wierszach 9-10 wyliczono średnią przewidywaną liczbę bramek w meczach domowych i wyjazdowych. Dane służą przemnożeniu średniej siły drużyny w arkuszu "Wyliczenia". 
W celu określenia średniej wartości zastosowano formułę:

Ostatnie 6 meczów * 3/6 +
Mecze u siebie lub na wyjeździe * 2/6 +
Mecze w całym sezonie * 1/6

![Zrzut ekranu 2023-06-22 000225](https://github.com/PCzarnomysy/Portfolio/assets/136918183/89cf5b81-fe45-4f33-9bf9-53f2b3a8a84e)

Podobną formułę zastosowano do określenia siły drużyny w podziale na mecze domowe i wyjazdowe. Dane znajdują się w kolumnach AR-AV.

![Zrzut ekranu 2023-06-22 000252](https://github.com/PCzarnomysy/Portfolio/assets/136918183/34a697ed-a2be-4253-b918-d1f87554ddf5)

# Wyliczenia

Potencjalny przewidywany wynik meczu wskazany jest w arkuszu "Wyliczenia". Drużyny można wybrać z list rozwijanych z komórek A2 oraz D2. 
Liczba bramek gospodarza została przeliczona za pomocą formuły:

Siła goli strzelonych drużyny u siebie * siła goli straconych drużyny rywala na wyjeździe * Średnia liczba goli strzelonych w meczach domowych w całej lidze

Liczba bramek gości jest przeliczona w sposób analogiczny. Wyniki formuł są przedstawione w komórkach B2 oraz C2.
Następnie w ramach danych z komórek B2 oraz C2 wyznaczono prawdopodobieństwo wystąpienia danego wyniku w tabeli w kolumnach F-R. W kolumnie G, pionowo, określono liczbę bramek zdobytych przez gospodarza.
Poziomo w wierszu 2 określono liczbę bramek gości. Prawdopodobieństwo zostało obliczone za pomocą funkcji rozkładu Poissona w programie Excel, w poniższej formie:

=((ROZKŁAD.POISSON($G4;$B$2;FAŁSZ)*ROZKŁAD.POISSON(I$2;$C$2;FAŁSZ)))*100

Przykładowe rezultaty analizy oraz rozkład szans wystąpienia wyniku zostały pokazane na poniższym obrazku.

![Zrzut ekranu 2023-06-17 225006](https://github.com/PCzarnomysy/Portfolio/assets/136918183/0fbeaf06-2806-40fa-b15f-b7f997679d7a)

Dodatkowo w kolumnie B oraz C zsumowano prawdopodobieństwo wygranej danej drużyny lub remisu, szanse na wynik powyżej i poniżej 2,5 goli w meczu oraz sytuacji, gdzie obie drużyny strzelą gola w meczu.

# Obserwacje

W większości lig wyższą średnią liczbę bramek drużyny strzelały w meczach domowych.
Średnia liczba strzelonych bramek w meczach domowych w całym sezonie wynosiła ok. 1,37 gola, podczas gdy średnia liczba strzelonych bramek przez gości wynosi ok. 1,10 gola. 
Statystyki zrównały się w ostatnich 6 kolejkach, gdzie zarówno gospodarze, jak i goście średnio strzelali 1,33 bramki na mecz.

W przypadku bardzo niskiego wskaźnika przewidywanych bramek w meczu (poniżej 0,5 gola) znacząco wzrasta prawdopodobieństwo braku gola w meczu, zawyżając potencjalną szansę na remis w meczu. Problem ten występuje wyłącznie w przypadku piłki nożnej, która charakteryzuje się niską liczbą zdobytych punktów - bramek podczas rozgrywek.

# Informacje końcowe
Wskazane wyliczenia należy traktować wyłącznie jako wskazówkę, ciekawostkę statystyczną. Sport jest tak piękny dlatego, że istnieje jeszcze czynnik ludzki, którego nie da się przewidzieć.

Link do pobrania pliku znajduje się poniżej
[LINK](https://github.com/PCzarnomysy/Portfolio/blob/main/PLprzewidywator/PLprzewidywator.xlsx)
