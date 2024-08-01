	db DEX_YANMEGA ; pokedex id

	db  86,  76,  86,  95,  116
	;   hp  atk  def  spd  spc

	db BUG, FLYING ; type
	db 30 ; catch rate
	db 180 ; base exp

	INCBIN "gfx/pokemon/front/yanmega.pic", 0, 1 ; sprite dimensions
	dw YanmegaPicFront, YanmegaPicBack

	db GUST, QUICK_ATTACK, DOUBLE_TEAM, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   SOLARBEAM,    PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      SWIFT,        \
		 REST,         PSYWAVE,      SUBSTITUTE,   FLASH
	; end

	db BANK(YanmegaPicFront)
