	db DEX_A_RAICHU ; pokedex id

	db  60,  85,  50, 110,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 243 ; base exp

	INCBIN "gfx/pokemon/front/a_raichu.pic", 0, 1 ; sprite dimensions
	dw A_RaichuPicFront, A_RaichuPicBack

	db THUNDERSHOCK, GROWL, THUNDER_WAVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   PAY_DAY,      SUBMISSION,   SEISMIC_TOSS, \
	     RAGE,         THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, \
		 SUBSTITUTE,   FLASH,		 SURF
	; end

	db BANK(A_RaichuPicFront)
