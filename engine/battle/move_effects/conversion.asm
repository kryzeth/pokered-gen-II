ConversionEffect_:
	ld hl, wEnemyMonType1
	ld de, wBattleMonType1
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyBattleStatus1]
	jr z, .conversionEffect
	push hl
	ld h, d
	ld l, e
	pop de
	ld a, [wPlayerBattleStatus1]
.conversionEffect
	bit INVULNERABLE_DIG, a ; Check if mon is immune to dig attacks
	jr nz, PrintButItFailedText
	bit INVULNERABLE_FLY, a ; Check if mon is immune to fly attacks
	jr nz, PrintButItFailedText
; copy target's types to user
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, PlayCurrentMoveAnimation
	call CallBankF
	ld hl, ConvertedTypeText
	jp PrintText

ConvertedTypeText:
	text_far _ConvertedTypeText
	text_end

PrintButItFailedText:
	ld hl, PrintButItFailedText_
CallBankF:
	ld b, BANK(PrintButItFailedText_)
	jp Bankswitch
