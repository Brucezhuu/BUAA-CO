addi	$1,$0,84
sw		$1,0($0)
addi	$1,$0,64
sw		$1,4($0)
addi	$1,$0,100
sw		$1,8($0)
addi	$1,$0,24
sw		$1,12($0)
addi	$1,$0,28
sw		$1,16($0)
addi	$1,$0,36
sw		$1,20($0)
addi	$1,$0,88
sw		$1,24($0)
addi	$1,$0,4
sw		$1,28($0)
addi	$1,$0,192
sw		$1,32($0)
addi	$1,$0,156
sw		$1,36($0)
addi	$1,$0,76
sw		$1,40($0)
addi	$1,$0,144
sw		$1,44($0)
addi	$1,$0,128
sw		$1,48($0)
addi	$1,$0,80
sw		$1,52($0)
addi	$1,$0,16
sw		$1,56($0)
addi	$1,$0,68
sw		$1,60($0)
addi	$1,$0,116
sw		$1,64($0)
addi	$1,$0,60
sw		$1,68($0)
addi	$1,$0,52
sw		$1,72($0)
addi	$1,$0,40
sw		$1,76($0)
addi	$1,$0,72
sw		$1,80($0)
addi	$1,$0,140
sw		$1,84($0)
addi	$1,$0,196
sw		$1,88($0)
addi	$1,$0,56
sw		$1,92($0)
addi	$1,$0,20
sw		$1,96($0)
addi	$1,$0,200
sw		$1,100($0)
addi	$1,$0,152
sw		$1,104($0)
addi	$1,$0,104
sw		$1,108($0)
addi	$1,$0,96
sw		$1,112($0)
addi	$1,$0,136
sw		$1,116($0)
addi	$1,$0,188
sw		$1,120($0)
addi	$1,$0,132
sw		$1,124($0)
addi	$1,$0,184
sw		$1,128($0)
addi	$1,$0,180
sw		$1,132($0)
addi	$1,$0,12
sw		$1,136($0)
addi	$1,$0,160
sw		$1,140($0)
addi	$1,$0,48
sw		$1,144($0)
addi	$1,$0,172
sw		$1,148($0)
addi	$1,$0,8
sw		$1,152($0)
addi	$1,$0,32
sw		$1,156($0)
addi	$1,$0,108
sw		$1,160($0)
addi	$1,$0,148
sw		$1,164($0)
addi	$1,$0,112
sw		$1,168($0)
addi	$1,$0,120
sw		$1,172($0)
addi	$1,$0,92
sw		$1,176($0)
addi	$1,$0,44
sw		$1,180($0)
addi	$1,$0,124
sw		$1,184($0)
addi	$1,$0,176
sw		$1,188($0)
addi	$1,$0,168
sw		$1,192($0)
addi	$1,$0,164
sw		$1,196($0)

addi	$0,$0,252
addi	$1,$0,252
addi	$2,$0,252
addi	$3,$0,252
addi	$4,$0,252
addi	$5,$0,252
addi	$6,$0,252
addi	$7,$0,252
addi	$8,$0,252
addi	$9,$0,252
addi	$10,$0,252
addi	$11,$0,252
addi	$12,$0,252
addi	$13,$0,252
addi	$14,$0,252
addi	$15,$0,252
addi	$16,$0,252
addi	$17,$0,252
addi	$18,$0,252
addi	$19,$0,252
addi	$20,$0,252
addi	$21,$0,252
addi	$22,$0,252
addi	$23,$0,252
addi	$24,$0,252
addi	$25,$0,252
addi	$26,$0,252
addi	$27,$0,252
addi	$28,$0,252
addi	$29,$0,252
addi	$30,$0,252
addi	$31,$0,252

