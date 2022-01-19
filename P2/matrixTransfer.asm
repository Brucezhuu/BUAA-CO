#include <stdio.h>
#int main()
#{
#    int n,m;
 #   int a[50][50];
  #  int cnt = 0;
  #  int triple[50][50] = {0} ;
   # scanf("%d%d",&n,&m);
    #for(int i = 1;i<=n;i++){
    #    for(int j = 1 ;j<=m;j++){
     #       scanf("%d",&a[i][j]);
      #      if(a[i][j] != 0){
       #         cnt++;
        #        triple[i][j] = a[i][j];
         #   }
       # }
   # }
   # for(int i = 50;i>=1;i--){
    #    for(int j=50;j>=1;j--){
     #       if(triple[i][j]!= 0 )
    #        printf("%d %d %d\n",i,j,triple[i][j]);
    #    }
   # }
   # return 0;
#}

.data 
array : .space 10000   # 50 * 50 * 4 = = 10000
#triple : .space 10000  # address begin fronm 10000
n     : .word 0x00
m     : .word 0x00
space : .asciiz " "     #占2个字节
enter : .asciiz "\n"    #占2个字节

.text
addiu $s6 ,$0 , 4
.macro inputInt
li    $v0 , 5
syscall
move $t0 , $v0
sw $t0 , n($0)
li    $v0 , 5
syscall
move $t0 , $v0
sw $t0 , m($0)
.end_macro

.macro getAddressofArray(%ans,%i,%j,%m) ###把所得地址存到$s0中
# get the rank of nun  rank = (i-1)*m + j
addi $t1 , %i ,-1
mult $t1 , %m
mflo $t1
add  $t1 , $t1 , %j
#get the address of num address = (rank - 1) *4
addi $t1 , $t1 ,-1
mult $t1 , $s6
mflo %ans
.end_macro

#读入N,M
inputInt 
lw $t3 , n($0)
lw $t4 , m($0)

move $s7, $t4
addi $t5 , $0,0 #i
addi $t6 , $0,0 #j

for_1_begin  :          #数据读入
beq $t5 , $t3 , for_1_end
for_2_begin :
beq $t6 , $t4 ,for_2_end
li $v0 ,5 
syscall
move $s0 , $v0   #s0 store val
addi $t7 , $t5 ,1
addi $t8 ,$t6 ,1
getAddressofArray($s1,$t7,$t8,$t4)
sw $s0 , 0($s1)
addi $t6 , $t6 , 1
j for_2_begin 
for_2_end : 
addi $t5, $t5, 1
addi $t6 ,$0 ,0
j for_1_begin
for_1_end  :

#倒着遍历array 
mult $t3 , $t4
mflo $t5 #从第最后一个元素开始
addi $t6 , $0 ,0

for_3_begin : 
beq $0 , $t5, for_3_end
addi $t6 , $t5 ,-1
mult $t6 , $s6
mflo $t6 #t6存储第t5个数对应的地址
lw $t0 , 0($t6) # to store val
bne $0 , $t0 ,findone
addi $t5 , $t5 ,-1
j for_3_begin
findone :
#getIndex($s2,$s3,$t5) # s2 store line ,s3 store col
jal getIndex
move $a0 , $s2
li $v0 ,1
syscall
la $a0 , space
li $v0 , 4
syscall 
move $a0 , $s3 
li $v0 ,1
syscall 
la $a0 , space
li $v0 , 4
syscall
move $a0 , $t0 
li $v0 ,1
syscall 
la $a0 , enter
li $v0 , 4
syscall
addi $t5 , $t5 ,-1
j for_3_begin
getIndex : 
div $t5 , $s7
mfhi $s3
mflo $s2
beq $s3 ,$0 ,nomod
addiu $s2 ,$s2,1
jr $ra
nomod:
mflo $s2
add $s3 , $0 ,$t4
jr $ra
for_3_end :







