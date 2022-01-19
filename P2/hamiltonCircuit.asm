.data
mp : .space 324    # 9*9*4 = 324
vis : .word 0,1,0,0,0,0,0,0,0
n : .word 0
m : .word 0
flag : .word 0

.text

.macro getIndex(%ans , %i , %j )
#getRank 1st   9x+y+1
addiu %ans , $0 ,9
mult %ans , %i
mflo %ans
add %ans , %ans , %j
addiu %ans , %ans ,1
#get adreass
addi %ans ,%ans ,-1
sll %ans, %ans ,2
.end_macro 

main :
#input int
li $v0 , 5
syscall
sw $v0 , n($0)
li $v0 ,5
syscall 
sw $v0 , m($0)

addiu $t7 , $0,0   #t7用作计数器 i
lw $s0 , m($0) # s0 == m

for_1_begin:
beq $t7 , $s0 ,for_1_end
li $v0 ,5
syscall
move $t0 , $v0
li $v0 ,5
syscall
move $t1, $v0
getIndex($t2 ,$t0 , $t1) #t2 存地址
addiu $t3 , $0,1   #$t3 用于置 1
sw $t3 , 0($t2)
getIndex($t2,$t1,$t0)
sw $t3 , 0($t2)
addi $t7 ,$t7 ,1
j for_1_begin
for_1_end :

li $a0 , 1     #a0 as d 
li $a1 , 1     #a1 as count
lw $s1 ,n($0)   #始终为N 全局变量
lw $s2 ,m($0)    # 始终为m全局变量
li $s0 ,1       #s0 as parmeter :  1 以后都不动它
jal dfs        #########################################################################
beq $v1 , $0 ,print0
print1:
addi $a0 , $0 , 1
li $v0 , 1
syscall
j done
print0 :
move $a0 , $0
li $v0 ,1
syscall
j done

dfs : #####################################################################################
bne $a1 , $s1 , work
getIndex($t0 , $a0 ,$s0)
lw $t1 ,  0($t0)   # $t1 store val 
bne $t1 ,$0 , if_2_begin
jr $ra
if_2_begin :
lw $t2 ,flag($0)
beq $t2 , $0 ,f
jr $ra
f :
move $v1 , $s0
jr $ra

work :
sw $ra , 0($sp)      # 用栈存储 ra、a0,a1
addi $sp, $sp, -4
move $t0 , $a0
move $t1 , $a1
sw $t0 , 0($sp)
addi $sp ,$sp ,-4
sw $t1 ,0($sp)
addi $sp,$sp ,-4
move $t7 ,$s0   # t7 = 1 ,t7 is a counter
addi $s6 , $s1 , 1 
for_2_begin :############################################## for_2 _begin
beq $t7 ,$s6 ,for_2_end     #s6 仅用于判断循环结束，永远保持不变
getIndex($t6,$t0,$t7) #t6 store address
lw $t6 , 0($t6) #t6 store val :mp[d][i]
bne $t6 ,$0 ,if_3_begin
addi $t7 , $t7 ,1
j for_2_begin
if_3_begin :
addi $t4 ,$0,328 #让t4 获得的vis[i]的地址
addi $t5 , $t7 ,-1
sll $t5,$t5,2
add $t5,$t4,$t5 # t5 存地址
lw $t4 , 0($t5)#让t4获得vis[i]的val
bne $t4,$0,back  
move $t4,$s0  #vis[i] = 1
sw $t4 , 0($t5)
#开始递归 ：
move $a0 , $t7
addi $a1 , $t1, 1
sw $t7 , 0($sp)
addi $sp ,$sp ,-4
sw $t6 , 0($sp)
addi $sp ,$sp ,-4
sw $t5 , 0($sp)
addi $sp ,$sp ,-4
sw $t4 , 0($sp)
addi $sp ,$sp ,-4
jal dfs 
addi $sp,$sp ,4
lw $t4,0($sp)
addi $sp,$sp ,4
lw $t5,0($sp)
addi $sp,$sp ,4
lw $t6,0($sp)
addi $sp,$sp ,4
lw $t7,0($sp)
addi $sp,$sp ,4
lw $t1,0($sp)
addi $sp,$sp ,4
lw $t0,0($sp)
sw $t0 ,0($sp)
addi $sp ,$sp ,-4
sw $t1 , 0($sp)
addi $sp ,$sp ,-4
move $t4 ,$0
sw $t4,0($t5) #vis[i] = 0
back :
addi $t7 , $t7 ,1
j for_2_begin
for_2_end :
addi $sp,$sp ,4
lw $t1,0($sp)
addi $sp,$sp ,4
lw $t0,0($sp)
addi $sp,$sp ,4
lw $ra,0($sp)
move $a0 , $t0
move $a1 ,$t1
jr $ra

done :
