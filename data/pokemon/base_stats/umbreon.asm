	db DEX_UMBREON ; pokedex id

	db  95, 65,  110,  65, 130
	;   hp  atk  def  spd  spc

	db DARK, DARK ; type
	db 45 ; catch rate
	db 198 ; base exp

	INCBIN "gfx/pokemon/front/umbreon.pic", 0, 1 ; sprite dimensions
	dw UmbreonPicFront, UmbreonPicBack

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, EMBER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  FLAMETHROWER,  \
		 HYPER_BEAM,   PAY_DAY,      RAGE,         MIMIC,        DOUBLE_TEAM,  \
		 REFLECT,      FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         \
		 SUBSTITUTE,   STRENGTH
	; end

	db BANK(UmbreonPicFront)
