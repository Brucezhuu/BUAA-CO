.data
str :    .space   40


ENTER : .ascii "\n"
NULL :   .ascii " "


.text
############# scanf a num into %n
	.macro numin(%n)
		li $v0 , 5
		syscall
		move %n , $v0
	.end_macro 
	
############# scanf a char into %n
	.macro charin(%n)
		li $v0, 12
		syscall
		move %n , $v0
	.end_macro
#############printf a numm from %n
	.macro numout(%i)
		move $a0 , %i
		li $v0 , 1
		syscall
	.end_macro
############### print ENTER
	.macro printENTER
		la $a0 , ENTER
		li $v0 , 4
		syscall
	.end_macro
########### print NULL
	.macro printNULL
		la $a0 , NULL
		li $v0 ,4
		syscall
	.end_macro	
#######################

intMAIN :
	addiu $s0 , $0 ,1 ############# s0 is flag = 1	
	numin($s1)       ######## $s1 is the length of str
	move $t0 , $0    ####### $t0 is i = 0;
for_i_begin :
	bge $t0 , $s1 , for_i_end
	charin($t1)   #########  get str[i]     $t1 is str[i]
	##sll $t2 , $t0 ,2   ######### $t2 is offset bytes
	sb $t1 , str($t0)   ##### strore str[i]
	addiu $t0 , $t0 ,1
	j for_i_begin
for_i_end :

	move $t1 , $0 
	##sll $t2 ,$t0 ,2
	sb $t1 , str($t0) ## str[len] = '\0'
	
	move $t0 , $0   ### t0 = ii;
	move $s2 , $s1 
	addi $s2 , $s2 ,-1
	sra $s2  ,$s2 , 1   ####### s2 = (len-1) >> 1
for_ii_begin :
	bgt $t0 , $s2 , for_ii_end
	move $t1 , $s1
	addi $t1 ,$t1 ,-1
	sub $t1 ,$t1,$t0     ## t1 = len - 1 -ii   t1 is offset
	##sll $t2 ,$t0 ,2
	##sll $t3 ,$t1 ,2
	lb $t4 , str($t0)  ### t4 = str[i]
	lb $t5 , str($t1) #### t5 = str[n-1-i]
	addiu $t0 , $t0 ,1
	beq $t4, $t5 , for_ii_begin
	move $s0 ,$0
	j for_ii_begin
for_ii_end :

	numout($s0)

end :
	li $v0 ,10
	syscall










	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	