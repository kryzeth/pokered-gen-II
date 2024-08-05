	db DEX_H_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, GRASS ; type
	db 190 ; catch rate
	db 103 ; base exp

	INCBIN "gfx/pokemon/front/h_voltorb.pic", 0, 1 ; sprite dimensions
	dw H_VoltorbPicFront, H_VoltorbPicBack

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    RAGE,         THUNDERBOLT,  THUNDER,      \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      SELFDESTRUCT, \
		 SWIFT,        REST,         THUNDER_WAVE, EXPLOSION,    SUBSTITUTE,   \
		 FLASH
	; end

	db BANK(H_VoltorbPicFront)