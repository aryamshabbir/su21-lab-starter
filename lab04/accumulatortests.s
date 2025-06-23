.import lotsofaccumulators.s

.data
inputarray:     .word 1,2,3,4,5,6,7,0      # Sanity test (should return 28)
input_five:     .word 1,2,3,0              # accumulatorfive should return 6 (but returns 5)
input_four:     .word 10,0                # accumulatorfour may return garbage
input_two:      .word 1,1,1,1,1,1,1,1,1,1,0  # accumulatortwo stack issue
input_one:      .word 5,6,7,0              # accumulatorone bad stack restore

TestPassed: .asciiz "Test Passed!\n"
TestFailed: .asciiz "Test Failed!\n"

.text
# Tests if the given implementation of accumulate is correct.
# Modify the test so that you can catch the bugs in four of the five solutions!

main:
    # === Sanity test ===
    la a0, inputarray
    jal accumulatorfive
    li t0, 28
    bne a0, t0, Fail

    # === Test for accumulatorfive: Skips first element ===
    la a0, input_five
    jal accumulatorfive
    li t0, 6
    bne a0, t0, Fail

    # === Test for accumulatorfour: Uninitialized t2 ===
    la a0, input_four
    jal accumulatorfour
    li t0, 10
    bne a0, t0, Fail

    # === Test for accumulatortwo: Stack pointer issue ===
    la a0, input_two
    jal accumulatortwo
    li t0, 10
    bne a0, t0, Fail

    # === Test for accumulatorone: Wrong restore from stack ===
    la a0, input_one
    jal accumulatorone
    li t0, 18
    bne a0, t0, Fail

    # === Control test: accumulatorthree (correct version) ===
    la a0, input_one
    jal accumulatorthree
    li t0, 18
    bne a0, t0, Fail

Pass:
    la a0, TestPassed
    jal print_string
    j End

Fail:
    la a0, TestFailed
    jal print_string

End:
    jal exit

print_int:
	mv a1, a0
    li a0, 1
    ecall
    jr ra

print_string:
	mv a1, a0
    li a0, 4
    ecall
    jr ra

exit:
    li a0, 10
    ecall