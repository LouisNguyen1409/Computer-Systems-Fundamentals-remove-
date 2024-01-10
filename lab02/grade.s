# read a mark and print the corresponding UNSW grade
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]

main:
	la	$a0, prompt	# printf("Enter a mark: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", mark);
	syscall
	move	$t0, $v0


	la	$a0, fl
	blt 	$t0, 50, print	# if (mark < 50) goto print;
	la	$a0, ps
	blt	$t0, 65, print	# if (mark < 65) goto print;
	la	$a0, cr
	blt	$t0, 75, print	# if (mark < 75) goto print;
	la	$a0, dn
	blt	$t0, 85, print	# if (mark < 85) goto print;
	la	$a0, hd		# printf("HD\n");

print:
	li	$v0, 4
	syscall

	li	$v0, 0
	jr	$ra		# return 0

	.data
prompt:
	.asciiz "Enter a mark: "
fl:
	.asciiz "FL\n"
ps:
	.asciiz "PS\n"
cr:
	.asciiz "CR\n"
dn:
	.asciiz "DN\n"
hd:
	.asciiz "HD\n"
