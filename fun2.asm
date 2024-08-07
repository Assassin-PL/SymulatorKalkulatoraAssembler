title The fun Subroutine    (fun2.asm)

; This subroutine links to Visual C++ 6.0.

.386P
.model flat
public _fun2

.code
_fun2 proc near   ; Zamiana w tablicy ma�ych liter na wielkie
    push ebp
    mov ebp, esp
    push ecx
    push edx
    push edi
    push esi

    mov esi, [ebp+8]	; pierwszy argument funkcji
    mov ecx, 100h		; maksymalny zakres poszukiwania ko�ca �a�cucha  znak�w -> 256 znakow
	mov edi, 0			; licznik d�ugo�ci �a�cucha
ptl:
	mov dl, [esi]
	cmp dl, 0h
	je dalej
	inc esi
	inc edi
	loop ptl
dalej:				
	mov esi, [ebp+12]	; wyznaczenie drugiego argumentu funkcji - d�ugo�ci �a�cucha
	mov [esi], edi

	mov ecx, edi				; d�ugo�� p�tli = d�ugo�ci �a�cucha znak�w
    mov esi, [ebp+8]
ptl1:
	mov dl, [esi]
	cmp dl, 'a'
	jb nierob
	cmp dl, 'z'
	ja nierob
	sub dl, 20h
nierob:
    mov [esi], dl
	inc esi
	loop ptl1
	 
	mov eax, 0h		; return 0

    pop esi
    pop edi
    pop edx
    pop ecx
    pop ebp
    ret                   
_fun2 endp
end

