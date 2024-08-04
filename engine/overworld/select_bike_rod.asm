; this function handles quick-use of fishing and biking
TryBikeRod::	; predef
	xor a					; clears the variable
	ld a, [wWalkBikeSurfState]			; load surf state
	cp 2								; is the player already surfing?
	jr z, .notFishing					; can't fish while surfing
	callfar IsNextTileShoreOrWater		; apparently unsets c if player is facing water or shore
	jr c, .notFishing					; if c is set, then not facing water tiles, so skip to bike script
	ld hl, TilePairCollisionsWater		; loads whatever this is into hl, probably for the following check
	call CheckForTilePairCollisions2	; I am unsure what this checks for
	jr c, .notFishing					; but if c ends up set, then I guess we're not fishing
.tryForRod					; else, continue fishing rod attempts
	ld b, SUPER_ROD			; load rod into b (for IsItemInBag check)
	push bc					; copies b into c (b gets overwritten during the following check)
	call IsItemInBag		; sets the zero flag if rod not found, unsets if there is one
	pop bc					; copies c back into b
	jr nz, .startFishing	; if zero flag is not set, then prepare to start fishing
	ld b, GOOD_ROD			; load rod into b (for IsItemInBag check)
	push bc					; copies b into c (b gets overwritten during the following check)
	call IsItemInBag		; sets the zero flag if rod not found, unsets if there is one
	pop bc					; copies c back into b
	jr nz, .startFishing	; if yes, then prepare to start fishing
	ld b, OLD_ROD			; load rod into b (for IsItemInBag check)
	push bc					; copies b into c (b gets overwritten during the following check)
	call IsItemInBag		; sets the zero flag if rod not found, unsets if there is one
	pop bc					; copies c back into b
	jr nz, .startFishing	; if yes, then prepare to start fishing
	jr .notFishing			; if no rods in bag, then try bike instead
.startFishing
	ld a, b					; whichever rod passed the check, load from b into a
	ld [wcf91],a			; loads a into item_use variable for UseItem
	ld [wd11e],a			; loads a into item_name variable for GetItemName
	call GetItemName		; get the item name into de register
	call CopyToStringBuffer ; copy name to wStringBuffer
	jr .useItem				; use the rod and eventually returns to the overworld loop
.notFishing
	ld a,BICYCLE			; loads bike into a
	ld [wcf91],a			; loads a into item_use variable for UseItem
	ld [wPseudoItemID],a	; loads a into this variable to skip writing text during ItemUseBicycle script
	ld [wd11e],a			; loads a into item_name variable for GetItemName
	call GetItemName		; get the item name into de register
	call CopyToStringBuffer ; copy name to wStringBuffer
.tryForBike
	ld a,[wWalkBikeSurfState]	; loads walk/bike/surf state into a
	cp a,1						; check if already on bike (a=1)
	jr z,.useItem				; if true, skip to useitem (always allowed to get off bike, even if no bike in inventory)
	ld b,BICYCLE				; load bike into b (for IsItemInBag check)
	call IsItemInBag			; check if item in bag
	jr nz,.useItem				; if yes, skip to useItem
.noBike							; else, player does not have bike, so
	call InitializeBikeRodTextBox	; prepare to write text
	ld hl,TextNoBikeRod			; load text for NoBike into hl for PrintText
	call PrintText				; prints the NoBike text
	jr .cleanUp					; close text and does not return
.useItem
	call InitializeBikeRodTextBox	; readies text box, even if empty (prevents npc facing downward on sprite reload bug)
	call UseItem				; uses the item stored in [wcf91]
								; this function DOES return from the bike with some edits to item_effects.asm
.cleanUp
	call CloseBikeRodTextBox	; closes text box
	ret

TextNoBikeRod:
	text_far _NoBikeRodText
	text_end

InitializeBikeRodTextBox: ; Gets everything setup to let you display text properly
	call EnableAutoTextBoxDrawing
	ld a, 1 ; not 0
	ld [hSpriteIndexOrTextID], a
	farcall DisplayTextIDInit
	ret

CloseBikeRodTextBox: ; Closes the text out properly to prevent glitches
	ld a,[hLoadedROMBank]
	push af
	jp CloseTextDisplay