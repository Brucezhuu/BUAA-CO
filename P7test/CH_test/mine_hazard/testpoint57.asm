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

lh		$10,-188($3)
nop
nop
beq		$3,$10,TAG_0
addiu	$3,$10,1
addiu	$10,$3,1
TAG_0:
lhu		$22,20($0)
nop
nop
bne		$0,$0,TAG_1
addiu	$0,$0,1
addiu	$0,$0,1
TAG_1:
lw		$13,-136($13)
nop
nop
bgtz	$13,TAG_2
addiu	$13,$13,1
addiu	$13,$13,1
TAG_2:
lb		$11,-128($11)
nop
nop
bgez	$3,TAG_3
addiu	$3,$3,1
addiu	$3,$3,1
TAG_3:
lbu		$12,-188($12)
nop
nop
bltz	$3,TAG_4
addiu	$3,$3,1
addiu	$3,$3,1
TAG_4:
lh		$14,-124($14)
nop
nop
blez	$14,TAG_5
addiu	$14,$14,1
addiu	$14,$14,1
TAG_5:
lhu		$14,-34($14)
nop
nop
bgtz	$14,TAG_6
addiu	$14,$14,1
addiu	$14,$14,1
TAG_6:
lw		$3,-45($13)
nop
nop
bgez	$3,TAG_7
addiu	$3,$3,1
addiu	$3,$3,1
TAG_7:
lb		$14,15($14)
nop
nop
bltz	$3,TAG_8
addiu	$3,$3,1
addiu	$3,$3,1
TAG_8:
lbu		$16,-216($16)
nop
nop
blez	$16,TAG_9
addiu	$16,$16,1
addiu	$16,$16,1
TAG_9:
mthi	$20
sllv	$20,$20,$20
srlv	$20,$20,$20
lh		$20,14823($20)
mflo	$1
mfhi	$2
addi	$1,$0,84
mfc0	$1,$12
addi	$1,$0,56
mfc0	$1,$13
addi	$1,$0,36
mfc0	$1,$14
mtlo	$25
srav	$3,$3,$3
slt		$25,$25,$3
lhu		$3,44($25)
mflo	$1
mfhi	$2
addi	$25,$0,177
mtc0	$26,$13
sltu	$3,$3,$3
sub		$26,$3,$3
lw		$3,32($3)
mflo	$1
mfhi	$2
addi	$26,$0,39
div		$27,$7
subu	$0,$0,$0
xor		$27,$0,$0
lb		$0,116($0)
mflo	$1
mfhi	$2
addi	$2,$0,172
addi	$27,$0,221
divu	$21,$21
add		$21,$21,$21
addu	$21,$21,$21
sb		$21,-728($21)
mflo	$1
mfhi	$2
addi	$2,$0,8
mult	$27,$27
and		$3,$3,$27
nor		$27,$3,$27
sh		$27,642($27)
mflo	$1
mfhi	$2
addi	$2,$0,211
multu	$28,$3
or		$3,$3,$3
sllv	$28,$28,$3
sw		$28,156($3)
mflo	$1
mfhi	$2
addi	$2,$0,160
mthi	$0
srlv	$14,$0,$14
srav	$0,$14,$0
sb		$14,348($14)
mflo	$1
mfhi	$2
addi	$2,$0,7
addi	$14,$0,69
mtlo	$2
slt		$2,$2,$2
slti	$2,$2,2
lbu		$2,83($2)
mflo	$1
mfhi	$2
addi	$2,$0,178
mtc0	$19,$13
sltu	$4,$19,$4
sltiu	$19,$4,0
lh		$4,132($4)
mflo	$1
mfhi	$2
addi	$2,$0,53
addi	$19,$0,44
div		$4,$20
sub		$20,$20,$4
xori	$20,$20,115
lhu		$20,15963($20)
mflo	$1
mfhi	$2
addi	$1,$0,60
mfc0	$1,$12
addi	$1,$0,236
mfc0	$1,$13
addi	$1,$0,40
mfc0	$1,$14
divu	$5,$5
subu	$0,$0,$0
addi	$0,$0,137
lw		$5,-196($5)
mflo	$1
mfhi	$2
addi	$2,$0,147
mult	$3,$3
xor		$3,$3,$3
addiu	$3,$3,34
sh		$3,326($3)
mflo	$1
mfhi	$2
addi	$2,$0,33
multu	$4,$21
add		$21,$4,$21
andi	$21,$21,27
sw		$21,104($4)
mflo	$1
mfhi	$2
addi	$2,$0,98
addi	$21,$0,54
mthi	$4
addu	$22,$4,$4
ori		$22,$4,12
sb		$4,264($22)
mflo	$1
mfhi	$2
mtlo	$0
and		$14,$0,$14
slti	$14,$0,0
sh		$14,320($0)
mflo	$1
mfhi	$2
addi	$1,$0,140
addi	$14,$0,64
mtc0	$14,$13
nor		$14,$14,$14
sra		$14,$14,2
lb		$14,113($14)
mflo	$1
mfhi	$2
addi	$1,$0,232
div		$13,$5
or		$5,$5,$13
sll		$13,$13,2
lbu		$13,-113($5)
mflo	$1
mfhi	$2
divu	$14,$14
sllv	$5,$14,$5
srl		$14,$14,1
lh		$5,7803($5)
mflo	$1
mfhi	$2
addi	$1,$0,240
mfc0	$1,$12
addi	$1,$0,192
mfc0	$1,$13
addi	$1,$0,124
mfc0	$1,$14
addi	$2,$0,34
mult	$0,$1
srlv	$1,$0,$0
sra		$1,$1,1
lhu		$1,104($1)
mflo	$1
mfhi	$2
addi	$1,$0,229
addi	$2,$0,204
multu	$15,$15
srav	$15,$15,$15
sll		$15,$15,1
sw		$15,472($15)
mflo	$1
mfhi	$2
addi	$2,$0,78
addi	$15,$0,218
mthi	$15
slt		$5,$15,$5
srl		$15,$5,1
sb		$5,280($15)
mflo	$1
mfhi	$2
addi	$15,$0,250
mtlo	$16
sltu	$5,$5,$16
sra		$16,$5,1
sh		$5,408($16)
mflo	$1
mfhi	$2
addi	$16,$0,93
mtc0	$0,$12
sub		$6,$0,$6
sll		$6,$0,1
sw		$6,288($0)
mflo	$1
mfhi	$2
addi	$6,$0,52
div		$23,$23
subu	$23,$23,$23
lw		$23,64($23)
xor		$23,$23,$23
mflo	$1
mfhi	$2
addi	$2,$0,3
addi	$23,$0,66
divu	$6,$1
add		$1,$1,$6
lb		$6,28($6)
addu	$1,$6,$6
mflo	$1
mfhi	$2
addi	$2,$0,214
mult	$2,$6
and		$6,$6,$2
lbu		$6,-98($2)
nor		$2,$6,$2
mflo	$1
mfhi	$2
addi	$2,$0,204
multu	$22,$0
or		$0,$22,$22
lh		$22,148($0)
sllv	$0,$22,$22
mflo	$1
mfhi	$2
addi	$1,$0,51
addi	$2,$0,166
mthi	$24
srlv	$24,$24,$24
lhu		$24,132($24)
sltiu	$24,$24,0
mflo	$1
mfhi	$2
addi	$1,$0,189
addi	$24,$0,93
mtlo	$6
srav	$3,$6,$3
lw		$3,2($3)
xori	$6,$6,220
mflo	$1
mfhi	$2
mtc0	$6,$13
slt		$4,$6,$4
lb		$6,-60($6)
addi	$4,$6,191
mflo	$1
mfhi	$2
div		$1,$22
sltu	$0,$0,$1
lbu		$0,88($0)
addiu	$0,$1,23
mflo	$1
mfhi	$2
addi	$1,$0,57
divu	$25,$25
sub		$25,$25,$25
lh		$25,100($25)
srl		$25,$25,2
mflo	$1
mfhi	$2
addi	$2,$0,72
mult	$6,$5
subu	$5,$5,$5
lhu		$5,112($5)
sra		$5,$5,2
mflo	$1
mfhi	$2
addi	$2,$0,204
multu	$6,$6
xor		$6,$6,$6
lw		$6,76($6)
sll		$6,$6,2
mflo	$1
mfhi	$2
addi	$2,$0,87
mthi	$0
add		$13,$13,$0
lb		$13,64($13)
srl		$13,$0,2
mflo	$1
mfhi	$2
addi	$2,$0,148
addi	$13,$0,151
mtlo	$26
addu	$26,$26,$26
lbu		$26,18($26)
lh		$26,16($26)
mflo	$1
mfhi	$2
addi	$2,$0,7
mtc0	$7,$13
and		$6,$6,$7
lhu		$7,-216($7)
lw		$6,-40($6)
mflo	$1
mfhi	$2
addi	$2,$0,35
div		$6,$8
nor		$8,$8,$6
lb		$8,-100($6)
lbu		$8,176($8)
mflo	$1
mfhi	$2
addi	$1,$0,139
divu	$11,$4
or		$0,$11,$11
lh		$11,112($0)
lhu		$0,-72($11)
mflo	$1
mfhi	$2
mult	$27,$27
sllv	$27,$27,$27
lw		$27,992($27)
sb		$27,180($27)
mflo	$1
mfhi	$2
addi	$2,$0,178
multu	$6,$9
srlv	$9,$9,$6
lb		$9,36($9)
sh		$9,260($6)
mflo	$1
mfhi	$2
addi	$2,$0,245
mthi	$10
srav	$6,$10,$10
lbu		$10,108($6)
sw		$10,308($10)
mflo	$1
mfhi	$2
addi	$6,$0,243
mtlo	$0
slt		$10,$10,$10
lh		$10,4($0)
sb		$0,244($10)
mflo	$1
mfhi	$2
addi	$1,$0,102
mtc0	$28,$13
sltu	$28,$28,$28
lhu		$28,120($28)
div		$28,$28
mflo	$1
mfhi	$2
addi	$2,$0,140
divu	$6,$11
sub		$11,$11,$11
lw		$11,-159($6)
mult	$11,$11
mflo	$1
mfhi	$2
addi	$2,$0,74
multu	$6,$6
subu	$12,$6,$12
lb		$6,-55($12)
mthi	$6
mflo	$1
mfhi	$2
mtlo	$17
xor		$0,$17,$17
lbu		$0,-144($17)
mtc0	$0,$12
mflo	$1
mfhi	$2
div		$29,$29
add		$29,$29,$29
lh		$29,-504($29)
beq		$29,$29,TAG_10
addiu	$29,$29,1
addiu	$29,$29,1
TAG_10:
mflo	$1
mfhi	$2
addi	$2,$0,250
divu	$13,$13
addu	$6,$13,$6
lhu		$6,-95($13)
bne		$6,$13,TAG_11
addiu	$6,$13,1
addiu	$13,$6,1
TAG_11:
mflo	$1
mfhi	$2
addi	$2,$0,202
mult	$6,$6
and		$14,$6,$14
lw		$6,0($6)
beq		$6,$6,TAG_12
addiu	$6,$6,1
addiu	$6,$6,1
TAG_12:
mflo	$1
mfhi	$2
addi	$2,$0,167
multu	$1,$0
nor		$0,$1,$0
lb		$1,-22952($1)
bne		$1,$0,TAG_13
addiu	$1,$0,1
addiu	$0,$1,1
TAG_13:
mflo	$1
mfhi	$2
addi	$1,$0,55
addi	$2,$0,213
mthi	$30
or		$30,$30,$30
lbu		$30,-172($30)
beq		$30,$0,TAG_14
addiu	$30,$0,1
addiu	$0,$30,1
TAG_14:
mflo	$1
mfhi	$2
addi	$1,$0,119
mtlo	$15
sllv	$6,$6,$15
lh		$15,-126($15)
bne		$15,$15,TAG_15
addiu	$15,$15,1
addiu	$15,$15,1
TAG_15:
mflo	$1
mfhi	$2
mtc0	$16,$12
srlv	$6,$16,$6
lhu		$6,43($6)
beq		$16,$6,TAG_16
addiu	$16,$6,1
addiu	$6,$16,1
TAG_16:
mflo	$1
mfhi	$2
div		$22,$22
srav	$0,$22,$22
lw		$22,-164($22)
bne		$22,$22,TAG_17
addiu	$22,$22,1
addiu	$22,$22,1
TAG_17:
mflo	$1
mfhi	$2
addi	$2,$0,155
divu	$1,$1
slt		$1,$1,$1
lb		$1,40($1)
bgtz	$1,TAG_18
addiu	$1,$1,1
addiu	$1,$1,1
TAG_18:
mflo	$1
mfhi	$2
addi	$2,$0,125
mult	$6,$6
sltu	$17,$17,$6
lbu		$6,44($17)
bgez	$6,TAG_19
addiu	$6,$6,1
addiu	$6,$6,1
TAG_19:
mflo	$1
mfhi	$2
addi	$2,$0,37
addi	$17,$0,156
multu	$18,$6
sub		$6,$18,$18
lh		$6,112($6)
bltz	$6,TAG_20
addiu	$6,$6,1
addiu	$6,$6,1
TAG_20:
mflo	$1
mfhi	$2
addi	$2,$0,53
mthi	$0
subu	$25,$0,$0
lhu		$0,92($25)
blez	$25,TAG_21
addiu	$25,$25,1
addiu	$25,$25,1
TAG_21:
mflo	$1
mfhi	$2
addi	$2,$0,206
mtlo	$2
xor		$2,$2,$2
lw		$2,124($2)
bgtz	$2,TAG_22
addiu	$2,$2,1
addiu	$2,$2,1
TAG_22:
mflo	$1
mfhi	$2
addi	$2,$0,48
mtc0	$19,$12
add		$6,$19,$6
lb		$19,36($19)
bgez	$6,TAG_23
addiu	$6,$6,1
addiu	$6,$6,1
TAG_23:
mflo	$1
mfhi	$2
addi	$2,$0,43
div		$20,$6
addu	$6,$6,$6
lbu		$20,-166($6)
bltz	$6,TAG_24
addiu	$6,$6,1
addiu	$6,$6,1
TAG_24:
mflo	$1
mfhi	$2
divu	$0,$12
and		$12,$12,$12
lh		$0,-47($12)
blez	$12,TAG_25
addiu	$12,$12,1
addiu	$12,$12,1
TAG_25:
mflo	$1
mfhi	$2
addi	$1,$0,177
addi	$2,$0,140
mult	$8,$8
nor		$8,$8,$8
multu	$8,$8
lhu		$8,149($8)
mflo	$1
mfhi	$2
mthi	$7
or		$1,$1,$7
mtlo	$1
lw		$1,-18789($1)
mflo	$1
mfhi	$2
mtc0	$2,$13
sllv	$7,$7,$7
div		$7,$2
lb		$2,8417($7)
mflo	$1
mfhi	$2
addi	$1,$0,120
mfc0	$1,$12
addi	$1,$0,36
mfc0	$1,$13
addi	$1,$0,64
mfc0	$1,$14
divu	$0,$27
srlv	$19,$19,$19
mult	$0,$19
lbu		$19,4($19)
mflo	$1
mfhi	$2
addi	$1,$0,44
addi	$2,$0,52
multu	$9,$9
srav	$9,$9,$9
mthi	$9
sh		$9,385($9)
mflo	$1
mfhi	$2
mtlo	$3
slt		$7,$3,$3
mtc0	$7,$12
sw		$3,160($3)
mflo	$1
mfhi	$2
addi	$7,$0,52
div		$4,$7
sltu	$7,$4,$7
divu	$7,$19
sb		$7,280($7)
mflo	$1
mfhi	$2
addi	$1,$0,33
addi	$2,$0,50
addi	$7,$0,61
mult	$0,$0
sub		$14,$0,$0
multu	$14,$0
sh		$14,320($14)
mflo	$1
mfhi	$2
addi	$1,$0,195
addi	$2,$0,31
addi	$14,$0,233
mthi	$20
subu	$20,$20,$20
mfc0	$20,$12
lh		$20,56($20)
mflo	$1
mfhi	$2
addi	$1,$0,103
mtlo	$25
xor		$7,$7,$7
mfhi	$7
lhu		$25,123($25)
mflo	$1
mfhi	$2
mtc0	$7,$13
add		$26,$7,$26
mflo	$7
lw		$26,-192($26)
mflo	$1
mfhi	$2
div		$22,$22
addu	$0,$0,$0
mfc0	$22,$12
lb		$0,128($22)
mflo	$1
mfhi	$2
addi	$2,$0,62
addi	$22,$0,23
divu	$21,$21
and		$21,$21,$21
mfhi	$21
sw		$21,440($21)
mflo	$1
mfhi	$2
addi	$2,$0,186
addi	$21,$0,202
mult	$7,$27
nor		$27,$27,$7
mflo	$7
sb		$27,184($7)
mflo	$1
mfhi	$2
addi	$2,$0,85
multu	$7,$28
or		$28,$7,$28
mfc0	$7,$12
sh		$7,152($28)
mflo	$1
mfhi	$2
addi	$2,$0,87
addi	$7,$0,6
mthi	$1
sllv	$0,$1,$0
mfhi	$1
sw		$0,-28168($1)
mflo	$1
mfhi	$2
mtlo	$2
srlv	$2,$2,$2
lui		$2,6
lbu		$2,14754($2)
mflo	$1
mfhi	$2
addi	$1,$0,96
mfc0	$1,$12
addi	$1,$0,88
mfc0	$1,$13
addi	$1,$0,184
mfc0	$1,$14
mtc0	$19,$12
srav	$8,$8,$19
lui		$8,4
lh		$19,-36($19)
mflo	$1
mfhi	$2
div		$8,$20
slt		$20,$20,$20
lui		$8,3
lhu		$8,28($20)
mflo	$1
mfhi	$2
addi	$2,$0,246
addi	$20,$0,44
divu	$8,$8
sltu	$0,$0,$0
lui		$0,3
lw		$0,112($0)
mflo	$1
mfhi	$2
addi	$2,$0,216
mult	$3,$3
sub		$3,$3,$3
lui		$3,0
sb		$3,284($3)
mflo	$1
mfhi	$2
addi	$2,$0,138
addi	$3,$0,104
multu	$8,$21
subu	$21,$8,$21
lui		$8,2
sh		$21,10672($8)
mflo	$1
mfhi	$2
addi	$1,$0,192
mfc0	$1,$12
addi	$1,$0,28
mfc0	$1,$13
addi	$1,$0,172
mfc0	$1,$14
addi	$2,$0,52
mthi	$22
xor		$8,$8,$8
lui		$8,3
sw		$22,325($22)
mflo	$1
mfhi	$2
mtlo	$21
add		$0,$21,$21
lui		$0,4
sb		$21,328($0)
mflo	$1
mfhi	$2
mtc0	$31,$12
addu	$31,$31,$31
jal		TAG_26
lb		$31,-15772($31)
addi	$1,$1,1
TAG_26:
mflo	$1
mfhi	$2
div		$31,$31
and		$9,$9,$31
jal		TAG_27
lbu		$9,12($9)
addi	$1,$1,1
TAG_27:
mflo	$1
mfhi	$2
addi	$2,$0,5
divu	$31,$31
nor		$10,$31,$31
jal		TAG_28
lh		$10,-15872($31)
addi	$1,$1,1
TAG_28:
mflo	$1
mfhi	$2
.ktext 0x4180

_entry10:
	sw		$k0,0x2ffc($0)
	mfc0	$k0,$12
	mfc0	$k0,$13
	mfc0	$k0,$14
	addiu	$k0,$k0,4
	mtc0	$k0,$14
	lw		$k0,0x2ffc($0)
	eret
	mfc0	$k0,$14
	mfc0	$k0,$14
	mfc0	$k0,$14
#end