# Read a number n and print the first n tetrahedral numbers
# https://en.wikipedia.org/wiki/Tetrahedral_number
#
# Before starting work on this task, make sure you set your tab-width to 8!
# It is also suggested to indent with tabs only.
#
# YOUR-NAME-HERE, DD/MM/YYYY

#![tabsize(8)]

main:
	# Locals:
	# - $t0: int i
	# - $t1: int j
	# - $t2: int n
	# - $t3: int total
	# - $t4: int how_many

	li	$v0, 4					# syscall 4: print_string
	la	$a0, prompt				#
	syscall						# printf("Enter how many: ");

	li	$v0, 5					# syscall 5: read_int
	syscall						#
	move	$t4, $v0				# scanf("%d", number);

loop_n_to_how_many__init:
	li	$t2, 1					# n = 1;

loop_n_to_how_many__cond:
	bgt	$t2, $t4, loop_n_to_how_many__end	# while (n <= how_many) {

loop_n_to_how_many__body:
	li	$t3, 0					#   total = 0
loop_j_to_n__init:
	li	$t1, 1					#   j = 1
loop_j_to_n__cond:
	bgt	$t1, $t2, loop_j_to_n__end		#   while (j <= n) {

loop_j_to_n__body:
loop_i_to_j__init:
	li	$t0, 1					#     i = 1

loop_i_to_j__cond:
	bgt	$t0, $t1, loop_i_to_j__end		#     while (i <= j) {
loop_i_to_j__body:
	add	$t3, $t3, $t0				#       total = total + i
loop_i_to_j__step:
	addi	$t0, $t0, 1				#       i = i + 1
	j	loop_i_to_j__cond			#    }

loop_i_to_j__end:
loop_j_to_n__step:
	addi	$t1, $t1, 1				#     j = j + 1
	j	loop_j_to_n__cond			#   }

loop_j_to_n__end:
	li	$v0, 1					#   syscall 1: print_int
	move	$a0, $t3				#
	syscall						#   printf("%d", total);

	li	$v0, 11					#   syscall 11: print_char
	li	$a0, '\n'				#
	syscall						#   printf("%c", '\n');
loop_n_to_how_many__step:
	addi	$t2, $t2, 1				#   n = n + 1
	j	loop_n_to_how_many__cond		# }

loop_n_to_how_many__end:
	li   $v0, 0					#
	jr   $ra					# return 0;

	.data
prompt:
	.asciiz	"Enter how many: "