/*  x86 ASSEMBLY MATRIX MULTIPLICATION
    Löffler Levente
    R1NO3R
*/

.intel_syntax noprefix

.global matrix_mul
matrix_mul:
    # prologue
    push ebp
    mov ebp, esp

    # store array length on ebp - 4
    # its <= 10 so eax is big enough
    mov eax, [ebp + 20]
    imul eax
    push eax

    # nulling loop init
    mov ecx, 0
NULLINGLOOP:
    # test loop condition
    cmp ecx, [ebp - 4]
    jge ENDNULLING

    # set matrix element to zero
    mov eax, [ebp + 16]
    mov dword ptr [eax + 4 * ecx], 0
    inc ecx
    jmp NULLINGLOOP

ENDNULLING:


    mov esp, ebp
    pop ebp
    ret