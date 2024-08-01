	db DEX_A_DUGTRIO ; pokedex id

	db  35,  100,  60, 110,  70
	;   hp  atk  def  spd  spc

	db GROUND, STEEL ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/a_dugtrio.pic", 0, 1 ; sprite dimensions
	dw A_DugtrioPicFront, A_DugtrioPicBack

	db SCRATCH, GROWL, DIG, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  ROCK_THROW,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
		 CUT
	; end

	db BANK(A_DugtrioPicFront)
