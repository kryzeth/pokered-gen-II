	db DEX_LICKILICKY ; pokedex id

	db 110,  85,  95,  50,  95
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 180 ; base exp

	INCBIN "gfx/pokemon/front/lickilicky.pic", 0, 1 ; sprite dimensions
	dw LickilickyPicFront, LickilickyPicBack

	db WRAP, SUPERSONIC, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     \
		 HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
		 THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      MIMIC,        \
		 DOUBLE_TEAM,  ROCK_THROW,   FIRE_BLAST,   SKULL_BASH,   REST,         \
		 SUBSTITUTE,   CUT,          SURF,         STRENGTH
	; end

	db BANK(LickilickyPicFront)
