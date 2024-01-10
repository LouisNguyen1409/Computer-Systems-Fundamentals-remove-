# Read a number and print positive multiples of 7 or 11 < n
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]

main:				# int main(void) {

	la	$a0, prompt	# printf("Enter a number: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", number);
	syscall
	move   	$t0, $v0
	li	$t1, 1
loop:
	blt	$t1, $t0, condition2	# if (1 < number) goto condition;
	j	end			# else goto end;
condition2:
	rem	$t2, $t1, 7	# if (number % 7 == 0) goto print;
	beq	$t2, $zero, print
	rem	$t2, $t1, 11	# if (number % 11 == 0) goto print;
	beq	$t2, $zero, print
	addi	$t1, $t1, 1	# number++;
	j	loop	# goto condition;
print:
	move	$a0, $t1	# printf("%d", number);
	li	$v0, 1
	syscall

	li	$a0, '\n'	# printf("%c", '\n');
	li	$v0, 11
	syscall
	addi	$t1, $t1, 1	# number++;
	j	loop		# goto condition;
end:
	li	$v0, 0
	jr	$ra		# return 0

	.data
prompt:
	.asciiz "Enter a number: "
