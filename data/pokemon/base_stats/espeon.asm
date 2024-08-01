	db DEX_ESPEON ; pokedex id

	db  65,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 197 ; base exp

	INCBIN "gfx/pokemon/front/espeon.pic", 0, 1 ; sprite dimensions
	dw EspeonPicFront, EspeonPicBack

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, THUNDERSHOCK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     PAY_DAY,      RAGE,         THUNDERBOLT,  THUNDER,      MIMIC,        \
		 DOUBLE_TEAM,  REFLECT,      SWIFT,        SKULL_BASH,   REST,         \
		 THUNDER_WAVE, SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(EspeonPicFront)
