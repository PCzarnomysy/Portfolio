import pandas as pd
import math


print("Ta aplikacja przelicza siłę danej drużyny na podstawie formuły stworzonej przez Arpada Elo. Baza danych posiada mecze od sezonu 98/99 dla polskich lig. \nProgram wzorowany na stronach internetowych eloratings.net oraz clubelo.com ")

# Wprowadzenie daty do której ma generowane są przeliczenia
user_input = input("Wpisz datę do której chcesz wygenerować mecze w formacie YYYY-MM-DD, lub naciśnij enter jeżeli chcesz pobrać najaktualniejsze dane: ")

print("Poczekaj, trwa generowanie rezultatów. Plik xlsx zapisze się w folderze z którego otworzyłeś program.")

df = pd.concat(map(pd.read_excel,['POL3.xlsx']))

if user_input:
    # Filtrowanie danych na podstawie wprowadzonej daty
    df = df[df['date'] <= user_input]

# Wybór kolumn z pliku excel
df = df[['home_team', 'home_result', 'away_team', 'away_result', 'year', 'margin', 'game_type', 'level', 'home_last_game', 'away_last_game']]

# Wprowadzenie rankingu wyjściowego, służącego określeniu wartości Elo dla pierwszego meczu
elo = {}
for index, row in df.iterrows():
    home_team = row['home_team']
    away_team = row['away_team']
    home_level = row['level']
    away_level = row['level'] 

    if home_team not in elo:
        if home_level == 1:
            elo[home_team] = 2000
        elif home_level == 2:
            elo[home_team] = 1600
        elif home_level == 3:
            elo[home_team] = 1300
        elif home_level == 4:
            elo[home_team] = 1100
        elif home_level == 5:
            elo[home_team] = 900    
        elif home_level == 6:
            elo[home_team] = 750        
        else:
            elo[home_team] = 600
    if away_team not in elo:
        if away_level == 1:
            elo[away_team] = 2000
        elif away_level == 2:
            elo[away_team] = 1600
        elif away_level == 3:
            elo[away_team] = 1300
        elif away_level == 4:
            elo[away_team] = 1100
        elif away_level == 5:
            elo[away_team] = 900    
        elif away_level == 6:
            elo[away_team] = 750        
        else:
            elo[away_team] = 600

# Funkcja przeliczająca prawdopodobieństwo wygranej w meczu
def expected(home_elo, away_elo):
    return 1 / (1 + 10**((away_elo - home_elo) / 400))

# Funkcja aktualizująca ranking Elo na podstawie wyniku meczu
k = {} #wskaźnik K określa rangę meczu - im wyższa liczba tym większe wahania rankingowe
for index, row in df.iterrows():
    game_type = row['game_type']
    if game_type == 'league':
        k = 20
    elif game_type == 'cup':
        k = 10

g = {} # Wskaźnik G mnoży całość formuły, w zależności od różnicy bramek w meczu
for index, row in df.iterrows():
    margin = row['margin']
    if margin <= 1:
        g = 1
    elif margin == 2:
        g = 1.5
    elif margin == 3:
        g = 1.75
    elif margin == 4:
        g = 1.875
    elif margin == 5:
        g = 2
    elif margin == 6:
        g = 2.125
    elif margin == 7:
        g = 2.25
    elif margin == 8:
        g = 2.375
    else:
        g = 2.5

def update_elo(home_team, away_team, result, k):
    home_elo = elo[home_team]
    away_elo = elo[away_team]
    expected_home = expected(home_elo, away_elo)
    expected_away = 1 - expected_home
    if result == 'draw':
        home_score = 0.5
        away_score = 0.5
    elif result == 'home':
        home_score = 1
        away_score = 0
    elif result == 'away':
        home_score = 0
        away_score = 1

    k *= g
    elo[home_team] += k * (home_score - expected_home)
    elo[away_team] += k * (away_score - expected_away)

# Aktualizacja rankingu po meczu, wartości home_last_game są aktualizowane na podstawie ostatniego roku meczu rozegranego przez daną drużynę
for index, row in df.iterrows():
    home_team = row['home_team']
    away_team = row['away_team']
    home_result = row['home_result']
    away_result = row['away_result']
    home_last_game = row['home_last_game']
    away_last_game = row['away_last_game']
    if home_result > away_result:
        result = 'home'
    elif home_result < away_result:
        result = 'away'
    else:
        result = 'draw'
    update_elo(home_team, away_team, result, k)

# Eksport wyliczeń do pliku xlsx
elo_df = pd.DataFrame.from_dict(elo, orient='index', columns=['Ranking'])
elo_df.index.name = 'Zespół'

# Dodawanie kolumn z ostatnim rokiem rozegranego meczu
last_game_dates = []
for team in elo_df.index:
    team_last_game = ''
    if team in df['home_team'].values:
        team_last_game = df.loc[df['home_team'] == team, 'home_last_game'].max()
    elif team in df['away_team'].values:
        team_last_game = df.loc[df['away_team'] == team, 'away_last_game'].max()
    last_game_dates.append(team_last_game)

elo_df['Ostatni mecz'] = last_game_dates

elo_df.to_excel('PLelo.xlsx')

print("Plik wygenerowany. Aby sformatować wyniki, bez udziału nieistniejących klubów, należy w pliku excel przefiltrować dane w kolumnie" "Ostatni mecz" "uwzględniając tylko rok, z którego pobierałeś dane oraz rok poprzedzający.")
print("Naciśnij Enter aby zakończyć.")
quit()