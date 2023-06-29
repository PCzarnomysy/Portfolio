# Informacje

Poniższy program przelicza siłę danej drużyny na podstawie formuły stworzonej przez Arpada Elo, wykorzystywanej przede wszystkim do określenia rankingu szachistów. W ostatnim czasie zmodyfikowana formuła na bazie formuły Elo została również zastosowana przez Międzynarodową Federację Piłki Nożnej (FIFA). Program jest wzorowany na algorytmach zastosowanych na stronach internetowych eloratings.net oraz clubelo.com.

Pliki w folderze obejmują: 

PLmecze.xlsx - dane wejściowe

Ranking_Elo.py - kod przeliczający wyniki meczów z lat 1998-2023

PLranking.xlsx - dane wyjściowe

W przypadku chęci porównania większej liczby lig, krajów oraz wyników drużyn w rozegranych meczach międzypaństwowych, sugerowane jest zbudowanie bazy relacyjnej w SQL.

Przykład takiej bazy, stanowi załącznik do pobrania w linku poniżej. Stanowi on jedynie szablon, z uzupełnionymi kilkoma spotkaniami drużyn w lidze angielskiej, hiszpańskiej oraz pomiędzy drużynami. Każda z lig oraz mecze międzypaństwowe stanowią odrębną tabelę. Czwartą jest tabela z nazwami drużyn oraz ich ID, stanowiącymi klucz podstawowy.
ID z tabeli "druzyny" jest połączone z kolumnami "home_id" oraz "away_id" z tabelami z wynikami meczów poszczególnych lig.

[Ranking_ELO.sql](https://github.com/PCzarnomysy/Portfolio/blob/main/Ranking_Elo/rank_elo.sql)

Plik Ranking_Elo.py oblicza ranking drużyny do wskazanej w pierwszym komunikacie daty, lub też całość danych zawartych w pliku PLmecze.xlsx. Aby otrzymać poprawne wyniki należy w pliku PLranking.xlsx filtrować dane do dwóch ostatnich lat względem przeliczanych danych, na przykład: wprowadzając w pliku Ranking_Elo.py datę generowanych danych do 30 lipca 2006 r. należy zaznaczyć objąć filtrem kluby z datą 2005 i 2006 r. 

Przykładowe dane obejmujące cały zakres meczów od 1998 do 2023 roku.

![Zrzut ekranu 2023-06-21 230625](https://github.com/PCzarnomysy/Portfolio/assets/136918183/d0579679-190c-4af9-b4cc-dc1a213b34ea)

Link do całego folderu znajduje się poniżej:

[LINK](https://github.com/PCzarnomysy/Portfolio/tree/main/Ranking_Elo)
