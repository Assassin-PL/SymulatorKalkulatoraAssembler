.386P
.model flat
public _addemMoj

.code
_addemMoj proc near
    push   ebp
    mov    ebp,esp



    mov    eax,[ebp+16]    ; third argument
    add    eax,[ebp+12]    ; second argument
    add    eax,[ebp+8]     ; first argument
    
    pop    ebp
    ret                   
_addemMoj endp
end