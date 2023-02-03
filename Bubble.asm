; bubble sort algorithm in 80x86 

; define the number of elements to 


num_elements = 5

assembly language

; define the number 

; 

; define the number 

; of elements to sort
num_elements = 
num_elements = 5

; define the array 
num_elements 

; define the array 
num_elements to sort
array dw 
array dw 1, 

; 

; 5, 3, 2, 4

; 

; set up the stack
mov ax, @data
mov ds, ax

; sort the array 
mov ax, @data
mov ds, ax

; sort the array using the bubble sort algorithm
mov cx, num_elements


mov cx, num_elements

sort_loop:
    ; assume the array is already sorted
    mov bx, 
    mov bx, 1



; 



; inner_loop:
    ; 
mov ax, 
mov ax, 
mov ax, @
compare two adjacent elements
    mov ax, [array + bx * 
mov ds, ax

; sort the 
    mov ax, [array + bx * 
mov ds, ax

; sort the 
mov ds, ax

; sort the

mov ds, ax

; sort

mov ds, ax


mov ds, ax

mov ds,

mov ds

mov d

mov

m
2]
    cmp ax, [array + bx * 
    cmp ax, [array + bx * 2 + 
mov cx, num_elements

sort_loop:
    ; assume the 
mov cx, num_elements

sort_loop:
    ; assume the 
mov cx, num_elements

sort_loop:
    ; assume the

mov cx, num_elements

sort_loop:
    ;

mov cx, num_elements

sort_loop:
   

mov cx, num_elements

sort_loop:

mov cx, num_elements

sort_loop

mov cx, num_elements

sort_

mov cx, num_elements

sort

mov cx, num_elements


mov cx, num_elements

mov cx, num_e

mov cx, num_

mov cx, num

mov cx

mov

m
2]

    ; 

    ; if the first element 
    mov bx, 
    mov bx, 
    mov bx,

    mov bx

    mov b

    mov

   
is greater than the second element, swap them
    jg swap

    ; move 

inner_loop:
    ; compare two adjacent elements
    mov ax, [
    jg swap

    ; move 

inner_loop:
    ; compare two adjacent elements
    mov ax, [

inner_loop:
    ; compare two adjacent elements
    mov ax, [


inner_loop:
    ; compare two adjacent elements
    mov ax,


inner_loop:
    ; compare two adjacent elements
    mov ax


inner_loop:
    ; compare two adjacent elements
    mov


inner_loop:
    ; compare two adjacent elements
   


inner_loop:
    ; compare two adjacent elements


inner_loop:
    ; compare two adjacent


inner_loop:
    ; compare two


inner_loop:
    ; compare


inner_loop:
   


inner_loop:


inner_


to the next pair of elements
    inc bx
    cmp bx, cx
    jne inner_loop

    ; move 
    inc bx
    cmp bx, cx
    jne inner_loop

    ; move to the 
    cmp ax, [
    cmp ax, [
    cmp ax, [

    cmp ax,

    cmp ax

    cmp

    c

   
next iteration of the outer loop
    dec cx
    jne sort_loop

; display the sorted array
mov cx, num_elements


    dec cx
    jne sort_loop

; display the sorted array
mov cx, num_elements

print_loop:
    mov ax, [array + cx * 2]
    call print_num
    dec cx
    jne print_loop

; 

    ; if the 
    dec cx
    jne print_loop

; 

    ; if the 

    ; if the


    ; if


    ;


   


exit the program
mov ax, 
mov ax, 4c00h
int 
int 21h

; swap two elements 
    jg swap

    ; move 

; swap two elements 
    jg swap

    ; move 
    jg swap

    ;

    jg
in the array
swap:
    mov dx, [array + bx * 
    inc bx
    cmp bx, cx
    jne inner_loop

    ; move 
    inc bx
    cmp bx, cx
    jne inner_loop

    ; move 
    inc bx
    cmp bx, cx
    jne inner_loop

    ;

    inc bx
    cmp bx, cx
    jne inner_loop

   

    inc bx
    cmp bx, cx
    jne inner_loop


    inc bx
    cmp bx, cx
    jne inner_loop

    inc bx
    cmp bx, cx
    jne inner_

    inc bx
    cmp bx, cx
    jne 
    inc bx
    cmp bx, cx
    jne

    inc bx
    cmp bx, cx
    j

    inc bx
    cmp bx, cx
   

    inc bx
    cmp bx, cx

    inc bx
    cmp bx,

    inc bx
    cmp bx

    inc bx
    cmp b

    inc bx
    cmp

    inc bx
    c

    inc bx
   

    inc bx

    inc b

    inc

   
2]
    mov [array + bx * 
    mov [array + bx * 2], [array + bx * 2 + 
   
2]
    mov [array + bx * 
    jne sort_loop

; display the sorted 
    mov [array + bx * 
    jne sort_loop

; display the sorted 
    jne sort_loop

; display the sorted

    jne sort_loop

; display the

    jne sort_loop

; display

    jne sort_loop

;

    jne sort_loop


    jne sort_loop

    jne sort_

    jne sort

    jne

    j

   
2 + 
mov cx, num_elements

print_loop:
    mov ax, [
mov cx, num_elements

print_loop:
    mov ax, [
mov cx, num_elements

print_

mov cx, num_elements

print

mov cx, num_elements


mov cx, num_elements

mov cx

mov

m
2], dx
    jmp inner_loop

; print a number 
    jmp inner_loop

; print a number to the screen
print_num:
    ; convert the number 
    ;

   

    jne print_loop

; exit the program
mov ax, 
    jne print_loop

; exit the program
mov ax,

    jne print_loop

; exit the program
mov ax

    jne print_loop

; exit the program
mov

    jne print_loop

; exit the program
m

    jne print_loop

; exit the program

    jne print_loop

; exit the

    jne print_loop

; exit

    jne


; swap two elements 

; swap two elements

swap:
    mov dx, [
swap:

    mov [
    mov [

    mov [
    jmp inner_loop

; print a number 
    jmp inner_loop

; print a number

    jmp inner_loop

; print a

    jmp inner_loop

;

    jmp inner_loop


    jmp inner_loop

    jmp 
    jmp

    j

   

print_num

print_

print
to a 
    jne print_loop

; exit the program
mov ax, 

; swap two elements 
swap:
    mov dx, [
    mov [
    mov [
    jmp inner_loop

; print a number 
print_num:
    ; string
    mov bx, 
    mov bx,

    mov bx

    mov b

    mov

   
10
    mov cx, 
    mov cx,

    mov cx

    mov

   
0



convert_


convert


convert_loop:
    mov dx, 
    mov dx,

    mov dx

   
0
    div bx
    push dx
    inc cx
    cmp ax, 
    div bx
    push dx
    inc cx
    cmp ax,

    div bx
    push dx
    inc cx
    cmp ax

    div bx
    push dx
    inc cx
    cmp

    div bx
    push dx
    inc cx
    c

    div bx
    push dx
    inc cx
   

    div bx
    push dx
    inc cx

    div bx
    push dx
    inc

    div bx
    push dx
   

    div bx
    push dx

    div bx
    push

    div bx
   

    div bx

    div b

    div

   
0
    jne convert_loop

    ; print the 
    jne convert_loop

    ; print the

    jne convert_loop

    ; print

    jne convert_loop

    ;

    jne convert_loop

   

    jne convert_loop


    jne convert_loop

    jne convert_
string to the screen
    mov ah, 
    mov ah,

    mov
02h



print_loop


print_


print


print_loop:
    pop dx
    add dl, 
    pop dx
    add dl,

    pop dx
    add dl

    pop dx
    add d

    pop dx
    add

    pop dx
   

    pop dx

    pop

   
'0'
    int 
    int

   
21h
    dec cx
    jnz print_loop

    ret

    dec cx

    dec