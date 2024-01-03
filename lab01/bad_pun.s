.text
main:
	li 	$v0, 4
	la 	$a0, msg
	syscall
	li 	$v0, 0
	jr 	$ra
.data
msg: .asciiz "Well, this was a MIPStake!\n"