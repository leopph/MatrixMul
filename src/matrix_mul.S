.intel_syntax noprefix

/*  x86 ASSEMBLY MATRIX MULTIPLICATION
    Löffler Levente
    R1NO3R
*/

.text
.global matrix_mul
matrix_mul:
    push ebp
    mov ebp, esp
    

    mov ecx, 0
    mov edx, [ebp + 20]
    imul edx, [ebp + 20] # store N * N in edx
NULLINGLOOP:
    cmp ecx, edx
    jge ENDNULLING

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

    push ebx # save ebx


    mov ebx, [ebp - 4] # store i
    imul ebx, [ebp + 20] # store i * N
    add ebx, ecx # store i * N + k

    mov eax, [ebp + 8] # store left
    mov eax, [eax + 4 * ebx] # store left[i * N + k]


    mov ebx, ecx # store k
    imul ebx, [ebp + 20] # store k * N
    add ebx, [ebp - 8] # store k * N + j

    mov edx, [ebp + 12] # store right
    mov edx, [edx + 4 * ebx] # store right[k * N + j]


    imul eax, edx # store left[i * N + k] * right[k * N + j]


    mov ebx, [ebp - 4] # store i
    imul ebx, [ebp + 20] # store i * N
    add ebx, [ebp - 8] # store i * N + j

    mov edx, [ebp + 16] # store output
    mov edx, [edx + 4 * ebx] # store output[i * N + j]


    add edx, eax # += assignment
    mov eax, [ebp + 16] # store output
    mov [eax + 4 * ebx], edx # write result to output's memory


    pop ebx # restore ebx

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