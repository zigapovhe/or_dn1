# test addi
# addi Rd,Rs,immed
# 16: addrsel=pc imload=1
#    aluop=add op2sel=immed dwrite=1 regsrc=aluout, goto pcincr
# add 5 + 4 = 9
# sub 9 - 1 = 8
# divi 8 / 2 = 4 
# muli 4 * 3 = 12
# remi 12 % 5 = 2

# main: li r0, 5 # 4 periode
#      addi r1, r0, 4 # 5 periode
#      subi r2, r1, 1 # 5 periode
#      divi r3, r2, 2 # 5 periode
#      muli r4, r3, 3 # 5 periode
#      remi r5, r4, 5 # 5 periode


main:	li	r0, 16		# r0 is the loop counter
		li	r1, 64	# r1 is current value (start ASCII char 64 @,A,B,C,D,...)
		li	r2, -1	# Used to decrement r0
		li	r3, 1		# Used to increment r1 
		li	r4, 1	      # Bit Pattern to be shown on FB 
            li    r5, -2      # Bit Pattern to be shown on FB
loop:	sw	r1, 32768		# Save current value to TTY...	
            sw	r1, 49152	# Save current value to RGB_LED...
		sw	r5, 16384	# Save current value to FB (0th line)...	
            sw    r4, 16385   # Save current value to FB (1st line)...
            sw    r5, 16386   # Save current value to FB (2nd line)...
            sw    r4, 16387   # Save current value to FB (5th line)...
            sw    r5, 16388   # Save current value to FB (5th line)...
            sw    r4, 16389   # Save current value to FB (6th line)...
            sw    r5, 16390   # Save current value to FB (7th line)...
            sw    r4, 16391   # Save current value to FB (8th line)...
            sw    r5, 16392   # Save current value to FB (9th line)...
            sw    r4, 16393   # Save current value to FB (10th line)...
            sw    r5, 16394   # Save current value to FB (11th line)...
            sw    r4, 16395   # Save current value to FB (12th line)...
            sw    r5, 16396   # Save current value to FB (13th line)...
            sw    r4, 16397   # Save current value to FB (14th line)...
            sw    r5, 16398   # Save current value to FB (15th line)...
		sw	r4, 16399	# Save current value to FB (16th line)...	
		add	r1, r1, r3	# r1 ... increment value
		add	r0, r0, r2	# r0 ... decrement counter
		muli	r4, r4, 2	# r4 ... move 1 bit left (add is multiply by 2)
            muli	r5, r5, 2	# r5 ... move 1 bit left (add is multiply by 2)
		jnez	r0, loop	# loop if r0 != 0
		jnez	r1, main	# loop if r1 != 0 -> loop forever

