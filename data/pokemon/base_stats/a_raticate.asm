	db DEX_A_RATICATE ; pokedex id

	db  75,  71,  70, 77,  50
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 116 ; base exp

	INCBIN "gfx/pokemon/front/a_raticate.pic", 0, 1 ; sprite dimensions
	dw A_RaticatePicFront, A_RaticatePicBack

	db TACKLE, TAIL_WHIP, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         THUNDERBOLT,  \
		 THUNDER,      DIG,          MIMIC,        DOUBLE_TEAM,  SWIFT,        \
		 SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db BANK(A_RaticatePicFront)
