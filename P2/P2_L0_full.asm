.data  
vis :	.space 28    ######## int vis[7]
ans : 	.space 28    ######## int ans[28]

ENTER : 	.asciiz "\n"
SPACE : 	.asciiz " "

.text
	.macro getv(%dst , %i)
		move %dst , %i
		sll %dst , %dst , 2
	.end_macro
	
	.macro geta(%dst , %i)
		move %dst ,%i
		sll %dst , %dst ,2
		addiu %dst , %dst , 28
	.end_macro
	
	.macro numin(%n)
		li $v0 , 5
		syscall
		move %n , $v0
	.end_macro 
	.macro numout(%n)
		move $a0 , %n
		li $v0 , 1
		syscall
	.end_macro
	.macro printENTER
		la $a0 , ENTER
		li $v0 , 4
		syscall
	.end_macro
	
	.macro printSPACE
		la $a0 , SPACE
		li $v0 , 4
		syscall
	.end_macro
	#################±£»¤¶ÁÈ¡¼Ä´æÆ÷
	.macro LOAD_LOCAL(%var)
		addi $sp , $sp ,4
		lw %var , 0($sp)
	.end_macro
	
	.macro SAVE_LOCAL(%var)
		sw %var 0($sp)
		addi $sp , $sp , -4
	.end_macro
	
MAIN :
	numin($s0)  ############# s0 = n  global no need to store 
	move $a0 , $0   #### a0 = index
	jal FULL
END:    
	li $v0 , 10
	syscall	
	
	
FULL :
	SAVE_LOCAL($a0)
	SAVE_LOCAL($ra)
	bge $a0 , $s0 ,print
	move $t0 , $0 ################   i 
for_begin:
	bge $t0 , $s0 , for_end
	getv($t1,$t0)
	lw $t2 , 0($t1)   ############## t2 is val of vis[i]
	beq $t2 , $0 , work
	addi $t0 , $t0 , 1
	j for_begin 
for_end:
	LOAD_LOCAL($ra)	
	LOAD_LOCAL($a0)
	jr $ra
	
work:
	geta($t3 , $a0)  ####### t3 = addr of ans[index]
	lw $t4 , 0($t3) ######## t4 = val of ans[index]
	addi $t4 , $t0 , 1	######ans[index]= i + 1
	sw $t4 , 0($t3)
	li $t2 , 1
	sw $t2 , 0($t1)   ######### vis[i] = 1
	SAVE_LOCAL($t0)
	SAVE_LOCAL($t1)
	SAVE_LOCAL($t2)
	SAVE_LOCAL($t3)
	SAVE_LOCAL($t4)
	addi $a0 , $a0 , 1
	jal FULL
	addi $a0 , $a0 ,-1
	LOAD_LOCAL($t4)
	LOAD_LOCAL($t3)
	LOAD_LOCAL($t2)
	LOAD_LOCAL($t1)
	LOAD_LOCAL($t0)
	li $t2 , 0
	sw $t2 , 0($t1)    ######### vis[i] = 0
	addi $t0 , $t0 , 1 #######i = i+1
	j for_begin 
work_end:			
			
	
print :	
	SAVE_LOCAL($t0)
	SAVE_LOCAL($t1)
	SAVE_LOCAL($t2)
	#SAVE_LOCAL($ra)
	move $t0 , $0
for_i_begin:
	bge $t0 , $s0 , for_i_end
	geta($t1,$t0)
	lw $t2 0($t1)
	numout($t2)
	printSPACE
	addi $t0 , $t0 ,1
	j for_i_begin
for_i_end:
	printENTER
	LOAD_LOCAL($t2)
	LOAD_LOCAL($t1)
	LOAD_LOCAL($t0)
	LOAD_LOCAL($ra)
	LOAD_LOCAL($a0)
	jr $ra	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
