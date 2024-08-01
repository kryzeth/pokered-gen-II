	db DEX_PERRSERKER ; pokedex id

	db  70, 110, 100,  50, 60
	;   hp  atk  def  spd  spc

	db STEEL, STEEL ; type
	db 90 ; catch rate
	db 148 ; base exp

	INCBIN "gfx/pokemon/front/perrserker.pic", 0, 1 ; sprite dimensions
	dw PerrserkerPicFront, PerrserkerPicBack

	db SCRATCH, GROWL, BITE, SCREECH ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     HYPER_BEAM,   PAY_DAY,      RAGE,         THUNDERBOLT,  THUNDER,      \
		 MIMIC,        DOUBLE_TEAM,  SWIFT,        SKULL_BASH,   REST,         \
		 SUBSTITUTE
	; end

	db BANK(PerrserkerPicFront)
