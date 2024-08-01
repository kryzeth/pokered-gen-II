	db DEX_A_PERSIAN ; pokedex id

	db  65,  60,  60, 115,  75
	;   hp  atk  def  spd  spc

	db DARK, DARK ; type
	db 90 ; catch rate
	db 148 ; base exp

	INCBIN "gfx/pokemon/front/a_persian.pic", 0, 1 ; sprite dimensions
	dw A_PersianPicFront, A_PersianPicBack

	db SCRATCH, GROWL, BITE, SCREECH ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     HYPER_BEAM,   PAY_DAY,      RAGE,         THUNDERBOLT,  THUNDER,      \
		 MIMIC,        DOUBLE_TEAM,  SWIFT,        SKULL_BASH,   REST,         \
		 SUBSTITUTE
	; end

	db BANK(A_PersianPicFront)
