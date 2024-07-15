title Subtract Matrices Subroutine (subtractMatricesASM.asm)

.386P
.model flat
public _subtractMatricesASM

.code
_subtractMatricesASM proc near
    push ebp
    mov  ebp, esp
    push ecx
    push ebx
    push esi

    mov ecx, [ebp+12]      ; size
    imul ecx, ecx          ; size * size (total elements)
    xor ebx, ebx           ; index

subtract_loop:
    mov esi, [ebp+8]       ; Load pointer to A
    mov edi, [ebp+16]      ; Load pointer to B
    mov edx, [ebp+20]      ; Load pointer to C

    mov eax, [esi+ebx*4]   ; A[ebx]
    sub eax, [edi+ebx*4]   ; A[ebx] - B[ebx]
    mov [edx+ebx*4], eax   ; C[ebx] = A[ebx] - B[ebx]

    inc ebx
    cmp ebx, ecx
    jl subtract_loop

    pop esi
    pop ebx
    pop ecx
    pop ebp
    ret
_subtractMatricesASM endp
end