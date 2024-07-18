TypeEffects:
	;  attacker,     defender,     *=
	db WATER,        FIRE,         SUPER_EFFECTIVE
	db FIRE,         GRASS,        SUPER_EFFECTIVE
	db FIRE,         ICE,          SUPER_EFFECTIVE
	db GRASS,        WATER,        SUPER_EFFECTIVE
	db ELECTRIC,     WATER,        SUPER_EFFECTIVE
	db WATER,        ROCK,         SUPER_EFFECTIVE
	db GROUND,       FLYING,       NO_EFFECT
	db WATER,        WATER,        NOT_VERY_EFFECTIVE
	db FIRE,         FIRE,         NOT_VERY_EFFECTIVE
	db ELECTRIC,     ELECTRIC,     NOT_VERY_EFFECTIVE
	db ICE,          ICE,          NOT_VERY_EFFECTIVE
	db GRASS,        GRASS,        NOT_VERY_EFFECTIVE
	db PSYCHIC_TYPE, PSYCHIC_TYPE, NOT_VERY_EFFECTIVE
	db FIRE,         WATER,        NOT_VERY_EFFECTIVE
	db GRASS,        FIRE,         NOT_VERY_EFFECTIVE
	db WATER,        GRASS,        NOT_VERY_EFFECTIVE
	db ELECTRIC,     GRASS,        NOT_VERY_EFFECTIVE
	db NORMAL,       ROCK,         NOT_VERY_EFFECTIVE
	db NORMAL,       GHOST,        NO_EFFECT
	db GHOST,        GHOST,        SUPER_EFFECTIVE
	db FIRE,         BUG,          SUPER_EFFECTIVE
	db FIRE,         ROCK,         NOT_VERY_EFFECTIVE
	db WATER,        GROUND,       SUPER_EFFECTIVE
	db ELECTRIC,     GROUND,       NO_EFFECT
	db ELECTRIC,     FLYING,       SUPER_EFFECTIVE
	db GRASS,        GROUND,       SUPER_EFFECTIVE
	db GRASS,        BUG,          NOT_VERY_EFFECTIVE
	db GRASS,        POISON,       NOT_VERY_EFFECTIVE
	db GRASS,        ROCK,         SUPER_EFFECTIVE
	db GRASS,        FLYING,       NOT_VERY_EFFECTIVE
	db ICE,          WATER,        NOT_VERY_EFFECTIVE
	db ICE,          GRASS,        SUPER_EFFECTIVE
	db ICE,          GROUND,       SUPER_EFFECTIVE
	db ICE,          FLYING,       SUPER_EFFECTIVE
	db FIGHTING,     NORMAL,       SUPER_EFFECTIVE
	db FIGHTING,     POISON,       NOT_VERY_EFFECTIVE
	db FIGHTING,     FLYING,       NOT_VERY_EFFECTIVE
	db FIGHTING,     PSYCHIC_TYPE, NOT_VERY_EFFECTIVE
	db FIGHTING,     BUG,          NOT_VERY_EFFECTIVE
	db FIGHTING,     ROCK,         SUPER_EFFECTIVE
	db FIGHTING,     ICE,          SUPER_EFFECTIVE
	db FIGHTING,     GHOST,        NO_EFFECT
	db POISON,       GRASS,        SUPER_EFFECTIVE
	db POISON,       POISON,       NOT_VERY_EFFECTIVE
	db POISON,       GROUND,       NOT_VERY_EFFECTIVE
	db POISON,       BUG,          SUPER_EFFECTIVE
	db POISON,       ROCK,         NOT_VERY_EFFECTIVE
	db POISON,       GHOST,        NOT_VERY_EFFECTIVE
	db GROUND,       FIRE,         SUPER_EFFECTIVE
	db GROUND,       ELECTRIC,     SUPER_EFFECTIVE
	db GROUND,       GRASS,        NOT_VERY_EFFECTIVE
	db GROUND,       BUG,          NOT_VERY_EFFECTIVE
	db GROUND,       ROCK,         SUPER_EFFECTIVE
	db GROUND,       POISON,       SUPER_EFFECTIVE
	db FLYING,       ELECTRIC,     NOT_VERY_EFFECTIVE
	db FLYING,       FIGHTING,     SUPER_EFFECTIVE
	db FLYING,       BUG,          SUPER_EFFECTIVE
	db FLYING,       GRASS,        SUPER_EFFECTIVE
	db FLYING,       ROCK,         NOT_VERY_EFFECTIVE
	db PSYCHIC_TYPE, FIGHTING,     SUPER_EFFECTIVE
	db PSYCHIC_TYPE, POISON,       SUPER_EFFECTIVE
	db BUG,          FIRE,         NOT_VERY_EFFECTIVE
	db BUG,          GRASS,        SUPER_EFFECTIVE
	db BUG,          FIGHTING,     NOT_VERY_EFFECTIVE
	db BUG,          FLYING,       NOT_VERY_EFFECTIVE
	db BUG,          PSYCHIC_TYPE, SUPER_EFFECTIVE
	db BUG,          GHOST,        NOT_VERY_EFFECTIVE
	db BUG,          POISON,       SUPER_EFFECTIVE
	db ROCK,         FIRE,         SUPER_EFFECTIVE
	db ROCK,         FIGHTING,     NOT_VERY_EFFECTIVE
	db ROCK,         GROUND,       NOT_VERY_EFFECTIVE
	db ROCK,         FLYING,       SUPER_EFFECTIVE
	db ROCK,         BUG,          SUPER_EFFECTIVE
	db ROCK,         ICE,          SUPER_EFFECTIVE
	db GHOST,        NORMAL,       NO_EFFECT
	db GHOST,        PSYCHIC_TYPE, SUPER_EFFECTIVE
	db FIRE,         DRAGON,       NOT_VERY_EFFECTIVE
	db WATER,        DRAGON,       NOT_VERY_EFFECTIVE
	db ELECTRIC,     DRAGON,       NOT_VERY_EFFECTIVE
	db GRASS,        DRAGON,       NOT_VERY_EFFECTIVE
	db ICE,          DRAGON,       SUPER_EFFECTIVE
	db DRAGON,       DRAGON,       SUPER_EFFECTIVE
	db DARK,		 PSYCHIC_TYPE, SUPER_EFFECTIVE
	db DARK,		 GHOST,        SUPER_EFFECTIVE
	db DARK,		 FIGHTING,     NOT_VERY_EFFECTIVE
	db DARK,		 DARK,		   NOT_VERY_EFFECTIVE
	db DARK,		 FAIRY,		   NOT_VERY_EFFECTIVE	; Malevolent Darkness cannot defeat Benevolent Nature.
	db PSYCHIC_TYPE, DARK,		   NO_EFFECT
	db GHOST,		 DARK,		   NOT_VERY_EFFECTIVE
	db FIGHTING,	 DARK,		   SUPER_EFFECTIVE
;	db BUG,          DARK,		   SUPER_EFFECTIVE		; Bugs can't kill Darkness... Removed.
	db FAIRY,		 DARK,		   SUPER_EFFECTIVE		; Benevolent Nature beats Malevolent Darkness.
	db STEEL,		 ROCK,		   SUPER_EFFECTIVE
	db STEEL,		 ICE,		   SUPER_EFFECTIVE
	db STEEL,		 FAIRY,		   SUPER_EFFECTIVE
	db STEEL,		 STEEL,		   NOT_VERY_EFFECTIVE
	db STEEL,		 FIRE,		   NOT_VERY_EFFECTIVE
	db STEEL,		 WATER,		   NOT_VERY_EFFECTIVE
	db STEEL,		 ELECTRIC,	   NOT_VERY_EFFECTIVE
	db POISON,		 STEEL,		   NO_EFFECT
	db NORMAL,		 STEEL,		   NOT_VERY_EFFECTIVE
	db FLYING,		 STEEL,		   NOT_VERY_EFFECTIVE
	db ROCK,		 STEEL,		   NOT_VERY_EFFECTIVE
	db BUG,			 STEEL,		   NOT_VERY_EFFECTIVE
	db GRASS,		 STEEL,		   NOT_VERY_EFFECTIVE
	db PSYCHIC_TYPE, STEEL,		   NOT_VERY_EFFECTIVE
	db ICE,			 STEEL,		   NOT_VERY_EFFECTIVE
;	db DRAGON,		 STEEL,		   NOT_VERY_EFFECTIVE	; Why does Steel resist Dragon? Removed.
	db FAIRY,		 STEEL,		   NOT_VERY_EFFECTIVE	; Nature loses to Steel.
;	db FIGHTING,	 STEEL,		   SUPER_EFFECTIVE		; How can you punch through Steel? Removed.
	db ELECTRIC,	 STEEL,		   SUPER_EFFECTIVE		; Steel conducts Electricity, sounds cool. Implemented.
;	db WATER,		 STEEL,		   SUPER_EFFECTIVE		; Water makes metal rust. Makes Water too OP though?
	db FIRE,		 STEEL,		   SUPER_EFFECTIVE
	db FAIRY,		 FIGHTING,     SUPER_EFFECTIVE		; So Fairy is the power of nature.. and space. Space beats Fists.
	db FAIRY,		 DRAGON,	   SUPER_EFFECTIVE		; Nature beats Chaos (Dragons).
	db FAIRY,		 POISON,	   NOT_VERY_EFFECTIVE	; Nature loses to Poison.
	db FAIRY,		 FIRE,		   NOT_VERY_EFFECTIVE	; Nature loses to Fire.
	db DRAGON,		 FAIRY,		   NO_EFFECT			; Chaos has no effect against Nature?
	db FIGHTING,	 FAIRY,		   NOT_VERY_EFFECTIVE	; You can't punch Grass, so you can't punch Nature.
;	db BUG,			 FAIRY,		   NOT_VERY_EFFECTIVE	; Bugs are part of Nature? So they can't beat Nature? Removed.
	db BUG,			 FAIRY,		   SUPER_EFFECTIVE		; Bugs eat Nature. Reversed.
	db FAIRY,		 BUG,		   NOT_VERY_EFFECTIVE	; Nature should also lose to Bugs. Implemented.
	db POISON,		 FAIRY,		   SUPER_EFFECTIVE		; Poison destroys Nature.
	db GHOST,		 FAIRY,		   NOT_VERY_EFFECTIVE	; Ghost can't affect Nature? Fairy needed another Resist. Implemented.
;	This section is just a duplicate of defensive Poison matchups, for levitating Poison types.
	db GRASS,        POISON_LEV,	NOT_VERY_EFFECTIVE
	db FIGHTING,     POISON_LEV,	NOT_VERY_EFFECTIVE
	db POISON,       POISON_LEV,	NOT_VERY_EFFECTIVE
	db GROUND,       POISON_LEV,	NO_EFFECT
	db PSYCHIC_TYPE, POISON_LEV,	SUPER_EFFECTIVE
	db FAIRY,		 POISON_LEV,	NOT_VERY_EFFECTIVE
	db -1 ; end
