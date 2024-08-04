; this function handles quick-use of fishing and biking
TryRodBike::	; predef
	xor a					; clears the variable
	ld a,BICYCLE			; loads bike into a
	ld [wcf91],a			; loads a into item_use variable for UseItem
	ld [wPseudoItemID],a	; I think this is checked in the item_effects ItemUseBicycle script
	ld [wd11e],a			; loads a into item_name variable for GetItemName
	call GetItemName		; get the item name into de register
	call CopyToStringBuffer ; copy name to wStringBuffer
.tryForBike
	ld a,[wWalkBikeSurfState]	; loads walk/bike/surf state into a
	cp a,1						; check if already on bike (a=1)
	jr z,.useItem				; if true, skip to useitem (always allowed to get off bike, even if no bike in inventory)
	ld b,BICYCLE
	call IsItemInBag			; check if item in bag
	jr nz,.useItem				; if yes, skip to hasBike, else
	call EnableBikeShortcutText	; prepare to write text
	ld hl,TextNoBike			; load NoBike into hl for PrintText
	call PrintText				; prints the NoBike text
	jr .cleanUp					; close text and does not return
;.hasBike
;	farcall IsBikeRidingAllowed	; biking is always allowed, so always returns true anyways
;	jr c,.checkSurfing
;	call EnableBikeShortcutText	; I don't know why this is here if the text is not closed
;.checkSurfing
;	ld a,[wWalkBikeSurfState]	; loads walk/bike/surf state into a
;	cp a,2						; check if surfing (a=2)
;	jr nz,.checkCyclingRoad		; if not surfing
;	call EnableBikeShortcutText	; I don't know why this is here if the text is not closed
;.checkCyclingRoad
;	ld a,[wd732] ; cycling road
;	bit 5,a
;	jr z,.useItem				; if not on cycling road skip text
;	call EnableBikeShortcutText ; I don't know why this is here if the text is not closed
.useItem
	call EnableBikeShortcutText
	call UseItem				; uses the item stored in [wcf91]
								; this function DOES return with some edits to item_effects.asm
.cleanUp
	call CloseBikeShortcutText
	ret

TextNoBike:
	text_far _NoBicycleText
	text_end

EnableBikeShortcutText: ; Gets everything setup to let you display text properly
	call EnableAutoTextBoxDrawing
	ld a, 1 ; not 0
	ld [hSpriteIndexOrTextID], a
	farcall DisplayTextIDInit
	ret

CloseBikeShortcutText: ; Closes the text out properly to prevent glitches
	ld a,[hLoadedROMBank]
	push af
	jp CloseTextDisplay
