	db DEX_WEAVILE ; pokedex id

	db  70, 120, 65,  125,  85
	;   hp  atk  def  spd  spc

	db DARK, ICE ; type
	db 45 ; catch rate
	db 179 ; base exp

	INCBIN "gfx/pokemon/front/weavile.pic", 0, 1 ; sprite dimensions
	dw WeavilePicFront, WeavilePicBack

	db QUICK_ATTACK, SHARPEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  SWIFT,        SKULL_BASH,   \
		 REST,         SUBSTITUTE,   CUT,          FLY
	; end

	db BANK(WeavilePicFront)
