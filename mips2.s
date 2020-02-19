main:


gcd:
    # $s0 holds the divisor
    # $s1 holds the value taken from the $hi register (remainder)
    # $s2 holds the value for a
    # $s3 holds the value for b
    # $s7 holds final result

    bgt $s2, $s3, aGreater_if   # if $s2 > $s3 then aGreater_if
    # Checks whether a is greater than b
    j aGreater_else:
    aGreater_if:
        divu $s2, $s3
        # Move larger int to s4 and smaller int to s5
        sw $s4, $s2
        sw $s5, $s3
        # store divisor in s0 and remainder in s1
        sw $s0, $s3
        sw $s1, $hi
        j rem0

    aGreater_else:
        divu $s3, $s2
        # Move larger int to s4 and smaller int to s5
        sw $s4, $s3
        sw $s5, $s2
        # store divisor in s0 and remainder in s1
        sw $s0, $s2
        sw $s1, $hi

    rem0:
        bne	$s1, $0, else_rem0	# if $s0 != $0 then else_rem0
        if_rem0:
            sw $s7, $s0
            j endProg

        else_rem0:
            j gcdOrdered


gcdOrdered:
    # $s4 holds larger integer
    # $s5 holds smaller integer
    divu $s4, $s5
    # $s1 holds remainder still
    bne $s1, $0, else
    if:
        sw $s7, $s5
        j endProg
    else:
        sw $s2, $s4
        sw $s3, $hi
        j gcd


endProg: