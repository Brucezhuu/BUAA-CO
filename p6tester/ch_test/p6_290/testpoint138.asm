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

mult	$0,$22
srav	$22,$22,$22
mfhi	$22
lbu		$0,80($22)
mflo	$1
mfhi	$2
addi	$1,$0,247
addi	$2,$0,111
addi	$22,$0,126
multu	$21,$21
slt		$21,$21,$21
mflo	$21
sb		$21,-13948($21)
mflo	$1
mfhi	$2
addi	$2,$0,98
mthi	$4
sltu	$16,$4,$16
mfhi	$4
sh		$16,284($16)
mflo	$1
mfhi	$2
addi	$16,$0,238
mtlo	$0
sub		$1,$0,$1
mflo	$1
sw		$0,320($0)
mflo	$1
mfhi	$2
addi	$1,$0,164
div		$2,$2
subu	$2,$2,$2
lui		$2,4
lh		$2,156($2)
mflo	$1
mfhi	$2
addi	$2,$0,23
divu	$4,$4
xor		$27,$4,$27
lui		$4,1
lhu		$4,128($27)
mflo	$1
mfhi	$2
addi	$2,$0,123
addi	$27,$0,40
mult	$0,$8
add		$8,$8,$8
lui		$0,3
lw		$8,-464($8)
mflo	$1
mfhi	$2
addi	$1,$0,247
addi	$2,$0,178
multu	$3,$3
addu	$3,$3,$3
lui		$3,7
sb		$3,296($3)
mflo	$1
mfhi	$2
addi	$2,$0,95
mthi	$28
and		$4,$4,$28
lui		$4,2
sh		$4,88($28)
mflo	$1
mfhi	$2
mtlo	$0
nor		$21,$0,$21
lui		$0,1
sw		$0,-1671($21)
mflo	$1
mfhi	$2
addi	$1,$0,223
div		$31,$31
or		$31,$31,$31
jal		TAG_0
lb		$31,-13108($31)
addi	$1,$1,1
TAG_0:
mflo	$1
mfhi	$2
addi	$2,$0,56
divu	$19,$19
sllv	$31,$19,$31
jal		TAG_1
lbu		$19,-120($19)
addi	$1,$1,1
TAG_1:
mflo	$1
mfhi	$2
addi	$2,$0,165
mult	$31,$31
srlv	$0,$0,$0
jal		TAG_2
lh		$31,144($0)
addi	$1,$1,1
TAG_2:
mflo	$1
mfhi	$2
addi	$2,$0,82
multu	$31,$31
srav	$31,$31,$31
jal		TAG_3
sb		$31,-12744($31)
addi	$1,$1,1
TAG_3:
mflo	$1
mfhi	$2
addi	$2,$0,75
mthi	$31
slt		$20,$31,$20
jal		TAG_4
sh		$20,-12936($31)
addi	$1,$1,1
TAG_4:
mflo	$1
mfhi	$2
addi	$20,$0,122
mtlo	$31
sltu	$0,$0,$31
jal		TAG_5
sw		$31,-12820($31)
addi	$1,$1,1
TAG_5:
mflo	$1
mfhi	$2
la		$21,TAG_6
div		$14,$14
sub		$14,$14,$14
jalr	$14,$21
lhu		$14,-13216($14)
addi	$1,$1,1
TAG_6:
mflo	$1
mfhi	$2
addi	$2,$0,238
la		$21,TAG_7
divu	$5,$5
subu	$9,$9,$5
jalr	$5,$21
lw		$9,-13352($5)
addi	$1,$1,1
TAG_7:
mflo	$1
mfhi	$2
addi	$2,$0,106
la		$21,TAG_8
mult	$4,$0
xor		$0,$0,$0
jalr	$4,$21
lb		$0,-13324($4)
addi	$1,$1,1
TAG_8:
mflo	$1
mfhi	$2
addi	$1,$0,250
addi	$2,$0,119
la		$21,TAG_9
multu	$15,$15
add		$15,$15,$15
jalr	$15,$21
sb		$15,-13128($15)
addi	$1,$1,1
TAG_9:
mflo	$1
mfhi	$2
addi	$2,$0,117
la		$21,TAG_10
mthi	$5
addu	$10,$10,$10
jalr	$5,$21
sh		$5,-13004($5)
addi	$1,$1,1
TAG_10:
mflo	$1
mfhi	$2
la		$21,TAG_11
mtlo	$0
and		$15,$15,$0
jalr	$0,$21
sw		$15,404($15)
addi	$1,$1,1
TAG_11:
mflo	$1
mfhi	$2
addi	$1,$0,126
addi	$15,$0,20
div		$20,$20
nor		$20,$20,$20
nop
lbu		$20,-16217($20)
mflo	$1
mfhi	$2
addi	$2,$0,16
divu	$5,$15
or		$15,$15,$5
nop
lh		$5,-13344($5)
mflo	$1
mfhi	$2
mult	$0,$7
sllv	$7,$7,$7
nop
lhu		$7,40($7)
mflo	$1
mfhi	$2
addi	$1,$0,135
addi	$2,$0,101
multu	$21,$21
srlv	$21,$21,$21
nop
sb		$21,308($21)
mflo	$1
mfhi	$2
addi	$2,$0,2
addi	$21,$0,127
mthi	$16
srav	$5,$16,$5
nop
sh		$5,202($16)
mflo	$1
mfhi	$2
addi	$5,$0,179
mtlo	$7
slt		$0,$7,$7
nop
sw		$7,284($7)
mflo	$1
mfhi	$2
div		$2,$2
sltiu	$2,$2,2
sltu	$2,$2,$2
lw		$2,152($2)
mflo	$1
mfhi	$2
addi	$2,$0,194
divu	$27,$27
xori	$27,$5,138
sub		$5,$27,$27
lb		$5,47($27)
mflo	$1
mfhi	$2
addi	$2,$0,2
mult	$25,$0
addi	$0,$25,-51
subu	$25,$0,$0
lbu		$0,88($0)
mflo	$1
mfhi	$2
addi	$1,$0,156
addi	$2,$0,28
addi	$25,$0,138
multu	$3,$3
addiu	$3,$3,-149
xor		$3,$3,$3
sb		$3,288($3)
mflo	$1
mfhi	$2
addi	$1,$0,113
addi	$3,$0,151
mthi	$28
andi	$5,$5,151
add		$28,$28,$28
sh		$28,236($5)
mflo	$1
mfhi	$2
addi	$1,$0,32
mtlo	$0
ori		$10,$10,107
addu	$0,$10,$10
sw		$10,356($0)
mflo	$1
mfhi	$2
addi	$1,$0,46
div		$14,$14
slti	$14,$14,0
sltiu	$14,$14,0
lh		$14,48($14)
mflo	$1
mfhi	$2
addi	$2,$0,113
divu	$6,$9
xori	$6,$6,30
addi	$6,$6,-78
lhu		$9,-20($6)
mflo	$1
mfhi	$2
addi	$2,$0,47
mult	$0,$0
addiu	$7,$0,-76
andi	$0,$0,148
lw		$7,-16232($7)
mflo	$1
mfhi	$2
addi	$1,$0,238
addi	$2,$0,21
multu	$15,$15
ori		$15,$15,55
slti	$15,$15,1
sb		$15,392($15)
mflo	$1
mfhi	$2
addi	$2,$0,32
addi	$15,$0,101
mthi	$6
sltiu	$10,$10,0
xori	$10,$6,220
sh		$6,340($10)
mflo	$1
mfhi	$2
mtlo	$0
addi	$30,$0,-26
addiu	$0,$30,75
sw		$30,-16038($30)
mflo	$1
mfhi	$2
addi	$1,$0,136
div		$26,$26
andi	$26,$26,140
sll		$26,$26,2
lb		$26,-528($26)
mflo	$1
mfhi	$2
addi	$2,$0,55
divu	$6,$6
ori		$6,$21,236
srl		$21,$6,2
lbu		$6,-163($6)
mflo	$1
mfhi	$2
addi	$2,$0,213
mult	$27,$27
slti	$0,$0,-2
sra		$27,$0,1
lh		$27,120($27)
mflo	$1
mfhi	$2
addi	$2,$0,222
multu	$27,$27
sltiu	$27,$27,-1
sll		$27,$27,2
sb		$27,416($27)
mflo	$1
mfhi	$2
addi	$2,$0,225
mthi	$22
xori	$22,$22,64
srl		$6,$22,1
sh		$22,345($6)
mflo	$1
mfhi	$2
mtlo	$24
addi	$24,$0,-246
sra		$24,$24,2
sw		$24,-15958($24)
mflo	$1
mfhi	$2
div		$5,$5
addiu	$5,$5,103
lhu		$5,-219($5)
and		$5,$5,$5
mflo	$1
mfhi	$2
addi	$2,$0,207
divu	$6,$6
andi	$6,$30,176
lw		$30,-16202($30)
nor		$6,$30,$6
mflo	$1
mfhi	$2
addi	$2,$0,195
mult	$0,$0
ori		$23,$23,249
lb		$23,-137($23)
or		$0,$23,$23
mflo	$1
mfhi	$2
addi	$1,$0,10
addi	$2,$0,199
multu	$6,$6
slti	$6,$6,2
lbu		$6,43($6)
sltiu	$6,$6,-7
mflo	$1
mfhi	$2
mthi	$7
xori	$7,$7,137
lh		$1,-9381($1)
addi	$7,$1,-210
mflo	$1
mfhi	$2
mtlo	$0
addiu	$0,$0,-4
lhu		$7,72($0)
andi	$7,$0,186
mflo	$1
mfhi	$2
addi	$1,$0,85
addi	$7,$0,179
div		$7,$7
ori		$7,$7,120
lw		$7,-163($7)
sll		$7,$7,1
mflo	$1
mfhi	$2
addi	$2,$0,231
divu	$7,$2
slti	$7,$7,-7
lb		$7,-223($2)
srl		$7,$7,1
mflo	$1
mfhi	$2
mult	$29,$29
sltiu	$0,$0,-5
lbu		$29,0($0)
sra		$29,$29,2
mflo	$1
mfhi	$2
addi	$2,$0,224
multu	$8,$8
xori	$8,$8,132
lh		$8,-100($8)
lhu		$8,-44($8)
mflo	$1
mfhi	$2
addi	$2,$0,245
mthi	$7
addi	$3,$7,55
lw		$3,-81($3)
lb		$3,-8($3)
mflo	$1
mfhi	$2
mtlo	$26
addiu	$26,$26,238
lbu		$0,148($0)
lh		$0,60($0)
mflo	$1
mfhi	$2
div		$9,$9
andi	$9,$9,201
lhu		$9,-112($9)
sb		$9,296($9)
mflo	$1
mfhi	$2
addi	$2,$0,80
divu	$4,$7
ori		$4,$7,213
lw		$4,82($7)
sh		$7,330($7)
mflo	$1
mfhi	$2
mult	$0,$23
slti	$0,$0,4
lb		$0,48($0)
sw		$23,-15860($23)
mflo	$1
mfhi	$2
addi	$1,$0,55
addi	$2,$0,165
multu	$10,$10
sltiu	$10,$10,3
lbu		$10,44($10)
mthi	$10
mflo	$1
mfhi	$2
mtlo	$5
xori	$7,$5,169
lh		$5,-85($7)
div		$7,$5
mflo	$1
mfhi	$2
addi	$1,$0,129
divu	$0,$6
addi	$0,$6,-199
lhu		$0,40($0)
mult	$6,$6
mflo	$1
mfhi	$2
addi	$2,$0,110
multu	$11,$11
addiu	$11,$11,-36
lw		$11,-88($11)
beq		$11,$11,TAG_12
addiu	$11,$11,1
addiu	$11,$11,1
TAG_12:
mflo	$1
mfhi	$2
addi	$2,$0,153
mthi	$6
andi	$6,$6,32
lb		$7,-173($7)
bne		$6,$7,TAG_13
addiu	$6,$7,1
addiu	$7,$6,1
TAG_13:
mflo	$1
mfhi	$2
mtlo	$0
ori		$20,$0,44
lbu		$20,112($0)
beq		$20,$20,TAG_14
addiu	$20,$20,1
addiu	$20,$20,1
TAG_14:
mflo	$1
mfhi	$2
addi	$1,$0,14
div		$12,$12
slti	$12,$12,2
lh		$12,88($12)
beq		$12,$0,TAG_15
addiu	$12,$0,1
addiu	$0,$12,1
TAG_15:
mflo	$1
mfhi	$2
addi	$2,$0,97
divu	$7,$7
sltiu	$7,$7,1
lhu		$7,88($7)
bne		$7,$7,TAG_16
addiu	$7,$7,1
addiu	$7,$7,1
TAG_16:
mflo	$1
mfhi	$2
addi	$2,$0,255
mult	$0,$0
xori	$22,$0,182
lw		$0,-106($22)
beq		$22,$0,TAG_17
addiu	$22,$0,1
addiu	$0,$22,1
TAG_17:
mflo	$1
mfhi	$2
addi	$1,$0,220
addi	$2,$0,119
multu	$13,$13
addi	$13,$13,-213
lb		$13,73($13)
bgtz	$13,TAG_18
addiu	$13,$13,1
addiu	$13,$13,1
TAG_18:
mflo	$1
mfhi	$2
addi	$2,$0,244
mthi	$7
addiu	$7,$8,154
lbu		$8,36($8)
bgez	$7,TAG_19
addiu	$7,$7,1
addiu	$7,$7,1
TAG_19:
mflo	$1
mfhi	$2
mtlo	$0
andi	$0,$0,143
lh		$0,36($27)
bltz	$0,TAG_20
addiu	$0,$0,1
addiu	$0,$0,1
TAG_20:
mflo	$1
mfhi	$2
addi	$1,$0,19
div		$14,$14
ori		$14,$14,129
lhu		$14,-125($14)
bgtz	$14,TAG_21
addiu	$14,$14,1
addiu	$14,$14,1
TAG_21:
mflo	$1
mfhi	$2
addi	$2,$0,54
divu	$7,$7
slti	$7,$7,-2
lw		$7,24($9)
bgez	$7,TAG_22
addiu	$7,$7,1
addiu	$7,$7,1
TAG_22:
mflo	$1
mfhi	$2
addi	$2,$0,160
mult	$0,$0
sltiu	$0,$1,1
lb		$1,116($0)
bltz	$0,TAG_23
addiu	$0,$0,1
addiu	$0,$0,1
TAG_23:
mflo	$1
mfhi	$2
addi	$1,$0,31
addi	$2,$0,5
multu	$20,$20
xori	$20,$20,65
mthi	$20
lbu		$20,0($20)
mflo	$1
mfhi	$2
mtlo	$15
addi	$15,$7,-65
div		$15,$15
lh		$15,40($15)
mflo	$1
mfhi	$2
addi	$2,$0,81
divu	$0,$3
addiu	$0,$0,68
mult	$3,$3
lhu		$3,64($3)
mflo	$1
mfhi	$2
addi	$2,$0,87
multu	$21,$21
andi	$21,$21,8
mthi	$21
sb		$21,304($21)
mflo	$1
mfhi	$2
mtlo	$7
ori		$16,$7,11
div		$16,$16
sh		$7,217($16)
mflo	$1
mfhi	$2
addi	$2,$0,224
divu	$0,$19
slti	$0,$0,-4
mult	$15,$15
sw		$15,412($0)
mflo	$1
mfhi	$2
addi	$2,$0,38
multu	$2,$2
sltiu	$2,$2,-7
mfhi	$2
lw		$2,116($2)
mflo	$1
mfhi	$2
addi	$2,$0,25
mthi	$7
xori	$27,$27,57
mflo	$7
lb		$7,23($27)
mflo	$1
mfhi	$2
mtlo	$0
addi	$10,$10,-168
mfhi	$10
lbu		$0,36($0)
mflo	$1
mfhi	$2
addi	$1,$0,228
div		$3,$3
addiu	$3,$3,-226
mflo	$3
sb		$3,431($3)
mflo	$1
mfhi	$2
addi	$2,$0,53
divu	$7,$28
andi	$28,$28,8
mfhi	$7
sh		$7,276($28)
mflo	$1
mfhi	$2
mult	$0,$0
ori		$0,$8,247
mflo	$8
sw		$0,332($8)
mflo	$1
mfhi	$2
addi	$1,$0,109
addi	$2,$0,228
addi	$8,$0,80
multu	$14,$14
slti	$14,$14,0
lui		$14,6
lh		$14,8($14)
mflo	$1
mfhi	$2
addi	$2,$0,156
mthi	$9
sltiu	$9,$9,7
lui		$8,6
lhu		$8,132($8)
mflo	$1
mfhi	$2
addi	$9,$0,4
mtlo	$13
xori	$13,$13,148
lui		$13,4
lw		$13,84($0)
mflo	$1
mfhi	$2
div		$15,$15
addi	$15,$15,-209
lui		$15,4
sb		$15,348($15)
mflo	$1
mfhi	$2
addi	$2,$0,155
divu	$8,$8
addiu	$8,$10,230
lui		$8,5
sh		$10,195($10)
mflo	$1
mfhi	$2
addi	$2,$0,13
mult	$0,$0
andi	$0,$0,8
lui		$0,1
sw		$0,459($3)
mflo	$1
mfhi	$2
addi	$1,$0,229
addi	$2,$0,7
multu	$31,$31
ori		$31,$31,242
jal		TAG_24
lb		$31,-15556($31)
addi	$1,$1,1
TAG_24:
mflo	$1
mfhi	$2
addi	$2,$0,201
mthi	$31
slti	$22,$22,6
jal		TAG_25
lbu		$22,71($22)
addi	$1,$1,1
TAG_25:
mflo	$1
mfhi	$2
mtlo	$0
sltiu	$31,$0,2
jal		TAG_26
lh		$31,112($0)
addi	$1,$1,1
TAG_26:
mflo	$1
mfhi	$2
addi	$1,$0,184
div		$31,$31
xori	$31,$31,24
jal		TAG_27
sb		$31,-15244($31)
addi	$1,$1,1
TAG_27:
mflo	$1
mfhi	$2
addi	$2,$0,175
divu	$23,$31
addi	$23,$23,-85
jal		TAG_28
sh		$31,-15795($23)
addi	$1,$1,1
TAG_28:
mflo	$1
mfhi	$2
mult	$0,$31
addiu	$0,$31,133
jal		TAG_29
sw		$31,416($0)
addi	$1,$1,1
TAG_29:
mflo	$1
mfhi	$2
addi	$1,$0,254
addi	$2,$0,63
la		$21,TAG_30
multu	$26,$26
andi	$26,$26,43
jalr	$26,$21
lhu		$26,-15804($26)
addi	$1,$1,1
TAG_30:
mflo	$1
mfhi	$2
addi	$2,$0,105
la		$17,TAG_31
mthi	$8
ori		$8,$8,126
jalr	$8,$17
lw		$8,-15808($21)
addi	$1,$1,1
TAG_31:
mflo	$1
mfhi	$2
la		$17,TAG_32
mtlo	$10
slti	$0,$10,6
jalr	$10,$17
lb		$0,24($0)
addi	$1,$1,1
TAG_32:
mflo	$1
mfhi	$2
#end