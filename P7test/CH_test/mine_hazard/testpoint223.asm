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

addiu	$7,$14,75
mflo	$7
sll		$7,$7,2
bltz	$7,TAG_0
addiu	$7,$7,1
addiu	$7,$7,1
TAG_0:
mflo	$1
mfhi	$2
addi	$1,$0,145
addi	$2,$0,236
andi	$0,$5,157
mfc0	$0,$13
srl		$5,$0,2
blez	$0,TAG_1
addiu	$0,$0,1
addiu	$0,$0,1
TAG_1:
mflo	$1
mfhi	$2
addi	$1,$0,9
addi	$2,$0,187
addi	$5,$0,122
ori		$29,$29,106
mfhi	$29
mtc0	$29,$13
subu	$29,$29,$29
mflo	$1
mfhi	$2
addi	$1,$0,189
addi	$2,$0,5
addi	$29,$0,66
slti	$13,$8,3
mflo	$8
div		$8,$9
xor		$13,$8,$13
mflo	$1
mfhi	$2
addi	$1,$0,113
addi	$2,$0,205
addi	$8,$0,163
addi	$13,$0,17
sltiu	$8,$8,-6
mfc0	$8,$12
divu	$8,$21
add		$14,$14,$8
mflo	$1
mfhi	$2
addi	$1,$0,192
addi	$2,$0,206
addi	$8,$0,97
xori	$17,$17,217
mfhi	$0
mult	$0,$17
addu	$17,$17,$17
mflo	$1
mfhi	$2
addi	$1,$0,75
addi	$2,$0,253
addi	$30,$30,90
mflo	$30
multu	$30,$30
addiu	$30,$30,46
mflo	$1
mfhi	$2
addi	$1,$0,222
addi	$2,$0,57
andi	$8,$15,47
mfc0	$8,$13
mthi	$15
ori		$15,$8,219
mflo	$1
mfhi	$2
addi	$1,$0,82
addi	$8,$0,43
slti	$16,$8,4
mfhi	$8
mtlo	$8
sltiu	$8,$8,-5
mflo	$1
mfhi	$2
addi	$16,$0,213
xori	$7,$7,173
mflo	$7
mtc0	$7,$13
addi	$7,$7,-235
mflo	$1
mfhi	$2
addiu	$1,$1,-99
mfc0	$1,$13
div		$1,$1
sra		$1,$1,1
mflo	$1
mfhi	$2
addi	$2,$0,149
andi	$8,$8,83
mfhi	$8
divu	$17,$17
sll		$8,$8,2
mflo	$1
mfhi	$2
addi	$2,$0,18
addi	$8,$0,209
ori		$18,$18,3
mflo	$8
mult	$18,$8
srl		$18,$8,2
mflo	$1
mfhi	$2
addi	$2,$0,4
addi	$18,$0,59
slti	$30,$0,0
mfc0	$0,$12
multu	$30,$30
sra		$30,$0,1
mflo	$1
mfhi	$2
addi	$1,$0,244
addi	$2,$0,18
addi	$30,$0,6
sltiu	$4,$4,-6
mfhi	$4
mthi	$4
mtlo	$4
mflo	$1
mfhi	$2
addi	$1,$0,90
addi	$2,$0,86
addi	$4,$0,92
xori	$8,$23,36
mflo	$8
mtc0	$8,$12
div		$23,$23
mflo	$1
mfhi	$2
addi	$2,$0,166
addi	$8,$0,139
addi	$24,$24,-89
mfc0	$8,$12
divu	$24,$24
mult	$8,$24
mflo	$1
mfhi	$2
addi	$1,$0,54
addi	$2,$0,14
addi	$8,$0,107
addiu	$4,$4,156
mfhi	$4
multu	$0,$0
mthi	$4
mflo	$1
mfhi	$2
addi	$1,$0,119
addi	$2,$0,53
addi	$4,$0,157
andi	$5,$5,170
mflo	$5
mtlo	$5
beq		$5,$5,TAG_2
addiu	$5,$5,1
addiu	$5,$5,1
TAG_2:
mflo	$1
mfhi	$2
addi	$1,$0,13
addi	$2,$0,207
ori		$8,$8,181
mfc0	$8,$12
mtc0	$8,$13
bne		$25,$8,TAG_3
addiu	$25,$8,1
addiu	$8,$25,1
TAG_3:
mflo	$1
mfhi	$2
addi	$1,$0,79
addi	$2,$0,196
addi	$8,$0,213
slti	$8,$8,1
mfhi	$8
div		$8,$26
beq		$26,$26,TAG_4
addiu	$26,$26,1
addiu	$26,$26,1
TAG_4:
mflo	$1
mfhi	$2
addi	$1,$0,50
addi	$2,$0,61
addi	$8,$0,57
sltiu	$0,$0,5
mflo	$0
divu	$11,$28
bne		$11,$0,TAG_5
addiu	$11,$0,1
addiu	$0,$11,1
TAG_5:
mflo	$1
mfhi	$2
addi	$2,$0,123
xori	$6,$6,104
mfc0	$6,$13
mult	$6,$6
beq		$6,$1,TAG_6
addiu	$6,$1,1
addiu	$1,$6,1
TAG_6:
mflo	$1
mfhi	$2
addi	$1,$0,25
addi	$2,$0,199
addi	$8,$27,108
mfhi	$8
multu	$27,$27
bne		$27,$27,TAG_7
addiu	$27,$27,1
addiu	$27,$27,1
TAG_7:
mflo	$1
mfhi	$2
addi	$2,$0,124
addi	$8,$0,77
addiu	$8,$28,-205
mflo	$8
mthi	$28
beq		$8,$0,TAG_8
addiu	$8,$0,1
addiu	$0,$8,1
TAG_8:
mflo	$1
mfhi	$2
andi	$8,$0,144
mfc0	$8,$12
mtlo	$8
bne		$0,$0,TAG_9
addiu	$0,$0,1
addiu	$0,$0,1
TAG_9:
mflo	$1
mfhi	$2
addi	$1,$0,176
addi	$8,$0,22
ori		$7,$7,129
mfhi	$7
mtc0	$7,$13
bgtz	$7,TAG_10
addiu	$7,$7,1
addiu	$7,$7,1
TAG_10:
mflo	$1
mfhi	$2
addi	$1,$0,176
slti	$8,$29,-1
mflo	$8
div		$8,$29
bgez	$8,TAG_11
addiu	$8,$8,1
addiu	$8,$8,1
TAG_11:
mflo	$1
mfhi	$2
addi	$1,$0,210
addi	$2,$0,200
sltiu	$8,$30,-7
mfc0	$8,$12
divu	$30,$30
bltz	$8,TAG_12
addiu	$8,$8,1
addiu	$8,$8,1
TAG_12:
mflo	$1
mfhi	$2
addi	$2,$0,17
xori	$0,$0,160
mfhi	$0
mult	$0,$5
blez	$0,TAG_13
addiu	$0,$0,1
addiu	$0,$0,1
TAG_13:
mflo	$1
mfhi	$2
addi	$1,$0,115
addi	$2,$0,106
addi	$8,$8,-173
mflo	$8
multu	$8,$8
bgtz	$8,TAG_14
addiu	$8,$8,1
addiu	$8,$8,1
TAG_14:
mflo	$1
mfhi	$2
addi	$1,$0,119
addi	$2,$0,168
addiu	$1,$9,-71
mfc0	$9,$13
mthi	$1
bgez	$9,TAG_15
addiu	$9,$9,1
addiu	$9,$9,1
TAG_15:
mflo	$1
mfhi	$2
addi	$1,$0,222
andi	$9,$2,249
mfhi	$9
mtlo	$2
bltz	$9,TAG_16
addiu	$9,$9,1
addiu	$9,$9,1
TAG_16:
mflo	$1
mfhi	$2
ori		$0,$0,19
mflo	$13
mtc0	$0,$13
blez	$13,TAG_17
addiu	$13,$13,1
addiu	$13,$13,1
TAG_17:
mflo	$1
mfhi	$2
slti	$11,$11,-6
mfc0	$11,$13
mfhi	$11
and		$11,$11,$11
mflo	$1
mfhi	$2
sltiu	$9,$9,6
mflo	$9
mfc0	$9,$12
nor		$7,$9,$7
mflo	$1
mfhi	$2
addi	$9,$0,178
xori	$9,$9,168
mfhi	$9
mflo	$9
or		$8,$8,$9
mflo	$1
mfhi	$2
addi	$0,$22,3
mfc0	$22,$13
mfhi	$22
sllv	$0,$22,$22
mflo	$1
mfhi	$2
addiu	$12,$12,-138
mflo	$12
mfc0	$12,$12
andi	$12,$12,225
mflo	$1
mfhi	$2
addi	$12,$0,34
ori		$9,$9,221
mfhi	$9
mflo	$9
slti	$9,$9,0
mflo	$1
mfhi	$2
addi	$9,$0,44
sltiu	$9,$10,0
mfc0	$9,$12
mfhi	$9
xori	$9,$10,150
mflo	$1
mfhi	$2
addi	$16,$16,-54
mflo	$0
mfc0	$0,$12
addiu	$0,$0,-181
mflo	$1
mfhi	$2
andi	$13,$13,9
mfhi	$13
mflo	$13
sll		$13,$13,2
mflo	$1
mfhi	$2
ori		$9,$9,134
mfc0	$9,$13
mfhi	$9
srl		$11,$9,1
mflo	$1
mfhi	$2
slti	$12,$9,-1
mflo	$9
mfc0	$9,$13
sra		$12,$9,1
mflo	$1
mfhi	$2
addi	$9,$0,134
addi	$12,$0,171
sltiu	$0,$27,4
mfhi	$27
mflo	$27
sll		$27,$0,1
mflo	$1
mfhi	$2
addi	$27,$0,197
xori	$16,$16,3
mfc0	$16,$12
mfhi	$16
div		$16,$16
mflo	$1
mfhi	$2
addi	$2,$0,37
addi	$17,$17,-136
mflo	$9
mfc0	$9,$13
divu	$9,$17
mflo	$1
mfhi	$2
addi	$1,$0,39
addi	$2,$0,56
addi	$9,$0,183
addiu	$18,$9,1
mfhi	$9
mflo	$9
mult	$18,$18
mflo	$1
mfhi	$2
addi	$2,$0,111
addi	$9,$0,142
andi	$0,$18,255
mfc0	$0,$13
mfhi	$0
multu	$18,$0
mflo	$1
mfhi	$2
addi	$1,$0,183
addi	$2,$0,13
ori		$17,$17,134
mflo	$17
mfc0	$17,$13
beq		$17,$17,TAG_18
addiu	$17,$17,1
addiu	$17,$17,1
TAG_18:
mflo	$1
mfhi	$2
addi	$1,$0,164
addi	$2,$0,91
slti	$19,$19,-4
mfhi	$9
mflo	$9
bne		$9,$1,TAG_19
addiu	$9,$1,1
addiu	$1,$9,1
TAG_19:
mflo	$1
mfhi	$2
addi	$1,$0,169
addi	$2,$0,108
addi	$19,$0,225
sltiu	$9,$9,-7
mfc0	$9,$13
mfhi	$9
beq		$20,$20,TAG_20
addiu	$20,$20,1
addiu	$20,$20,1
TAG_20:
mflo	$1
mfhi	$2
addi	$1,$0,141
addi	$2,$0,219
addi	$9,$0,78
xori	$28,$0,105
mflo	$28
mfc0	$28,$13
bne		$28,$1,TAG_21
addiu	$28,$1,1
addiu	$1,$28,1
TAG_21:
mflo	$1
mfhi	$2
addi	$1,$0,186
addi	$2,$0,47
addi	$18,$18,-183
mfhi	$18
mflo	$18
beq		$18,$1,TAG_22
addiu	$18,$1,1
addiu	$1,$18,1
TAG_22:
mflo	$1
mfhi	$2
addi	$1,$0,214
addi	$2,$0,60
addiu	$21,$9,-163
mfc0	$9,$13
mfhi	$9
bne		$9,$9,TAG_23
addiu	$9,$9,1
addiu	$9,$9,1
TAG_23:
mflo	$1
mfhi	$2
addi	$1,$0,92
addi	$2,$0,142
andi	$9,$9,23
mflo	$9
mfc0	$9,$13
beq		$22,$0,TAG_24
addiu	$22,$0,1
addiu	$0,$22,1
TAG_24:
mflo	$1
mfhi	$2
addi	$1,$0,159
addi	$2,$0,29
addi	$9,$0,239
ori		$30,$0,135
mfhi	$30
mflo	$30
bne		$0,$30,TAG_25
addiu	$0,$30,1
addiu	$30,$0,1
TAG_25:
mflo	$1
mfhi	$2
addi	$1,$0,95
addi	$2,$0,155
slti	$19,$19,1
mfc0	$19,$13
mfhi	$19
bgtz	$19,TAG_26
addiu	$19,$19,1
addiu	$19,$19,1
TAG_26:
mflo	$1
mfhi	$2
addi	$1,$0,67
addi	$2,$0,247
sltiu	$23,$9,7
mflo	$9
mfc0	$9,$12
bgez	$9,TAG_27
addiu	$9,$9,1
addiu	$9,$9,1
TAG_27:
mflo	$1
mfhi	$2
addi	$1,$0,1
addi	$2,$0,39
addi	$23,$0,201
xori	$24,$9,101
mfhi	$9
mflo	$9
bltz	$9,TAG_28
addiu	$9,$9,1
addiu	$9,$9,1
TAG_28:
mflo	$1
mfhi	$2
addi	$1,$0,202
addi	$2,$0,56
addi	$0,$0,67
mfc0	$0,$12
mfhi	$0
blez	$0,TAG_29
addiu	$0,$0,1
addiu	$0,$0,1
TAG_29:
mflo	$1
mfhi	$2
addi	$1,$0,110
addi	$2,$0,59
addiu	$20,$20,96
mflo	$20
mfc0	$20,$12
bgtz	$20,TAG_30
addiu	$20,$20,1
addiu	$20,$20,1
TAG_30:
mflo	$1
mfhi	$2
addi	$1,$0,195
addi	$2,$0,175
andi	$25,$25,130
mfhi	$9
mflo	$9
bgez	$9,TAG_31
addiu	$9,$9,1
addiu	$9,$9,1
TAG_31:
mflo	$1
mfhi	$2
addi	$1,$0,39
addi	$2,$0,166
addi	$25,$0,161
ori		$9,$9,209
mfc0	$9,$13
mfhi	$9
bltz	$9,TAG_32
addiu	$9,$9,1
addiu	$9,$9,1
TAG_32:
mflo	$1
mfhi	$2
addi	$1,$0,191
addi	$2,$0,223
slti	$0,$0,2
mflo	$0
mfc0	$0,$13
blez	$0,TAG_33
addiu	$0,$0,1
addiu	$0,$0,1
TAG_33:
mflo	$1
mfhi	$2
addi	$1,$0,243
addi	$2,$0,118
sltiu	$23,$23,2
mfhi	$23
lui		$23,2
srlv	$23,$23,$23
mflo	$1
mfhi	$2
addi	$1,$0,41
addi	$2,$0,121
xori	$1,$1,216
mflo	$10
lui		$10,1
srav	$1,$1,$10
mflo	$1
mfhi	$2
addi	$1,$0,101
addi	$2,$0,49
addi	$2,$2,170
mfc0	$10,$12
lui		$10,5
slt		$2,$2,$10
mflo	$1
mfhi	$2
addi	$1,$0,222
addi	$2,$0,96
addiu	$0,$4,-169
mfhi	$0
lui		$0,7
sltu	$4,$0,$0
mflo	$1
mfhi	$2
addi	$1,$0,154
addi	$2,$0,206
addi	$4,$0,124
andi	$24,$24,0
mflo	$24
lui		$24,2
ori		$24,$24,12
mflo	$1
mfhi	$2
addi	$1,$0,161
addi	$2,$0,229
slti	$10,$3,6
mfc0	$10,$12
lui		$10,3
sltiu	$10,$10,0
mflo	$1
mfhi	$2
addi	$1,$0,203
addi	$2,$0,211
addi	$10,$0,182
xori	$10,$10,76
mfhi	$10
lui		$10,0
addi	$10,$10,58
mflo	$1
mfhi	$2
addi	$1,$0,117
addi	$2,$0,204
addiu	$30,$0,-221
mflo	$0
lui		$0,2
andi	$0,$30,92
mflo	$1
mfhi	$2
addi	$1,$0,165
addi	$2,$0,143
ori		$25,$25,52
mfc0	$25,$12
lui		$25,6
srl		$25,$25,2
mflo	$1
mfhi	$2
addi	$1,$0,34
addi	$2,$0,109
slti	$5,$5,6
mfhi	$10
lui		$10,2
sra		$10,$10,2
mflo	$1
mfhi	$2
addi	$1,$0,179
addi	$2,$0,200
sltiu	$10,$10,-4
mflo	$10
lui		$10,1
sll		$6,$6,1
mflo	$1
mfhi	$2
addi	$1,$0,87
addi	$2,$0,140
xori	$1,$0,106
mfc0	$1,$12
lui		$1,0
srl		$1,$0,2
mflo	$1
mfhi	$2
addi	$1,$0,72
addi	$2,$0,198
addi	$28,$28,-224
mfhi	$28
lui		$28,5
mthi	$28
mflo	$1
mfhi	$2
addi	$1,$0,21
addiu	$11,$11,190
mflo	$10
lui		$10,6
mtlo	$10
mflo	$1
mfhi	$2
andi	$12,$12,232
mfc0	$10,$12
lui		$10,3
mtc0	$10,$12
mflo	$1
mfhi	$2
ori		$9,$0,203
mfhi	$0
lui		$0,5
div		$0,$9
mflo	$1
mfhi	$2
addi	$1,$0,177
addi	$2,$0,172
slti	$29,$29,-4
mflo	$29
lui		$29,2
beq		$29,$29,TAG_34
addiu	$29,$29,1
addiu	$29,$29,1
TAG_34:
mflo	$1
mfhi	$2
addi	$1,$0,23
addi	$2,$0,152
sltiu	$10,$10,2
mfc0	$10,$13
lui		$10,5
bne		$10,$13,TAG_35
addiu	$10,$13,1
addiu	$13,$10,1
TAG_35:
mflo	$1
mfhi	$2
addi	$1,$0,165
addi	$2,$0,122
xori	$10,$10,176
mfhi	$10
lui		$10,0
beq		$10,$10,TAG_36
addiu	$10,$10,1
addiu	$10,$10,1
TAG_36:
mflo	$1
mfhi	$2
addi	$1,$0,202
addi	$2,$0,139
addi	$0,$27,248
mflo	$27
lui		$27,2
bne		$0,$1,TAG_37
addiu	$0,$1,1
addiu	$1,$0,1
TAG_37:
mflo	$1
mfhi	$2
addi	$1,$0,119
addi	$2,$0,146
addiu	$30,$30,-50
mfc0	$30,$12
lui		$30,0
beq		$30,$1,TAG_38
addiu	$30,$1,1
addiu	$1,$30,1
TAG_38:
mflo	$1
mfhi	$2
addi	$1,$0,193
addi	$2,$0,4
andi	$10,$10,36
mfhi	$10
lui		$10,7
bne		$10,$10,TAG_39
addiu	$10,$10,1
addiu	$10,$10,1
TAG_39:
mflo	$1
mfhi	$2
addi	$1,$0,18
addi	$2,$0,154
ori		$10,$16,78
mflo	$10
lui		$10,3
beq		$10,$0,TAG_40
addiu	$10,$0,1
addiu	$0,$10,1
TAG_40:
mflo	$1
mfhi	$2
addi	$1,$0,42
addi	$2,$0,179
slti	$0,$0,1
mfc0	$28,$13
lui		$28,7
bne		$28,$28,TAG_41
addiu	$28,$28,1
addiu	$28,$28,1
TAG_41:
mflo	$1
mfhi	$2
addi	$1,$0,59
addi	$2,$0,240
sltiu	$1,$1,1
mfhi	$1
lui		$1,2
bgtz	$1,TAG_42
addiu	$1,$1,1
addiu	$1,$1,1
TAG_42:
mflo	$1
mfhi	$2
addi	$1,$0,214
addi	$2,$0,38
xori	$10,$10,38
mflo	$10
lui		$10,6
bgez	$10,TAG_43
addiu	$10,$10,1
addiu	$10,$10,1
TAG_43:
mflo	$1
mfhi	$2
addi	$1,$0,225
addi	$2,$0,50
addi	$18,$18,-169
mfc0	$10,$12
lui		$10,6
bltz	$10,TAG_44
addiu	$10,$10,1
addiu	$10,$10,1
TAG_44:
mflo	$1
mfhi	$2
addi	$1,$0,218
addi	$2,$0,120
addiu	$8,$0,-134
mfhi	$8
lui		$8,3
blez	$8,TAG_45
addiu	$8,$8,1
addiu	$8,$8,1
TAG_45:
mflo	$1
mfhi	$2
addi	$1,$0,57
addi	$2,$0,162
andi	$2,$2,247
mflo	$2
lui		$2,0
bgtz	$2,TAG_46
addiu	$2,$2,1
addiu	$2,$2,1
TAG_46:
mflo	$1
mfhi	$2
addi	$1,$0,186
addi	$2,$0,23
ori		$10,$10,77
mfc0	$10,$13
lui		$10,5
bgez	$10,TAG_47
addiu	$10,$10,1
addiu	$10,$10,1
TAG_47:
mflo	$1
mfhi	$2
addi	$1,$0,124
addi	$2,$0,34
slti	$20,$10,3
mfhi	$10
lui		$10,1
bltz	$10,TAG_48
addiu	$10,$10,1
addiu	$10,$10,1
TAG_48:
mflo	$1
mfhi	$2
addi	$1,$0,190
addi	$2,$0,5
addi	$20,$0,60
sltiu	$20,$20,2
mflo	$0
lui		$0,7
blez	$0,TAG_49
addiu	$0,$0,1
addiu	$0,$0,1
TAG_49:
mflo	$1
mfhi	$2
.ktext 0x4180

_entry6:
	sw		$k0,0x2ffc($0)
	mfc0	$k0,$12
	mfc0	$k0,$13
	mfc0	$k0,$14
	addiu	$k0,$k0,4
	mtc0	$k0,$14
	lw		$k0,0x2ffc($0)
	eret
	LOOP1:	j	LOOP1
	LOOP2:	j	LOOP2
	LOOP3:	j	LOOP3
#end