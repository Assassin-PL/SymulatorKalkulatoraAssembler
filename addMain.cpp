#include <iostream>
using namespace std;

// Deklaracja funkcji assemblerowych
extern "C" int calculate_gross_salary(int hours, int rate);  // Oblicza wynagrodzenie brutto
extern "C" int calculate_net_salary(int gross_salary, int tax_rate);  // Oblicza wynagrodzenie netto
extern "C" int calculate_bonus(int net_salary, int bonus_percentage);  // Oblicza premi�

int main()
{
    const int NUM_EMPLOYEES = 3;

    int hours[NUM_EMPLOYEES] = { 40, 35, 45 };  // Liczba godzin dla ka�dego pracownika
    int rates[NUM_EMPLOYEES] = { 50, 60, 55 };  // Stawka godzinowa dla ka�dego pracownika zl/h
    int tax_rates[NUM_EMPLOYEES] = { 20, 25, 15 };  // Podatek dla ka�dego pracownika w %
    int bonus_percentages[NUM_EMPLOYEES] = { 10, 5, 12 };  // Premia dla ka�dego pracownika %

    int gross_salaries[NUM_EMPLOYEES];
    int net_salaries[NUM_EMPLOYEES];
    int bonuses[NUM_EMPLOYEES];
    int total_salaries[NUM_EMPLOYEES];

    for (int i = 0; i < NUM_EMPLOYEES; ++i) {
        gross_salaries[i] = calculate_gross_salary(hours[i], rates[i]);
        net_salaries[i] = calculate_net_salary(gross_salaries[i], tax_rates[i]);
        bonuses[i] = calculate_bonus(net_salaries[i], bonus_percentages[i]);
        total_salaries[i] = net_salaries[i] + bonuses[i];
    }

    cout << "Wynagrodzenia brutto:" << endl;
    for (int i = 0; i < NUM_EMPLOYEES; ++i) {
        cout << "Pracownik " << i + 1 << ": " << gross_salaries[i] << endl;
    }

    cout << "Wynagrodzenia netto:" << endl;
    for (int i = 0; i < NUM_EMPLOYEES; ++i) {
        cout << "Pracownik " << i + 1 << ": " << net_salaries[i] << endl;
    }

    cout << "Premie:" << endl;
    for (int i = 0; i < NUM_EMPLOYEES; ++i) {
        cout << "Pracownik " << i + 1 << ": " << bonuses[i] << endl;
    }

    int total_net_salary = 0;
    __asm {
        mov ecx, NUM_EMPLOYEES
        xor eax, eax
        lea esi, net_salaries
        lea edi, bonuses
        sum_loop :
        add eax, [esi + ecx * 4 - 4]
            add eax, [edi + ecx * 4 - 4]
            loop sum_loop
            mov total_net_salary, eax
    }

    cout << "Calkowite wynagrodzenie netto po premiach: " << total_net_salary << endl;

    // Obliczenie �redniego wynagrodzenia netto po premiach
    int average_net_salary = 0;
    __asm {
        mov eax, total_net_salary
        mov ecx, NUM_EMPLOYEES
        cdq                    // sign-extend EAX into EDX:EAX
        idiv ecx               // divide EDX:EAX by ECX, quotient in EAX, remainder in EDX
        mov average_net_salary, eax
    }

    cout << "Srednie wynagrodzenie netto po premiach: " << average_net_salary << endl;

    // Sortowanie wynagrodze�
    __asm {
        lea esi, total_salaries
        mov ecx, NUM_EMPLOYEES
        sort_outer :
        dec ecx
            jz sort_done
            mov ebx, ecx
            lea edi, total_salaries
            sort_inner :
        mov eax, [edi]
            cmp eax, [edi + 4]
            jle no_swap
            xchg eax, [edi + 4]
            mov[edi], eax
            no_swap :
        add edi, 4
            dec ebx
            jnz sort_inner
            jmp sort_outer
            sort_done :
    }

    cout << "Posegregowane wynagrodzenia netto po premiach:" << endl;
    for (int i = 0; i < NUM_EMPLOYEES; ++i) {
        cout << total_salaries[i] << endl;
    }

    return 0;
}
