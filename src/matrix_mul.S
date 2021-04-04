.intel_syntax noprefix

/*  x86 ASSEMBLY MATRIX MULTIPLICATION
    Löffler Levente
    R1NO3R
*/

.text
.global matrix_mul
matrix_mul:
    # prologue
    push ebp
    mov ebp, esp
    

    # nulling loop init
    mov ecx, 0
    mov edx, [ebp + 20]
    imul edx, [ebp + 20] # store N * N in edx
NULLINGLOOP:
    # test loop condition
    cmp ecx, edx
    jge ENDNULLING

    # set matrix element to zero
    mov eax, [ebp + 16]
    mov dword ptr [eax + 4 * ecx], 0
    inc ecx
    jmp NULLINGLOOP

ENDNULLING:
    mov ecx, 0
OUTERLOOP:
    cmp ecx, [ebp + 20]
    jge EPILOGUE

    push ecx
    mov ecx, 0
MIDDLELOOP:
    cmp ecx, [ebp + 20]
    jge POSTOUTER

    push ecx
    mov ecx, 0
INNERLOOP:
    cmp ecx, [ebp + 20]
    jge POSTMIDDLE

    push esi # save esi
    push edi # save edi
    push ebx # save ebx


    mov esi, [ebp - 4] # store i
    imul esi, [ebp + 20] # store i * N
    add esi, ecx # store i * N + k

    mov eax, [ebp + 8] # store left
    mov eax, [eax + 4 * esi] # store left[i * N + k]


    mov esi, ecx # store k
    imul esi, [ebp + 20] # store k * N
    mov edi, [ebp - 8] # store j
    add esi, edi # store k * N + j

    mov edx, [ebp + 12] # store right
    mov edx, [edx + 4 * esi] # store right[k * N + j]


    imul eax, edx # store left[i * N + k] * right[k * N + j]


    mov esi, [ebp - 4] # store i
    imul esi, [ebp + 20] # store i * N
    add esi, [ebp - 8] # store i * N + j
    mov edx, [ebp + 16] # store output
    mov edx, [edx + 4 * esi] # store output[i * N + j]

    add edx, eax # += assignment
    mov eax, [ebp + 16] # store output
    mov [eax], edx # write result to output's memory

    pop ebx # restore ebx
    pop edi # restore edi
    pop esi # restore esi

    inc ecx
    jmp INNERLOOP

POSTMIDDLE:
    pop ecx
    inc ecx
    jmp MIDDLELOOP

POSTOUTER:
    pop ecx
    inc ecx
    jmp OUTERLOOP

EPILOGUE:
    mov esp, ebp
    pop ebp
    ret