mflo	$0
mfhi	$0
jal		TAG_0
sw		$31,-12552($31)
addi	$1,$1,1
TAG_0:
mflo	$1
mfhi	$2
addi	$1,$0,197
addi	$2,$0,30
la		$7,TAG_1
mflo	$26
mfhi	$26
jalr	$26,$7
lhu		$26,-12748($26)
addi	$1,$1,1
TAG_1:
mflo	$1
mfhi	$2
addi	$1,$0,33
addi	$2,$0,72
la		$7,TAG_2
mflo	$22
mfhi	$22
jalr	$22,$7
lw		$22,-164($21)
addi	$1,$1,1
TAG_2:
mflo	$1
mfhi	$2
addi	$1,$0,21
addi	$2,$0,51
la		$7,TAG_3
mflo	$0
mfhi	$0
jalr	$0,$7
lb		$29,76($0)
addi	$1,$1,1
TAG_3:
mflo	$1
mfhi	$2
addi	$1,$0,26
addi	$2,$0,222
la		$7,TAG_4
mflo	$27
mfhi	$27
jalr	$27,$7
sb		$27,-12708($27)
addi	$1,$1,1
TAG_4:
mflo	$1
mfhi	$2
addi	$1,$0,77
addi	$2,$0,134
la		$7,TAG_5
mflo	$22
mfhi	$22
jalr	$22,$7
sh		$22,-12732($22)
addi	$1,$1,1
TAG_5:
mflo	$1
mfhi	$2
addi	$1,$0,174
addi	$2,$0,53
la		$7,TAG_6
mflo	$3
mfhi	$3
jalr	$3,$7
sw		$0,-12636($3)
addi	$1,$1,1
TAG_6:
mflo	$1
mfhi	$2
addi	$1,$0,50
addi	$2,$0,129
mflo	$2
mfhi	$2
nop
lbu		$2,76($2)
mflo	$1
mfhi	$2
addi	$1,$0,91
addi	$2,$0,36
mflo	$22
mfhi	$22
nop
lh		$27,-12868($27)
mflo	$1
mfhi	$2
addi	$1,$0,41
addi	$2,$0,13
addi	$22,$0,132
mflo	$0
mfhi	$0
nop
lhu		$30,-148($30)
mflo	$1
mfhi	$2
addi	$1,$0,50
addi	$2,$0,124
mflo	$3
mfhi	$3
nop
sb		$3,280($3)
mflo	$1
mfhi	$2
addi	$1,$0,168
addi	$2,$0,160
addi	$3,$0,81
mflo	$22
mfhi	$22
nop
sh		$28,76($28)
mflo	$1
mfhi	$2
addi	$1,$0,233
addi	$2,$0,85
addi	$22,$0,45
mflo	$0
mfhi	$0
nop
sw		$0,60($14)
mflo	$1
mfhi	$2
addi	$1,$0,156
addi	$2,$0,12
mflo	$14
lui		$14,1
sllv	$14,$14,$14
lw		$14,100($14)
mflo	$1
mfhi	$2
addi	$1,$0,159
addi	$2,$0,218
mflo	$23
lui		$23,6
srlv	$9,$23,$9
lb		$9,12($9)
mflo	$1
mfhi	$2
addi	$1,$0,164
addi	$2,$0,2
mflo	$12
lui		$12,5
srav	$0,$12,$0
lbu		$12,84($12)
mflo	$1
mfhi	$2
addi	$1,$0,5
addi	$2,$0,218
mflo	$15
lui		$15,6
slt		$15,$15,$15
sb		$15,404($15)
mflo	$1
mfhi	$2
addi	$1,$0,227
addi	$2,$0,144
addi	$15,$0,221
mfhi	$23
lui		$23,0
sltu	$10,$10,$23
sh		$23,440($10)
mflo	$1
mfhi	$2
addi	$1,$0,16
addi	$2,$0,108
addi	$10,$0,14
addi	$23,$0,182
mflo	$13
lui		$13,7
sub		$0,$13,$13
sw		$0,332($13)
mflo	$1
mfhi	$2
addi	$1,$0,12
addi	$2,$0,205
mfhi	$26
lui		$26,1
slti	$26,$26,-4
lh		$26,128($26)
mflo	$1
mfhi	$2
addi	$1,$0,173
addi	$2,$0,13
mflo	$23
lui		$23,3
sltiu	$21,$21,1
lhu		$21,48($23)
mflo	$1
mfhi	$2
addi	$1,$0,9
addi	$2,$0,185
mfhi	$0
lui		$0,3
xori	$30,$30,35
lw		$30,-127($30)
mflo	$1
mfhi	$2
addi	$1,$0,173
addi	$2,$0,214
mflo	$27
lui		$27,4
addi	$27,$27,26
sb		$27,426($27)
mflo	$1
mfhi	$2
addi	$1,$0,21
addi	$2,$0,221
mfhi	$23
lui		$23,2
addiu	$23,$22,165
sh		$22,178($23)
mflo	$1
mfhi	$2
addi	$1,$0,237
addi	$2,$0,136
mflo	$0
lui		$0,3
andi	$0,$1,72
sw		$1,99($1)
mflo	$1
mfhi	$2
addi	$1,$0,157
addi	$2,$0,154
mfhi	$8
lui		$8,4
sll		$8,$8,2
lb		$8,52($8)
mflo	$1
mfhi	$2
addi	$1,$0,198
addi	$2,$0,191
mflo	$24
lui		$24,0
srl		$24,$24,1
lbu		$3,144($24)
mflo	$1
mfhi	$2
addi	$1,$0,76
addi	$2,$0,118
addi	$24,$0,214
mfhi	$0
lui		$0,4
sra		$0,$0,1
lh		$6,-96($6)
mflo	$1
mfhi	$2
addi	$1,$0,141
addi	$2,$0,46
mflo	$9
lui		$9,2
sll		$9,$9,1
sb		$9,380($9)
mflo	$1
mfhi	$2
addi	$1,$0,181
addi	$2,$0,43
mfhi	$24
lui		$24,6
srl		$4,$24,1
sh		$4,400($24)
mflo	$1
mfhi	$2
addi	$1,$0,91
addi	$2,$0,219
mflo	$0
lui		$0,7
sra		$0,$0,2
sw		$0,408($0)
mflo	$1
mfhi	$2
addi	$1,$0,197
addi	$2,$0,43
mfhi	$17
lui		$17,4
lhu		$17,156($17)
subu	$17,$17,$17
mflo	$1
mfhi	$2
addi	$1,$0,242
addi	$2,$0,190
addi	$17,$0,187
mflo	$24
lui		$24,5
lw		$24,0($12)
xor		$12,$12,$24
mflo	$1
mfhi	$2
addi	$1,$0,112
addi	$2,$0,128
mfhi	$25
lui		$25,1
lb		$25,48($0)
add		$0,$0,$0
mflo	$1
mfhi	$2
addi	$1,$0,230
addi	$2,$0,109
mflo	$18
lui		$18,5
lbu		$18,40($18)
ori		$18,$18,208
mflo	$1
mfhi	$2
addi	$1,$0,42
addi	$2,$0,32
mfhi	$24
lui		$24,6
lh		$13,40($24)
slti	$24,$24,-1
mflo	$1
mfhi	$2
addi	$1,$0,201
addi	$2,$0,133
addi	$24,$0,137
mflo	$7
lui		$7,2
lhu		$0,0($0)
sltiu	$7,$0,-4
mflo	$1
mfhi	$2
addi	$1,$0,249
addi	$2,$0,58
mfhi	$19
lui		$19,7
lw		$19,44($19)
sll		$19,$19,1
mflo	$1
mfhi	$2
addi	$1,$0,78
addi	$2,$0,180
mflo	$24
lui		$24,2
lb		$24,52($24)
srl		$14,$14,1
mflo	$1
mfhi	$2
addi	$1,$0,217
addi	$2,$0,100
mfhi	$18
lui		$18,3
lbu		$18,124($0)
sra		$18,$0,2
mflo	$1
mfhi	$2
addi	$1,$0,15
addi	$2,$0,150
addi	$18,$0,205
mflo	$20
lui		$20,2
lh		$20,28($20)
lhu		$20,64($20)
mflo	$1
mfhi	$2
addi	$1,$0,46
addi	$2,$0,141
mfhi	$24
lui		$24,6
lw		$24,92($24)
lb		$15,-16($24)
mflo	$1
mfhi	$2
addi	$1,$0,105
addi	$2,$0,163
mflo	$0
lui		$0,1
lbu		$23,60($0)
lh		$0,60($23)
mflo	$1
mfhi	$2
addi	$1,$0,42
addi	$2,$0,229
mfhi	$21
lui		$21,7
lhu		$21,116($21)
sb		$21,328($21)
mflo	$1
mfhi	$2
addi	$1,$0,14
addi	$2,$0,156
mflo	$24
lui		$24,6
lw		$16,12($24)
sh		$24,316($16)
mflo	$1
mfhi	$2
addi	$1,$0,229
addi	$2,$0,67
mfhi	$0
lui		$0,0
lb		$0,132($0)
sw		$9,288($0)
mflo	$1
mfhi	$2
addi	$1,$0,205
addi	$2,$0,183
mflo	$22
lui		$22,2
lbu		$22,156($22)
multu	$22,$22
mflo	$1
mfhi	$2
addi	$2,$0,135
mfhi	$24
lui		$24,6
lh		$17,-55($17)
mthi	$17
mflo	$1
mfhi	$2
mflo	$1
lui		$1,0
lhu		$1,96($0)
mtlo	$1
mflo	$1
mfhi	$2
mfhi	$23
lui		$23,1
lw		$23,48($23)
bne		$23,$0,TAG_7
addiu	$23,$0,1
addiu	$0,$23,1
TAG_7:
mflo	$1
mfhi	$2
mflo	$24
lui		$24,5
lb		$18,116($24)
beq		$24,$24,TAG_8
addiu	$24,$24,1
addiu	$24,$24,1
TAG_8:
mflo	$1
mfhi	$2
mfhi	$6
lui		$6,0
lbu		$0,28($0)
bne		$6,$1,TAG_9
addiu	$6,$1,1
addiu	$1,$6,1
TAG_9:
mflo	$1
mfhi	$2
mflo	$24
lui		$24,4
lh		$24,32($24)
bne		$24,$24,TAG_10
addiu	$24,$24,1
addiu	$24,$24,1
TAG_10:
mflo	$1
mfhi	$2
mfhi	$24
lui		$24,7
lhu		$19,140($24)
beq		$24,$0,TAG_11
addiu	$24,$0,1
addiu	$0,$24,1
TAG_11:
mflo	$1
mfhi	$2
mflo	$9
lui		$9,0
lw		$0,60($0)
bne		$0,$0,TAG_12
addiu	$0,$0,1
addiu	$0,$0,1
TAG_12:
mflo	$1
mfhi	$2
addi	$9,$0,178
mfhi	$25
lui		$25,4
lb		$25,140($25)
blez	$25,TAG_13
addiu	$25,$25,1
addiu	$25,$25,1
TAG_13:
mflo	$1
mfhi	$2
mflo	$24
lui		$24,5
lbu		$20,60($24)
bgtz	$24,TAG_14
addiu	$24,$24,1
addiu	$24,$24,1
TAG_14:
mflo	$1
mfhi	$2
mfhi	$0
lui		$0,6
lh		$0,87($7)
bgez	$0,TAG_15
addiu	$0,$0,1
addiu	$0,$0,1
TAG_15:
mflo	$1
mfhi	$2
mflo	$26
lui		$26,4
lhu		$26,152($26)
blez	$26,TAG_16
addiu	$26,$26,1
addiu	$26,$26,1
TAG_16:
mflo	$1
mfhi	$2
mfhi	$24
lui		$24,4
lw		$21,60($24)
bgtz	$24,TAG_17
addiu	$24,$24,1
addiu	$24,$24,1
TAG_17:
mflo	$1
mfhi	$2
mflo	$0
lui		$0,2
lb		$30,104($0)
bgez	$0,TAG_18
addiu	$0,$0,1
addiu	$0,$0,1
TAG_18:
mflo	$1
mfhi	$2
mfhi	$2
lui		$2,6
div		$2,$2
lbu		$2,152($2)
mflo	$1
mfhi	$2
addi	$2,$0,129
mflo	$24
lui		$24,5
divu	$27,$24
lh		$24,102($27)
mflo	$1
mfhi	$2
addi	$1,$0,115
mfhi	$0
lui		$0,5
mult	$23,$23
lhu		$23,7($23)
mflo	$1
mfhi	$2
addi	$2,$0,103
mflo	$3
lui		$3,6
multu	$3,$3
sb		$3,340($3)
mflo	$1
mfhi	$2
addi	$1,$0,131
mfhi	$24
lui		$24,1
mthi	$28
sh		$24,300($24)
mflo	$1
mfhi	$2
addi	$1,$0,216
mflo	$12
lui		$12,1
mtlo	$12
sw		$12,392($0)
mflo	$1
mfhi	$2
mfhi	$14
lui		$14,5
mflo	$14
lw		$14,84($14)
mflo	$1
mfhi	$2
mfhi	$25
lui		$25,7
mflo	$25
lb		$9,-142($9)
mflo	$1
mfhi	$2
mfhi	$15
lui		$15,1
mflo	$15
lbu		$0,32($15)
mflo	$1
mfhi	$2
mfhi	$15
lui		$15,7
mflo	$15
sb		$15,420($15)
mflo	$1
mfhi	$2
mfhi	$25
lui		$25,6
mflo	$25
sh		$25,424($25)
mflo	$1
mfhi	$2
mfhi	$0
lui		$0,2
mflo	$0
sw		$0,424($25)
mflo	$1
mfhi	$2
mfhi	$26
lui		$26,4
lui		$26,1
lh		$26,128($26)
mflo	$1
mfhi	$2
mflo	$25
lui		$25,1
lui		$25,0
lhu		$21,72($21)
mflo	$1
mfhi	$2
addi	$25,$0,46
mfhi	$8
lui		$8,7
lui		$8,4
lw		$8,100($8)
mflo	$1
mfhi	$2
mflo	$27
lui		$27,0
lui		$27,2
sb		$27,280($27)
mflo	$1
mfhi	$2
mfhi	$25
lui		$25,4
lui		$25,0
sh		$22,256($22)
mflo	$1
mfhi	$2
addi	$25,$0,213
mflo	$28
lui		$28,6
lui		$28,1
sw		$0,452($0)
mflo	$1
mfhi	$2
mfhi	$31
lui		$31,7
jal		TAG_19
lb		$31,-15208($31)
addi	$1,$1,1
TAG_19:
mflo	$1
mfhi	$2
mflo	$18
lui		$18,0
jal		TAG_20
lbu		$31,-15288($31)
addi	$1,$1,1
TAG_20:
mflo	$1
mfhi	$2
addi	$18,$0,143
mfhi	$31
lui		$31,1
jal		TAG_21
lh		$31,140($0)
addi	$1,$1,1
TAG_21:
mflo	$1
mfhi	$2
mflo	$31
lui		$31,2
jal		TAG_22
sb		$31,-14980($31)
addi	$1,$1,1
TAG_22:
mflo	$1
mfhi	$2
mfhi	$31
lui		$31,3
jal		TAG_23
sh		$31,-15092($31)
addi	$1,$1,1
TAG_23:
mflo	$1
mfhi	$2
mflo	$0
lui		$0,3
jal		TAG_24
sw		$31,-15112($31)
addi	$1,$1,1
TAG_24:
mflo	$1
mfhi	$2
la		$7,TAG_25
mfhi	$8
lui		$8,6
jalr	$8,$7
lhu		$8,-15456($8)
addi	$1,$1,1
TAG_25:
mflo	$1
mfhi	$2
la		$7,TAG_26
mflo	$26
lui		$26,1
jalr	$26,$7
lw		$3,-15376($26)
addi	$1,$1,1
TAG_26:
mflo	$1
mfhi	$2
la		$7,TAG_27
mfhi	$0
lui		$0,2
jalr	$0,$7
lb		$0,144($0)
addi	$1,$1,1
TAG_27:
mflo	$1
mfhi	$2
la		$7,TAG_28
mflo	$9
lui		$9,5
jalr	$9,$7
sb		$9,-15212($9)
addi	$1,$1,1
TAG_28:
mflo	$1
mfhi	$2
la		$7,TAG_29
mfhi	$26
lui		$26,7
jalr	$26,$7
sh		$4,-15180($26)
addi	$1,$1,1
TAG_29:
mflo	$1
mfhi	$2
la		$7,TAG_30
mflo	$0
lui		$0,1
jalr	$0,$7
sw		$15,336($0)
addi	$1,$1,1
TAG_30:
mflo	$1
mfhi	$2
mfhi	$14
lui		$14,6
nop
lbu		$14,48($14)
mflo	$1
mfhi	$2
mflo	$26
lui		$26,5
nop
lh		$9,-15480($9)
mflo	$1
mfhi	$2
mfhi	$0
lui		$0,1
nop
lhu		$13,-40($13)
mflo	$1
mfhi	$2
mflo	$15
lui		$15,3
nop
sb		$15,404($15)
mflo	$1
mfhi	$2
mfhi	$26
lui		$26,5
nop
sh		$26,394($10)
mflo	$1
mfhi	$2
mflo	$0
lui		$0,0
nop
sw		$0,-15824($30)
mflo	$1
mfhi	$2
mfhi	$31
jal		TAG_31
addu	$31,$31,$31
addi	$1,$1,1
TAG_31:
lw		$31,-15192($31)
mflo	$1
mfhi	$2
mflo	$21
jal		TAG_32
and		$21,$21,$21
addi	$1,$1,1
TAG_32:
lb		$21,-15848($31)
mflo	$1
mfhi	$2
mfhi	$0
jal		TAG_33
nor		$0,$31,$31
addi	$1,$1,1
TAG_33:
lbu		$0,68($0)
mflo	$1
mfhi	$2
#end