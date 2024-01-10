# Read three numbers `start`, `stop`, `step`
# Print the integers bwtween `start` and `stop` moving in increments of size `step`
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]

main:				# int main(void)
	la	$a0, prompt1	# printf("Enter the starting number: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", number);
	syscall
	move	$t0, $v0

	la	$a0, prompt2	# printf("Enter the stopping number: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", number);
	syscall
	move	$t1, $v0

	la	$a0, prompt3	# printf("Enter the step size: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", number);
	syscall
	move	$t2, $v0

condition1:
	blt	$t1, $t0, condition2	# if (stop < start) goto condition2;
	j	condition3		# else goto condition3;

condition2:
	move 	$t3, $t0		# temp = start;
	bltz	$t2, conditionl1	# if (step < 0) goto conditionl1;
	j	condition3		# else goto condition3;

conditionl1:
	bge	$t3, $t1, print1	# if (start >= stop) goto print;
	j	condition3		# else goto end;
condition3:
	bgt	$t1, $t0, condition4	# if (stop > start) goto condition4;
	j	end			# else goto end;
condition4:
	move	$t3, $t0		# temp = start;
	bgez	$t2, conditionl2	# if (step >= 0) goto conditionl2;
	j	end			# else goto end;
conditionl2:
	ble	$t3, $t1, print2	# if (start <= stop) goto print
	j	end			# else goto end;
print1:
	move	$a0, $t3		# printf("%d", temp);
	li	$v0, 1
	syscall

	li	$a0, '\n'		# printf("%c", '\n');
	li	$v0, 11
	syscall

	add	$t3, $t3, $t2		# temp += step;
	j	conditionl1		# goto conditionl1;
print2:
	move	$a0, $t3		# printf("%d", temp);
	li	$v0, 1
	syscall

	li	$a0, '\n'		# printf("%c", '\n');
	li	$v0, 11
	syscall

	add	$t3, $t3, $t2		# temp += step;
	j	conditionl2		# goto conditionl1;
end:
	li	$v0, 0
	jr	$ra		# return 0

	.data
prompt1:
	.asciiz "Enter the starting number: "
prompt2:
	.asciiz "Enter the stopping number: "
prompt3:
	.asciiz "Enter the step size: "
