#    if ( n % 100 == 0 ){
#	if(n%400 == 0)
#		printf("1");
#	else 
#		printf("0");
#    }
#    else{
#	if(n%4 == 0)
#		printf(1)��
#	else printf(0);
#}
.text
.macro finish #��������
li $v0 , 10
syscall
.end_macro 
		
.macro input    #�����������뵽$v0
li $v0 , 5
syscall 
.end_macro

input  #����n
move $s0 , $v0 # use $s1 to store n
addi $t0 , $0 , 100
addi $t1 , $0 , 400
addi $t2 , $0 , 4
div $s0 , $t0 
mfhi $s1 #use $s0 to store mod
bne $s1 , $0 ,else_1 
div $s0 , $t1 #��100�ı���
mfhi $s1
beq $s1 , $0, leapyear
j notleapyear

else_1 : # ����100�ı���
div $s0 , $t2
mfhi $s1
beq $s1 ,$0 , leapyear
j notleapyear


leapyear:
addi $a0 , $0 ,1
li      $v0, 1
syscall
j done

notleapyear:
addi $a0 , $0 ,0
li      $v0, 1
syscall
j done

done: 
finish