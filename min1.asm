title Salary Calculation Functions   (salary_functions.asm)

.386P
.model flat, C
PUBLIC calculate_gross_salary, calculate_net_salary, calculate_bonus

.code

; calculate_gross_salary: Calculates gross salary given hours and rate
; Parameters:
;   - hours: Number of hours worked
;   - rate: Hourly rate
; Returns:
;   - gross salary (hours * rate)
calculate_gross_salary PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]    ; load hours into eax
    imul eax, [ebp+12]  ; multiply hours by rate

    pop ebp
    ret
calculate_gross_salary ENDP

; calculate_net_salary: Calculates net salary given gross salary and tax rate
; Parameters:
;   - gross_salary: Gross salary
;   - tax_rate: Tax rate in percentage
; Returns:
;   - net salary (gross_salary - (gross_salary * tax_rate / 100))
calculate_net_salary PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]        ; load gross salary into eax
    mov ecx, [ebp+12]       ; load tax rate into ecx
    imul eax, ecx           ; multiply gross salary by tax rate (eax now holds gross_salary * tax_rate)
    cdq                     ; sign extend eax into edx:eax for division
    mov ebx, 100
    idiv ebx                ; divide by 100 to get the tax amount in eax
    mov ecx, eax            ; store the tax amount in ecx
    mov eax, [ebp+8]        ; reload gross salary into eax
    sub eax, ecx            ; subtract tax amount from gross salary to get net salary

    pop ebp
    ret
calculate_net_salary ENDP

; calculate_bonus: Calculates bonus given net salary and bonus percentage
; Parameters:
;   - net_salary: Net salary
;   - bonus_percentage: Bonus percentage
; Returns:
;   - bonus (net_salary * bonus_percentage / 100)
calculate_bonus PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]        ; load net salary into eax
    mov ecx, [ebp+12]       ; load bonus percentage into ecx
    imul eax, ecx           ; multiply net salary by bonus percentage (eax now holds net_salary * bonus_percentage)
    cdq                     ; sign extend eax into edx:eax for division
    mov ebx, 100
    idiv ebx                ; divide by 100 to get the bonus amount in eax

    pop ebp
    ret
calculate_bonus ENDP


END
