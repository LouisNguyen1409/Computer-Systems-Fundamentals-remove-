# A simple MIPS program that calculates the Gaussian sum between two numbers

# int main(void)
# {
#   int number1, number2;
#
#   printf("Enter first number: ");
#   scanf("%d", &number1);
#
#   printf("Enter second number: ");
#   scanf("%d", &number2);
#
#   int gaussian_sum = ((number2 - number1 + 1) * (number1 + number2)) / 2;
#
#   printf("The sum of all numbers between %d and %d (inclusive) is: %d\n", number1, number2, gaussian_sum);
#
#   return 0;
# }

main:

	#
	# TODO: add your code HERE
	#
	li  	$v0, 4
	la  	$a0, prompt1
	syscall

	li  	$v0, 5
	syscall
	move	$t1, $v0

	li  	$v0, 4
	la  	$a0, prompt2
	syscall

	li  	$v0, 5
	syscall
	move	$t2, $v0

	sub 	$t3, $t2, $t1
	addi	$t3, $t3, 1

	add 	$t4, $t1, $t2

	mul 	$t5, $t3, $t4
	div 	$t5, $t5, 2

	li  	$v0, 4
	la  	$a0, answer1
	syscall

	li  	$v0, 1
	move	$a0, $t1
	syscall

	li  	$v0, 4
	la  	$a0, answer2
	syscall

	li  	$v0, 1
	move	$a0, $t2
	syscall

	li  	$v0, 4
	la  	$a0, answer3
	syscall

	li  	$v0, 1
	move	$a0, $t5
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

	li   	$v0, 0
	jr  	$ra          # return


.data
	prompt1: .asciiz "Enter first number: "
	prompt2: .asciiz "Enter second number: "

	answer1: .asciiz "The sum of all numbers between "
	answer2: .asciiz " and "
	answer3: .asciiz " (inclusive) is: "
