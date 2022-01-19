.data
f:		.space 1600            #f[20][20]   20 * 20 * 4 = 1600
h:		.space 1600            #h[20][20]   20 * 20 * 4 = 1600
g: 		.space 1600 	       #g[20][20]   20 * 20- * 4 = 1600

ENTER :		.asciiz "\n"
SPACE : 	.asciiz " "

.text

	.macro printENTER		############## print enter
		la $a0 , ENTER
		li $v0 ,4
		syscall
	.end_macro 
	
	
 	.macro printSPACE		############# print SPACE
 		la $a0 , SPACE
 		li $v0 , 4
 		syscall
 	.end_macro

	.macro numin(%n)  		##########input a number
		li $v0 , 5
		syscall
		move %n , $v0
	.end_macro
	
	.macro getf(%dst,%i ,%j)     ########## dst = ( i * 20 + j ) * 4
		mul %dst , %i ,20
		add %dst , %dst , %j
		sll %dst , %dst , 2 
	.end_macro 
	
	.macro geth(%dst , %i, %j) ######################## get h
		mul %dst , %i , 20 
		add %dst , %dst , %j
		sll %dst , %dst , 2
		addiu %dst , %dst , 1600
	.end_macro

	.macro getg(%dst,%i,%j)  		###################get g
		mul %dst , %i , 20
		add %dst , %dst , %j
		sll %dst , %dst , 2
		addiu %dst , %dst , 3200
	.end_macro

	.macro numout(%n)                    ######output a number
		move $a0 , %n
		li $v0 , 1
		syscall
	.end_macro 

MAIN :
	numin($s0)                 ################# s0  is m1
	numin($s1)		   ################# s1  is n1
	numin($s2)		   ################# s2  is m2
	numin($s3)		   ################# s3  is n2
	move $t0 , $0              ################ t0 is i
	move $t1 , $0              ################ t1 is j
for_f_begin :
	bge $t0 , $s0 , for_f_end
	move $t1 , $0
	for_ff_begin :
		bge $t1 , $s1 , for_ff_end
		numin($t2)       ################## t2 is val of f[i][j]
		getf($t3,$t0,$t1) ################# t3 is address off[i][j]
		sw $t2 ,0($t3)    ################# scanf("%d" ,&f[i][j])
		addiu $t1 , $t1 , 1
		j for_ff_begin
	for_ff_end :
	addiu $t0 ,$t0 ,1
	j for_f_begin
for_f_end :


	move $t0 , $0
for_h_begin :
	bge $t0 , $s2 , for_h_end
	move $t1 , $0 
	for_hh_begin :
		bge $t1 , $s3 , for_hh_end
		numin($t2)    	############## t2 is the val of h[i][j]
		geth($t3, $t0 ,$t1)  ################ t3 is the address of h[i][j]
		sw $t2 , 0($t3) 	 ################# scanf("%d" ,&h[i][j])
		addiu $t1 , $t1 , 1
		j for_hh_begin
	for_hh_end :
	addiu $t0 , $t0 ,1
	j for_h_begin
for_h_end :


	move $t0 , $0 	############### t0 is i
	move $t1 , $0	################ t1 is j
	move $t2 , $0	############### t2 is k
	move $t3 , $0	############## t4 is l
	move $s4 , $s0 
	sub $s4 , $s4 , $s2
	addiu $s4 , $s4 ,1     	################### s4 = m1 - m2 + 1
	move $s5 , $s1
	sub $s5 , $s5 , $s3
	addiu $s5 , $s5 , 1  	#############################  s5  =  n1 - n2 + 1
	
for_i_begin :
	bge $t0 , $s4 , for_i_end
	move $t1 , $0
	for_j_begin :
		bge $t1 , $s5 , for_j_end
		move $t2, $0
		for_k_begin :
			bge $t2 , $s2 , for_k_end
			move $t3 , $0
			for_l_begin :
				bge $t3 , $s3 , for_l_end
				getg($t4,$t0,$t1)      ################# get the address of g[i][j]
				lw $t5 , 0($t4)		################ load the val of g[i][j] into t5
				add $t6 , $t0 , $t2   ################# t6 = i+ k
				add $t7 , $t1 , $t3	################# t7 = j+ l
				getf($s0,$t6,$t7) 	########### s0 = addr of f[i+k][j+l]
				lw $s1 , 0($s0)          ########### s1 = val of f[i+k][j+l]
				geth($t8,$t2,$t3)	########### t8 = addr of h[k][l]
				lw $t9 , 0($t8)    	########### t9 = val of h[k][l]
				mul $s1,$s1,$t9 	########### s1 = f[i+k][j+l] * h[k][l]
				add $t5 ,$t5 , $s1	########## g[i][j] += f[i+k][j+l] * h[k][l];
				sw $t5 , 0($t4)										
				addiu $t3 , $t3, 1	
				j for_l_begin
			for_l_end :
			addiu $t2 , $t2 , 1
			j for_k_begin
		for_k_end :
		addiu $t1 ,$t1 ,1
		j for_j_begin
	for_j_end :
	addiu $t0 , $t0 , 1
	j for_i_begin
for_i_end :

print : 
move $t0 , $0 ###############t0 is i

for_pi_begin :
	bge $t0 , $s4,for_pi_end	
	move $t1 , $0 #################### t1 is j
	for_pj_begin:
		bge $t1, $s5 , for_pj_end
		getg($t2 , $t0 , $t1)
		lw $t3 , 0($t2)
		numout($t3)
		printSPACE
		addiu $t1 , $t1 , 1
		j for_pj_begin
	for_pj_end:
	printENTER
	addiu $t0 , $t0 , 1
	j for_pi_begin
for_pi_end :


END : li $v0 , 10
	syscall



























































