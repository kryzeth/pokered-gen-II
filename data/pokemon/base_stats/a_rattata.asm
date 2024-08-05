	db DEX_A_RATTATA ; pokedex id

	db  30,  56,  35,  72,  25
	;   hp  atk  def  spd  spc

	db DARK, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp

	INCBIN "gfx/pokemon/front/a_rattata.pic", 0, 1 ; sprite dimensions
	dw A_RattataPicFront, A_RattataPicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     BLIZZARD,     RAGE,         THUNDERBOLT,  THUNDER,      DIG,          \
		 MIMIC,        DOUBLE_TEAM,  SWIFT,        SKULL_BASH,   REST,         \
		 SUBSTITUTE
	; end

	db BANK(A_RattataPicFront)