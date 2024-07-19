; Yellow entry format:
;	db trainerclass, trainerid
;	repeat { db partymon location, partymon move, move id }
;	db 0

SpecialTrainerMoves:
	db BROCK, 1
	; Geodude: Tackle, Defense Curl
	; Onix: Tackle, Screech, Bind, Rock Throw
	db 2, 3, ROCK_THROW
	db 0

	db MISTY, 1
	;
	db 2, 4, BUBBLEBEAM
	db 0
;;; I messed up some stuff after this point, miscalculated which moves were replaced on level up
;;; so the moveset comments do not match the game, but I'll come back to this later
;;; since I plan on adding more moves and more Pokemon to the game first.
	db LT_SURGE, 1
	; Voltorb: Tackle, Screech, Sonic Boom, ThunderShock
	; Pikachu: Thundershock, Growl, Thunder Wave, Quick Attack
	; Raichu: Thunderbolt, Body Slam, Growl, Quick Attack
	db 3, 1, THUNDERBOLT
	db 3, 2, BODY_SLAM
	db 0

	db ERIKA, 1
	; Tangela: Constrict, Bind, Mega Drain, Vine Whip
	; Victreebel: Razer Leaf, Wrap, Poison Powder, Sleep Powder
	; Vileplume: Petal Dance, Poison Powder, Stun Spore, Sleep Powder
	db 1, 3, MEGA_DRAIN
	db 2, 1, RAZOR_LEAF
	db 3, 4, PETAL_DANCE
	db 0

	db KOGA, 1
	; Koffing: Tackle, Smog, Sludge, Smokescreen
	; Muk: Sludge, Pound, Disable, Poison Gas
	; Weezing: Tackle, Smog, Sludge, Smokescreen... again
	; Venomoth: Leech Life, Psychic, Stun Spore, Toxic
	db 4, 1, LEECH_LIFE
	db 4, 2, PSYCHIC_M
	db 4, 4, TOXIC
	db 0

	db BLAINE, 1
	; Arcanine: Flamethrower, Agility, Roar, Take Down
	; Nintales: Fire Spin, Flamethrower, Confuse Ray, Quick Attack
	; Rapidash: Fire Spin, Growl, Tail Whip, Stomp
	; Magmar: Fire Blast, Rock Throw, Confuse Ray, Fire Punch
	db 1, 3, FLAMETHROWER
	db 1, 4, TAKE_DOWN
	db 2, 4, QUICK_ATTACK
	db 3, 2, GROWL
	db 4, 1, FIRE_BLAST
	db 4, 2, ROCK_THROW
	db 0

	db SABRINA, 1
	; Kadabra: Psychic, Recover, Teleport, Confusion
	; Mr Mime: Confusion, Barrier, Light Screen, Doubleslap
	; Venomth: Psybeam, Stun Spore, Leech Life, Disable
	; Alakazam: Reflect, Psychic, Recover, Psywave
	db 1, 3, FLASH
	db 3, 3, LEECH_LIFE
	db 4, 4, PSYWAVE
	db 0

	db GIOVANNI, 3
	; Rhyhorn: Horn Drill, Fury Attack, Stomp, Tail Whip
	; Dugtrio: Slash, Sand Attack, Dig, Growl
	; Nidoqueen: Fury Swipes, Bite, Body Slam, Poison Sting
	; Nidoking: Horn Drill, Fury Attack, Thrash, Focus Energy
	; Rhydon: Horn Drill, Horn Attack, Stomp, Fissure
	db 2, 3, DIG
	db 5, 4, FISSURE
	db 0

	db LORELEI, 1
	db 1, 1, BUBBLEBEAM
	db 2, 3, ICE_BEAM
	db 3, 1, PSYCHIC_M
	db 3, 2, SURF
	db 4, 3, LOVELY_KISS
	db 5, 3, BLIZZARD
	db 0

	db BRUNO, 1
	db 1, 1, ROCK_SLIDE
	db 1, 2, SCREECH
	db 1, 4, DIG
	db 2, 3, FIRE_PUNCH
	db 2, 4, DOUBLE_TEAM
	db 3, 1, DOUBLE_KICK
	db 3, 2, MEGA_KICK
	db 3, 4, DOUBLE_TEAM
	db 4, 1, ROCK_SLIDE
	db 4, 2, SCREECH
	db 4, 4, EARTHQUAKE
	db 5, 2, KARATE_CHOP
	db 5, 3, STRENGTH
	db 0

	db AGATHA, 1
	db 1, 2, SUBSTITUTE
	db 1, 3, LICK
	db 1, 4, MEGA_DRAIN
	db 2, 2, TOXIC
	db 2, 4, LEECH_LIFE
	db 3, 2, LICK
	db 4, 1, WRAP
	db 5, 2, PSYCHIC_M
	db 0

	db LANCE, 1
	db 1, 1, DRAGON_RAGE
	db 2, 1, THUNDER_WAVE
	db 2, 3, THUNDERBOLT
	db 3, 1, BUBBLEBEAM
	db 3, 2, WRAP
	db 3, 3, ICE_BEAM
	db 4, 1, WING_ATTACK
	db 4, 2, SWIFT
	db 4, 3, FLY
	db 5, 1, BLIZZARD
	db 5, 2, FIRE_BLAST
	db 5, 3, THUNDER
	db 0

	db RIVAL3, 1
	db 1, 3, EARTHQUAKE
	db 2, 4, KINESIS
	db 3, 4, LEECH_SEED
	db 4, 1, ICE_BEAM
	db 5, 1, CONFUSE_RAY
	db 5, 4, FIRE_SPIN
	db 6, 3, QUICK_ATTACK
	db 0

	db RIVAL3, 2
	db 1, 3, EARTHQUAKE
	db 2, 4, KINESIS
	db 3, 4, LEECH_SEED
	db 4, 1, THUNDERBOLT
	db 5, 1, ICE_BEAM
	db 6, 2, REFLECT
	db 6, 3, QUICK_ATTACK
	db 0

	db RIVAL3, 3
	db 1, 3, EARTHQUAKE
	db 2, 4, KINESIS
	db 3, 4, LEECH_SEED
	db 4, 1, CONFUSE_RAY
	db 4, 4, FIRE_SPIN
	db 5, 1, THUNDERBOLT
	db 6, 1, AURORA_BEAM
	db 6, 3, QUICK_ATTACK
	db 0

	db -1 ; end
