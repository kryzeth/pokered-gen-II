	db DEX_H_ARCANINE ; pokedex id

	db  95, 115,  80,  90,  80
	;   hp  atk  def  spd  spc

	db FIRE, ROCK ; type
	db 75 ; catch rate
	db 213 ; base exp

	INCBIN "gfx/pokemon/front/h_arcanine.pic", 0, 1 ; sprite dimensions
	dw H_ArcaninePicFront, H_ArcaninePicBack

	db ROAR, EMBER, LEER, TAKE_DOWN ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         DRAGON_RAGE,  DIG,          TELEPORT,     MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        SKULL_BASH,   \
		 REST,         SUBSTITUTE
	; end

	db BANK(H_ArcaninePicFront)
