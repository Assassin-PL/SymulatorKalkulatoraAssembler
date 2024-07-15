# Symulator Mikroprocesora

## Przegląd
Ten projekt to symulator mikroprocesora napisany w C++ i assemblerze. Główne funkcje obejmują obliczenia wynagrodzeń, takie jak obliczanie wynagrodzenia brutto, netto oraz premii. Projekt demonstruje integrację kodu assemblerowego z kodem C++.

## Funkcje
- **Obliczanie wynagrodzeń:** Funkcje do obliczeń wynagrodzenia brutto, netto oraz premii.
- **Integracja C++ i Assembler:** Połączenie logiki napisanej w C++ z funkcjami assemblerowymi.
- **Operacje na danych:** Przykłady operacji arytmetycznych i logicznych w assemblerze.

## Wymagania
- Visual Studio lub inny kompilator C++ zgodny z assemblerem

## Instalacja
1. Sklonuj repozytorium:
    ```sh
    git clone https://github.com/Assassin-PL/SymulatorKalkulatoraAssembler.git
    ```
2. Przejdź do katalogu projektu:
    ```sh
    cd your-repository
    ```
3. Otwórz projekt w Visual Studio lub innym preferowanym IDE.

## Użycie
1. Skompiluj i uruchom projekt w wybranym IDE.
2. Program wykona obliczenia wynagrodzeń i wyświetli wyniki na konsoli.

## Opis Plików
- `addMain.cpp`: Główny plik programu w C++, integrujący funkcje napisane w assemblerze do obliczeń wynagrodzeń.
- `addemMoj.asm`: Funkcja assemblerowa dodająca trzy argumenty.
- `fun.asm`: Funkcja assemblerowa obliczająca wartość według wzoru 20*z^2 - 100*y + x.
- `fun2.asm`: Funkcja assemblerowa zamieniająca małe litery na wielkie w łańcuchu znaków.
- `fun3.asm`: Prosta funkcja assemblerowa dodająca 10 do pierwszego argumentu.
- `min1.asm`: Zbiór funkcji assemblerowych do obliczeń wynagrodzeń:
  - `calculate_gross_salary`: Oblicza wynagrodzenie brutto na podstawie liczby godzin i stawki godzinowej.
  - `calculate_net_salary`: Oblicza wynagrodzenie netto na podstawie wynagrodzenia brutto i stawki podatku.
  - `calculate_bonus`: Oblicza premię na podstawie wynagrodzenia netto i procentu premii.

## Przykładowe Użycie
Aby skompilować i uruchomić projekt, otwórz plik `addMain.cpp` w Visual Studio, skompiluj go i uruchom. Wyniki obliczeń wynagrodzeń zostaną wyświetlone na konsoli.

## Wkład w Projekt
Wkłady są mile widziane! Proszę forkować repozytorium i przesyłać pull requesty.

## Licencja
Ten projekt jest licencjonowany na podstawie licencji MIT. Zobacz plik [LICENSE](LICENSE) po więcej szczegółów.

---

Jeśli napotkasz jakiekolwiek problemy lub masz sugestie dotyczące usprawnień, proszę dać znać. Miłej pracy!
