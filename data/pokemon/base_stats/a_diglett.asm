	db DEX_A_DIGLETT ; pokedex id

	db  10,  55,  30,  90,  45
	;   hp  atk  def  spd  spc

	db GROUND, STEEL ; type
	db 255 ; catch rate
	db 81 ; base exp

	INCBIN "gfx/pokemon/front/a_diglett.pic", 0, 1 ; sprite dimensions
	dw A_DiglettPicFront, A_DiglettPicBack

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  \
	     ROCK_THROW,   REST,         ROCK_SLIDE,   SUBSTITUTE,	 CUT
	; end

	db BANK(A_DiglettPicFront)
