.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit
    
factorial:
    # Base case: if n == 0, return 1
    beq a0, x0, base_case

    # Initialize result to 1
    addi t0, x0, 1    # t0 will hold the result (result = 1)
    addi t1, x0, 1    # t1 will be the counter (i = 1)

loop:
    # Check if t1 > n
    bgt t1, a0, end_loop

    # result *= i
    mul t0, t0, t1    # t0 = t0 * t1

    # i++
    addi t1, t1, 1    # t1 = t1 + 1

    # Repeat the loop
    jal x0, loop

end_loop:
    # Return the result in a0
    mv a0, t0         # Move the result to a0
    jr ra             # Return from the function

base_case:
    # If n == 0, return 1
    addi a0, x0, 1    # Return 1
    jr ra             # Return from the function
