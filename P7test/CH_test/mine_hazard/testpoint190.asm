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

la		$19,TAG_0
lbu		$25,-240($5)
mult	$5,$25
jalr	$5,$19
lh		$25,24($25)
addi	$1,$1,1
TAG_0:
mflo	$1
mfhi	$2
addi	$2,$0,63
la		$19,TAG_1
lhu		$5,-12732($5)
multu	$26,$5
jalr	$5,$19
lw		$26,-12732($5)
addi	$1,$1,1
TAG_1:
mflo	$1
mfhi	$2
addi	$2,$0,47
la		$19,TAG_2
lb		$12,24($0)
mthi	$0
jalr	$12,$19
lbu		$0,16($0)
addi	$1,$1,1
TAG_2:
mflo	$1
mfhi	$2
addi	$2,$0,150
la		$19,TAG_3
lh		$21,-216($21)
mtlo	$21
jalr	$21,$19
sb		$21,-12660($21)
addi	$1,$1,1
TAG_3:
mflo	$1
mfhi	$2
addi	$2,$0,21
la		$19,TAG_4
lhu		$27,-196($27)
mtc0	$5,$12
jalr	$5,$19
sh		$27,432($27)
addi	$1,$1,1
TAG_4:
mflo	$1
mfhi	$2
addi	$2,$0,230
la		$19,TAG_5
lw		$28,-12840($5)
div		$5,$5
jalr	$5,$19
sw		$28,-12580($5)
addi	$1,$1,1
TAG_5:
mflo	$1
mfhi	$2
addi	$2,$0,238
la		$19,TAG_6
lb		$9,60($0)
divu	$0,$9
jalr	$0,$19
sb		$9,416($0)
addi	$1,$1,1
TAG_6:
mflo	$1
mfhi	$2
addi	$1,$0,194
addi	$2,$0,165
la		$19,TAG_7
lbu		$22,-112($22)
mult	$22,$22
jalr	$22,$19
multu	$22,$22
addi	$1,$1,1
TAG_7:
mflo	$1
mfhi	$2
addi	$2,$0,190
la		$19,TAG_8
lh		$29,-180($29)
mthi	$29
jalr	$5,$19
mtlo	$5
addi	$1,$1,1
TAG_8:
mflo	$1
mfhi	$2
la		$19,TAG_9
lhu		$5,-164($30)
mtc0	$30,$12
jalr	$5,$19
div		$5,$5
addi	$1,$1,1
TAG_9:
mflo	$1
mfhi	$2
addi	$2,$0,225
la		$19,TAG_10
lw		$27,152($0)
divu	$27,$27
jalr	$0,$19
mult	$27,$0
addi	$1,$1,1
TAG_10:
mflo	$1
mfhi	$2
addi	$1,$0,185
addi	$2,$0,128
lb		$23,-204($23)
multu	$23,$23
nop
srav	$23,$23,$23
mflo	$1
mfhi	$2
lbu		$1,-224($6)
mthi	$1
nop
slt		$1,$6,$6
mflo	$1
mfhi	$2
lh		$6,28($2)
mtlo	$6
nop
sltu	$6,$6,$6
mflo	$1
mfhi	$2
addi	$6,$0,167
lhu		$0,-192($11)
mtc0	$11,$12
nop
sub		$0,$11,$11
mflo	$1
mfhi	$2
lw		$24,-252($24)
div		$24,$24
nop
addiu	$24,$24,-32
mflo	$1
mfhi	$2
addi	$2,$0,212
lb		$6,-240($3)
divu	$6,$3
nop
andi	$3,$6,229
mflo	$1
mfhi	$2
addi	$1,$0,103
addi	$3,$0,240
lbu		$4,132($6)
mult	$6,$6
nop
ori		$6,$6,214
mflo	$1
mfhi	$2
addi	$2,$0,210
lh		$0,-28($26)
multu	$0,$0
nop
slti	$0,$26,5
mflo	$1
mfhi	$2
addi	$1,$0,80
addi	$2,$0,31
lhu		$25,-88($25)
mthi	$25
nop
srl		$25,$25,1
mflo	$1
mfhi	$2
addi	$1,$0,98
lw		$5,-13012($5)
mtlo	$5
nop
sra		$5,$5,2
mflo	$1
mfhi	$2
lb		$6,-214($6)
mtc0	$6,$12
nop
sll		$6,$6,2
mflo	$1
mfhi	$2
lbu		$0,148($0)
div		$0,$3
nop
srl		$3,$3,1
mflo	$1
mfhi	$2
addi	$1,$0,59
addi	$2,$0,173
lh		$26,-116($26)
divu	$26,$26
nop
lhu		$26,-36($26)
mflo	$1
mfhi	$2
addi	$2,$0,5
lw		$6,-168($7)
mult	$6,$7
nop
lb		$6,-140($6)
mflo	$1
mfhi	$2
addi	$2,$0,246
lbu		$8,36($6)
multu	$8,$6
nop
lh		$8,-84($6)
mflo	$1
mfhi	$2
addi	$2,$0,125
lhu		$25,24($0)
mthi	$25
nop
lw		$25,112($0)
mflo	$1
mfhi	$2
lb		$27,92($27)
mtlo	$27
nop
sh		$27,376($27)
mflo	$1
mfhi	$2
lbu		$6,0($6)
mtc0	$6,$13
nop
sw		$9,256($6)
mflo	$1
mfhi	$2
lh		$6,-96($10)
div		$6,$10
nop
sb		$6,304($6)
mflo	$1
mfhi	$2
addi	$1,$0,65
lhu		$0,132($0)
divu	$19,$19
nop
sh		$0,-12916($19)
mflo	$1
mfhi	$2
addi	$2,$0,18
lw		$28,-8($28)
mult	$28,$28
nop
multu	$28,$28
mflo	$1
mfhi	$2
addi	$2,$0,121
lb		$6,-200($11)
mthi	$6
nop
mtlo	$6
mflo	$1
mfhi	$2
lbu		$12,-36($6)
mtc0	$12,$13
nop
div		$12,$6
mflo	$1
mfhi	$2
lh		$0,-28($12)
divu	$12,$1
nop
mult	$12,$12
mflo	$1
mfhi	$2
addi	$2,$0,69
lhu		$29,60($29)
multu	$29,$29
nop
beq		$29,$29,TAG_11
addiu	$29,$29,1
addiu	$29,$29,1
TAG_11:
mflo	$1
mfhi	$2
addi	$2,$0,240
lw		$6,52($6)
mthi	$13
nop
bne		$6,$0,TAG_12
addiu	$6,$0,1
addiu	$0,$6,1
TAG_12:
mflo	$1
mfhi	$2
lb		$14,-196($14)
mtlo	$6
nop
beq		$6,$6,TAG_13
addiu	$6,$6,1
addiu	$6,$6,1
TAG_13:
mflo	$1
mfhi	$2
lbu		$5,100($0)
mtc0	$0,$12
nop
bne		$0,$5,TAG_14
addiu	$0,$5,1
addiu	$5,$0,1
TAG_14:
mflo	$1
mfhi	$2
lh		$30,-128($30)
div		$30,$30
nop
beq		$30,$0,TAG_15
addiu	$30,$0,1
addiu	$0,$30,1
TAG_15:
mflo	$1
mfhi	$2
addi	$2,$0,252
lhu		$15,-164($15)
divu	$6,$6
nop
bne		$6,$6,TAG_16
addiu	$6,$6,1
addiu	$6,$6,1
TAG_16:
mflo	$1
mfhi	$2
addi	$2,$0,24
lw		$16,120($6)
mult	$6,$16
nop
beq		$16,$0,TAG_17
addiu	$16,$0,1
addiu	$0,$16,1
TAG_17:
mflo	$1
mfhi	$2
addi	$2,$0,125
lb		$1,-388($1)
multu	$1,$1
nop
bne		$0,$0,TAG_18
addiu	$0,$0,1
addiu	$0,$0,1
TAG_18:
mflo	$1
mfhi	$2
lbu		$1,-9184($1)
mthi	$1
nop
bgtz	$1,TAG_19
addiu	$1,$1,1
addiu	$1,$1,1
TAG_19:
mflo	$1
mfhi	$2
lh		$6,140($6)
mtlo	$17
nop
bgez	$6,TAG_20
addiu	$6,$6,1
addiu	$6,$6,1
TAG_20:
mflo	$1
mfhi	$2
lhu		$6,-124($18)
mtc0	$6,$13
nop
bltz	$6,TAG_21
addiu	$6,$6,1
addiu	$6,$6,1
TAG_21:
mflo	$1
mfhi	$2
lw		$0,4($0)
div		$0,$21
nop
blez	$0,TAG_22
addiu	$0,$0,1
addiu	$0,$0,1
TAG_22:
mflo	$1
mfhi	$2
addi	$1,$0,196
addi	$2,$0,50
lb		$2,-46($2)
divu	$2,$2
nop
bgtz	$2,TAG_23
addiu	$2,$2,1
addiu	$2,$2,1
TAG_23:
mflo	$1
mfhi	$2
addi	$2,$0,84
lbu		$19,-182($6)
mult	$6,$19
nop
bgez	$6,TAG_24
addiu	$6,$6,1
addiu	$6,$6,1
TAG_24:
mflo	$1
mfhi	$2
addi	$2,$0,18
lh		$20,-220($20)
multu	$6,$6
nop
bltz	$6,TAG_25
addiu	$6,$6,1
addiu	$6,$6,1
TAG_25:
mflo	$1
mfhi	$2
addi	$2,$0,98
lhu		$0,68($0)
mthi	$0
nop
blez	$1,TAG_26
addiu	$1,$1,1
addiu	$1,$1,1
TAG_26:
mflo	$1
mfhi	$2
addi	$2,$0,171
lw		$5,-172($5)
mflo	$5
subu	$5,$5,$5
xor		$5,$5,$5
mflo	$1
mfhi	$2
addi	$2,$0,202
addi	$5,$0,61
lb		$25,-93($6)
mfc0	$6,$13
add		$25,$25,$6
addu	$6,$25,$6
mflo	$1
mfhi	$2
addi	$2,$0,132
lbu		$26,-280($6)
mfhi	$6
and		$26,$26,$26
nor		$6,$26,$6
mflo	$1
mfhi	$2
addi	$2,$0,42
lh		$0,68($0)
mflo	$16
or		$0,$0,$0
sllv	$16,$0,$0
mflo	$1
mfhi	$2
addi	$2,$0,252
addi	$16,$0,14
lhu		$6,157($6)
mfc0	$6,$12
srlv	$6,$6,$6
sltiu	$6,$6,-7
mflo	$1
mfhi	$2
addi	$2,$0,99
lw		$6,59($6)
mfhi	$6
srav	$27,$6,$27
xori	$6,$6,183
mflo	$1
mfhi	$2
addi	$2,$0,213
addi	$27,$0,145
lb		$6,56($28)
mflo	$6
slt		$28,$28,$28
addi	$6,$28,111
mflo	$1
mfhi	$2
addi	$2,$0,226
addi	$28,$0,132
lbu		$0,-1($27)
mfc0	$0,$13
sltu	$27,$0,$0
addiu	$0,$27,193
mflo	$1
mfhi	$2
addi	$2,$0,237
addi	$27,$0,32
lh		$7,-216($7)
mfhi	$7
sub		$7,$7,$7
sra		$7,$7,2
mflo	$1
mfhi	$2
addi	$2,$0,212
addi	$7,$0,233
lhu		$6,-81($29)
mflo	$6
subu	$29,$6,$6
sll		$29,$6,1
mflo	$1
mfhi	$2
addi	$2,$0,177
lw		$30,4327($6)
mfc0	$6,$12
xor		$30,$30,$30
srl		$6,$30,1
mflo	$1
mfhi	$2
addi	$1,$0,112
mfc0	$1,$12
addi	$1,$0,236
mfc0	$1,$13
addi	$1,$0,112
mfc0	$1,$14
addi	$2,$0,242
addi	$6,$0,48
addi	$30,$0,164
lb		$17,68($0)
mfhi	$0
add		$17,$17,$17
sra		$0,$0,1
mflo	$1
mfhi	$2
addi	$2,$0,108
lbu		$8,0($8)
mflo	$8
addu	$8,$8,$8
lh		$8,15324($8)
mflo	$1
mfhi	$2
addi	$1,$0,80
mfc0	$1,$12
addi	$1,$0,60
mfc0	$1,$13
addi	$1,$0,152
mfc0	$1,$14
addi	$2,$0,248
lhu		$7,-140($1)
mfc0	$7,$13
and		$1,$1,$1
lw		$7,-88($1)
mflo	$1
mfhi	$2
addi	$2,$0,194
lb		$7,-182($2)
mfhi	$7
nor		$2,$7,$7
lbu		$7,85($2)
mflo	$1
mfhi	$2
addi	$2,$0,83
lh		$0,-24($28)
mflo	$28
or		$0,$28,$0
lhu		$28,10932($28)
mflo	$1
mfhi	$2
addi	$1,$0,72
mfc0	$1,$12
addi	$1,$0,176
mfc0	$1,$13
addi	$1,$0,180
mfc0	$1,$14
addi	$2,$0,103
lw		$9,84($9)
mfc0	$9,$12
sllv	$9,$9,$9
sw		$9,-18000($9)
mflo	$1
mfhi	$2
addi	$2,$0,146
lb		$7,-12($3)
mfhi	$7
srlv	$3,$3,$7
sb		$7,308($3)
mflo	$1
mfhi	$2
addi	$2,$0,53
addi	$7,$0,91
lbu		$4,12($4)
mflo	$7
srav	$4,$7,$7
sh		$7,3053($7)
mflo	$1
mfhi	$2
addi	$1,$0,232
mfc0	$1,$12
addi	$1,$0,144
mfc0	$1,$13
addi	$1,$0,152
mfc0	$1,$14
addi	$2,$0,84
addi	$4,$0,221
lh		$0,-13068($22)
mfc0	$0,$12
slt		$22,$22,$22
sw		$22,296($0)
mflo	$1
mfhi	$2
addi	$2,$0,147
addi	$22,$0,132
lhu		$10,-236($10)
mfhi	$10
sltu	$10,$10,$10
mtlo	$10
mflo	$1
mfhi	$2
addi	$1,$0,50
addi	$2,$0,118
addi	$10,$0,18
lw		$7,8176($7)
mflo	$7
sub		$5,$5,$7
mtc0	$5,$13
mflo	$1
mfhi	$2
addi	$1,$0,120
mfc0	$1,$12
addi	$1,$0,176
mfc0	$1,$13
addi	$1,$0,184
mfc0	$1,$14
addi	$2,$0,148
addi	$7,$0,18
lb		$7,0($6)
mfc0	$7,$13
subu	$6,$6,$6
div		$7,$12
mflo	$1
mfhi	$2
addi	$6,$0,200
lbu		$0,92($0)
mfhi	$30
xor		$0,$30,$30
divu	$30,$9
mflo	$1
mfhi	$2
addi	$1,$0,241
lh		$11,-192($11)
mflo	$11
add		$11,$11,$11
beq		$11,$11,TAG_27
addiu	$11,$11,1
addiu	$11,$11,1
TAG_27:
mflo	$1
mfhi	$2
addi	$1,$0,120
lhu		$7,-68($7)
mfc0	$7,$13
addu	$7,$7,$7
bne		$7,$0,TAG_28
addiu	$7,$0,1
addiu	$0,$7,1
TAG_28:
mflo	$1
mfhi	$2
addi	$1,$0,193
lw		$8,3($7)
mfhi	$7
and		$8,$7,$7
beq		$8,$8,TAG_29
addiu	$8,$8,1
addiu	$8,$8,1
TAG_29:
mflo	$1
mfhi	$2
addi	$1,$0,72
lb		$0,-216($13)
mflo	$13
nor		$0,$13,$13
bne		$0,$1,TAG_30
addiu	$0,$1,1
addiu	$1,$0,1
TAG_30:
mflo	$1
mfhi	$2
addi	$1,$0,55
addi	$13,$0,159
lbu		$12,-64($12)
mfc0	$12,$12
or		$12,$12,$12
beq		$12,$0,TAG_31
addiu	$12,$0,1
addiu	$0,$12,1
TAG_31:
mflo	$1
mfhi	$2
addi	$1,$0,39
lh		$7,-18364($9)
mfhi	$7
sllv	$9,$7,$7
bne		$7,$9,TAG_32
addiu	$7,$9,1
addiu	$9,$7,1
TAG_32:
mflo	$1
mfhi	$2
addi	$1,$0,43
lhu		$10,-25($7)
mflo	$7
srlv	$10,$10,$10
beq		$7,$10,TAG_33
addiu	$7,$10,1
addiu	$10,$7,1
TAG_33:
mflo	$1
mfhi	$2
addi	$1,$0,234
lw		$5,44($0)
mfc0	$0,$12
srav	$5,$5,$0
bne		$0,$0,TAG_34
addiu	$0,$0,1
addiu	$0,$0,1
TAG_34:
mflo	$1
mfhi	$2
addi	$1,$0,108
lb		$13,-35($13)
mfhi	$13
slt		$13,$13,$13
bgtz	$13,TAG_35
addiu	$13,$13,1
addiu	$13,$13,1
TAG_35:
mflo	$1
mfhi	$2
addi	$1,$0,68
lbu		$7,147($11)
mflo	$7
sltu	$11,$7,$7
bgez	$7,TAG_36
addiu	$7,$7,1
addiu	$7,$7,1
TAG_36:
mflo	$1
mfhi	$2
addi	$1,$0,171
addi	$11,$0,217
lh		$12,91($7)
mfc0	$7,$13
sub		$12,$7,$12
bltz	$7,TAG_37
addiu	$7,$7,1
addiu	$7,$7,1
TAG_37:
mflo	$1
mfhi	$2
addi	$1,$0,46
lhu		$7,156($0)
mfhi	$7
subu	$0,$0,$0
blez	$7,TAG_38
addiu	$7,$7,1
addiu	$7,$7,1
TAG_38:
mflo	$1
mfhi	$2
addi	$1,$0,194
lw		$14,112($14)
mflo	$14
xor		$14,$14,$14
bgtz	$14,TAG_39
addiu	$14,$14,1
addiu	$14,$14,1
TAG_39:
mflo	$1
mfhi	$2
addi	$1,$0,108
lb		$7,2($13)
mfc0	$7,$13
add		$13,$13,$13
bgez	$7,TAG_40
addiu	$7,$7,1
addiu	$7,$7,1
TAG_40:
mflo	$1
mfhi	$2
addi	$1,$0,175
lbu		$7,-25($7)
mfhi	$7
addu	$14,$7,$7
bltz	$7,TAG_41
addiu	$7,$7,1
addiu	$7,$7,1
TAG_41:
mflo	$1
mfhi	$2
addi	$1,$0,60
lh		$8,67($8)
mflo	$8
and		$0,$8,$8
blez	$8,TAG_42
addiu	$8,$8,1
addiu	$8,$8,1
TAG_42:
mflo	$1
mfhi	$2
addi	$1,$0,102
lhu		$17,-28($17)
mfc0	$17,$12
andi	$17,$17,180
nor		$17,$17,$17
mflo	$1
mfhi	$2
addi	$1,$0,69
lw		$7,50($7)
mfhi	$7
ori		$7,$7,209
or		$19,$19,$7
mflo	$1
mfhi	$2
.ktext 0x4180

_entry5:
	sw		$k0,0x2ffc($0)
	mfc0	$k0,$12
	mfc0	$k0,$13
	mfc0	$k0,$14
	addiu	$k0,$k0,4
	mtc0	$k0,$14
	lw		$k0,0x2ffc($0)
	eret
	eret
	eret
#end