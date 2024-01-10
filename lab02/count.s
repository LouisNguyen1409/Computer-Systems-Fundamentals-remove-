# read a number n and print the integers 1..n one per line
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]

main:                 		# int main(void)
	la	$a0, prompt	# printf("Enter a number: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", number);
	syscall
	li 	$t0, 1
	move 	$t1, $v0
condition:
	ble	$t0, $t1, print	# while (i <= number)
	j	end		# {
print:
	move	$a0, $t0
	li	$v0, 1		# printf("%d", i);
	syscall

	li	$a0, '\n'	# printf("%c", '\n');
	li	$v0, 11
	syscall
	add	$t0, $t0, 1	# i++
	j	condition	# }
end:
	li	$v0, 0
	jr	$ra		# return 0

	.data
prompt:
	.asciiz "Enter a number: "
