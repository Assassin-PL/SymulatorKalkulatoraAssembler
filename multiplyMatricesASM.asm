title Multiply Matrices Subroutine (multiplyMatricesASM.asm)

.386P
.model flat
public _multiplyMatricesASM

.code
_multiplyMatricesASM proc near
    push ebp
    mov  ebp, esp
    push ecx
    push ebx
    push esi
    push edi

    mov ecx, [ebp+12]      ; size
    xor ebx, ebx           ; row index

multiply_outer_loop:
    xor edi, edi           ; column index
multiply_inner_loop:
    xor esi, esi           ; sum
    xor edx, edx           ; k index

multiply_sum_loop:
    ; Calculate A[ebx][edx]
    mov eax, [ebp+8]       ; Load pointer to A
    mov esi, ebx           ; esi = row index
    imul esi, ecx          ; esi = row index * size
    add esi, edx           ; esi = row index * size + k index
    imul esi, 4            ; multiply by 4 (size of int)
    mov eax, [eax+esi]     ; A[ebx][edx]

    ; Calculate B[edx][edi]
    mov esi, [ebp+16]      ; Load pointer to B
    mov edi, edx           ; edi = k index
    imul edi, ecx          ; edi = k index * size
    add edi, ecx           ; edi = k index * size + column index
    imul edi, 4            ; multiply by 4 (size of int)
    mov esi, [esi+edi]     ; B[edx][edi]

    imul eax, esi
    add esi, eax           ; sum += A[ebx][edx] * B[edx][edi]
    inc edx
    cmp edx, ecx
    jl multiply_sum_loop

    ; Store result in C[ebx][edi]
    mov eax, [ebp+20]      ; Load pointer to C
    mov edx, ebx           ; edx = row index
    imul edx, ecx          ; edx = row index * size
    add edx, ecx           ; edx = row index * size + column index
    imul edx, 4            ; multiply by 4 (size of int)
    mov [eax+edx], esi     ; C[ebx][edi] = sum
    inc edi
    cmp edi, ecx
    jl multiply_inner_loop

    inc ebx
    cmp ebx, ecx
    jl multiply_outer_loop

    pop edi
    pop esi
    pop ebx
    pop ecx
    pop ebp
    ret
_multiplyMatricesASM endp
end
