	db DEX_SNEASEL ; pokedex id

	db  55,  95,  55, 115,  75
	;   hp  atk  def  spd  spc

	db DARK, ICE ; type
	db 60 ; catch rate
	db 86 ; base exp

	INCBIN "gfx/pokemon/front/sneasel.pic", 0, 1 ; sprite dimensions
	dw SneaselPicFront, SneaselPicBack

	db QUICK_ATTACK, SHARPEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  SWIFT,        SKULL_BASH,   \
		 REST,         SUBSTITUTE,   CUT,          FLY
	; end

	db BANK(SneaselPicFront)
