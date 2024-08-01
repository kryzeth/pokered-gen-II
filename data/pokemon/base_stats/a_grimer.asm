	db DEX_A_GRIMER ; pokedex id

	db  80,  80,  50,  25,  40
	;   hp  atk  def  spd  spc

	db POISON, DARK ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/a_grimer.pic", 0, 1 ; sprite dimensions
	dw A_GrimerPicFront, A_GrimerPicBack

	db POUND, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    RAGE,         MEGA_DRAIN,   THUNDERBOLT,  \
	     THUNDER,      MIMIC,        DOUBLE_TEAM,  SELFDESTRUCT, FIRE_BLAST,   \
		 REST,         EXPLOSION,    SUBSTITUTE
	; end

	db BANK(A_GrimerPicFront)
