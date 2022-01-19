.data 
	a : .space    400   #a[10][10] 
	b : .space    400   #b[10][10]
	c : .space    400   #c[10][10]
	ENTER : .asciiz   "\n"
	NULL :  .asciiz  " "

.text
	#  get the address of a[i][j] to dst;
	.macro geta(%dst, %i ,%j)
		mul $t7 , %i, 10
		move %dst , $t7
		addu %dst ,%dst,%j
		sll %dst ,%dst ,2
	.end_macro
	# get the address of b[i][j]
	.macro getb(%dst,%i,%j)
		mul $t7 , %i,10
		move %dst , $t7 
		addu %dst ,%dst ,%j
		sll %dst , %dst ,2
		addiu %dst ,%dst ,400
	.end_macro
	#get the address of c[i][j]
	.macro getc(%dst,%i,%j)
		mul $t7 , %i,10
		move %dst , $t7
		addu %dst ,%dst ,%j
		sll %dst , %dst ,2
		addiu %dst ,%dst ,800
	.end_macro
	# print ENter
	.macro pENTER
		la $a0,ENTER
		li $v0 ,4
		syscall
	.end_macro 
	#print null
	.macro pNULL 
		la $a0 , NULL
		li $v0 , 4
		syscall
	.end_macro
	# input a num to %n
	.macro numin(%n)
		li $v0 , 5
		syscall
		move %n ,$v0
	.end_macro
	# output a num from %n
	.macro numout(%n)
		li $v0 1
		move $a0 ,%n
		syscall
	.end_macro
	
begin_program :
	# s0 store n   
	numin($s0)
	
################### get the num in a
	li $t0 ,0 ## i
	li $t1 ,0 ## j
for_i_begin:
	slt $t3 , $t0 ,$s0
	beq $t3 ,$0 ,for_i_end
	li $t1 , 0
	for_j_begin :
		slt $t4 , $t1 , $s0
		beq $t4 , $0 , 	for_j_end
		numin($t5)    ### t5 recerive the num in a;
		geta($t6,$t0,$t1)
		sw $t5,0($t6)	
		addiu $t1 , $t1 ,1
		j for_j_begin
	for_j_end:
	addiu $t0 ,$t0 ,1
	j for_i_begin
for_i_end:
################## get the num in b
	li $t0 ,0 ## i
	li $t1 ,0 ## j
	li $t3 ,0
	li $t4 ,0
for_ii_begin:
	slt $t3 , $t0 , $s0
	beq $t3 ,$0 ,for_ii_end
	li $t1 , 0
	for_jj_begin:
        	slt $t4 , $t1,$s0
        	beq $t4 , $0 , for_jj_end
        	numin($t5)
        	getb($t6,$t0,$t1)
        	sw $t5 ,0($t6)
        	addiu $t1 , $t1 ,1
        	j for_jj_begin
        for_jj_end :
        addiu $t0 ,$t0 ,1
        j for_ii_begin
for_ii_end:
############## calculate
cal :
	li $t0 ,0 ## i
	li $t1 ,0 ## j
	li $t3 ,0 ## k
	li $t4 ,0 ##cmp z
	li $t5 ,0 ##cmp 0
	li $t6 ,0 ##Cmp 0
for_iii_begin :
	slt $t4 ,$t0 ,$s0
	beq $t4 ,$0 ,for_iii_end
	li $t1 ,0  # j = 0 
	li $t3 ,0  ## k = 0
	for_jjj_begin:
		slt $t5 , $t1 , $s0
		beq $t5 ,$0 , for_jjj_end
		li $t3 ,0
		for_k_begin :
			slt $t6 , $t3 ,$s0
			beq $t6 ,$0 , for_k_end
			getc($s1,$t0,$t1) ## s1 store c[i][j] address
			geta($s2,$t0,$t3) ## s2 store a[i][k] address
			getb($s3,$t3,$t1) ## s3 store b[k][j] address
			lw $s4 , 0($s2)  ## s4 : val of a[i][k]
			lw $s5 , 0($s3)  ## s5 : val of b[k][j]
			mult $s4 ,$s5
			mflo $t2    #  t2 = s4 * s5 = a[i][k] * b[k][j]
			add $s6 , $s6 , $t2   # s6 = c[i][j]
			addiu $t3 , $t3 ,1
			j for_k_begin
		for_k_end :
		sw $s6 ,0($s1)
		move $s6 , $0
		addiu $t1 ,$t1 ,1
		j for_jjj_begin
	for_jjj_end:
	addiu $t0 ,$t0 ,1
	j for_iii_begin
for_iii_end :
	
########333 print

print: 
	li $t0 ,0 ###   i
	li $t1 ,0 ###   j
	li $t2 ,0 ### tmpi
	li $t3 ,0 ### tmpj
for_iiii_begin :
	slt $t2 , $t0 , $s0
	beq $t2 , $0 , for_iiii_end
	li $t1 , 0 
	li $t3 , 0 
	for_jjjj_begin :
		slt $t3 , $t1 , $s0 
		beq $t3 , $0 , for_jjjj_end
		getc($s6, $t0 ,$t1) ## s6 get the address
		lw $s7 , 0($s6)		## load val to s7	
		numout($s7)
		pNULL
		addiu $t1 $t1 ,1
		j for_jjjj_begin
	for_jjjj_end :
	addiu $t0, $t0 ,1
	pENTER
	j for_iiii_begin
for_iiii_end :
	
	
end : li $v0, 10
syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	