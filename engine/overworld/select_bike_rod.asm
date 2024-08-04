; this function handles quick-use of fishing and biking
TryRodBike::	; predef
	xor a					; clears the variable
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
	ld b,BICYCLE
	call IsItemInBag			; check if item in bag
	jr nz,.useItem				; if yes, skip to hasBike, else
	call EnableBikeShortcutText	; prepare to write text
	ld hl,TextNoBike			; load text for NoBike into hl for PrintText
	call PrintText				; prints the NoBike text
	jr .cleanUp					; close text and does not return
.useItem
	call EnableBikeShortcutText	; readies text box
	call UseItem				; uses the item stored in [wcf91]
								; this function DOES return with some edits to item_effects.asm
.cleanUp
	call CloseBikeShortcutText	; create an empty textbox that auto-closes
	ret							; without it, npc sprites are reloaded, facing downwards for a second or two.

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