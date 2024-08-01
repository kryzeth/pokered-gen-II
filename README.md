# Pokémon Red and Blue [![Build Status][ci-badge]][ci]

This was originally a disassembly of Pokémon Red and Blue.

Now that I've reached the point where all the base game and battle engine changes have been completed, I can begin working on the primary point of this project.
First and foremost, this mod is for me above all. I want my version of Pokemon Red to be the ideal, perfect version of Red for me. If other people can enjoy it too, then that's great!
But I will be making most executive decisions entirely with arbritrary and biased reasoning, based on nothing but personal preference.
For example: I will be including pokemon from future generations, but only the ones I like, and only the ones I feel would be a good fit for gen 1 mechanics.
			This is why I have included multiple alolan and hisuian Pokemon, but left out others (A_Sandslash, G_Rapidash, G_Slowpoke lines).
			This is also why I have not included the Phsyical/Special split; I would just play Let's Go, or hack FireRed/LeafGreen to include that.
Implemented features so far:
	Replaced Red with Green
	Running Shoes
	Bag Sorting Option
	Move Relearner
	Move Deleter
	Prompt to use Cut/Surf/Strength
	Permanent Cut tree removal
	Added all prior evolution moves to the learnsets of their evolved forms.
	Added Dark, Steel, and Fairy types (and changed respective Pokemon types)
	Changed Ghost to special, and implemented Dark as physical. Steel is physical and Fairy is special, as expected.
	Buffed Poison, Burn, and Leech Seed damage from 1/16 to 1/8 (as in all future games)
	Removed Water Gun TM from Mt Moon; added Flamethrower TM as Blaine reward; moved Fire Blast TM to Pokemon Mansion; moved Blizzard to Seafoam Islands
	Replaced Bide TM with Rock Throw in Brock's gym. Removed Bide in its entirety, and replaced its effect functionality with Fly/Dig separate invulnerability.
	Swift can't hit through Fly/Dig anymore; Earthquake can hit through Dig; Gust can hit through Fly.
	Improved walkability on various cities and routes, moved a few cut trees around.
	Added a cuttable tree near the first Snorlax blockade, allowing Rock Tunnel and Snorlax skip (without using Trainer-Fly glitch)
	Added jumpable ledge to Cycling Road, near Fly house, allowing for second Snorlax skip.
	Removed bike enforcement on Cycling Road (can jump off at any time), and the forced downward movement.
	Implemented a pseduo-levitate ability, and granted it to various Poison types who appear to levitate/fly, making them immune to Ground.
	Added 50+ new pokemon, mainly evolutions and regional forms of Kanto pokemon, but also some Johto pokemon (most of which appeared on Mt Silver and GSC Kanto... plus Yanma/Yanmega)

Features that are not, and will not be implemented:
	Physical/Special split, as previously mentioned. That would change Kanto too much for my taste, and I'm sure there's another RBY mod that does this.
		If there isn't, then it's simple enough to add, just by following the PokeRed Disassembly guide. That's what I've done for most of this project.
	No baby pokemon. In this generation, and especially with my learnset changes, they would add nothing to their evolutions, apart from possibly being available earlier.
		I still believe they would be a waste of a Pokemon slot, and there are only about 100 slots available (over 50 of which I have already used up with my personal picks)
	No beta build pokemon or fakemon. The Kanto Expansion Pak already does that, and I don't care about any of the fakemon enough to add them to my own pack.

PS. I stumbled upon Pokemon Red++ while looking for other gen 1 romhacks, and noticed that they have very similar changes to what I plan to do.
	Although they included a slightly different set of Pokemon, and I don't plan on adding any baby Pokemon.

The original description from PokeRed-Gen-II fork below:

It builds the following ROMs:

- Pokemon Red (UE) [S][!].gb `sha1: ea9bcae617fdf159b045185467ae58b2e4a48b9a`
- Pokemon Blue (UE) [S][!].gb `sha1: d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
- BLUEMONS.GB (debug build) `sha1: 5b1456177671b79b263c614ea0e7cc9ac542e9c4`
- dmgapae0.e69.patch `sha1: 0fb5f743696adfe1dbb2e062111f08f9bc5a293a`
- dmgapee0.e68.patch `sha1: ed4be94dc29c64271942c87f2157bca9ca1019c7`

To set up the repository, see [**INSTALL.md**](INSTALL.md).


## See also

- [**Wiki**][wiki] (includes [tutorials][tutorials])
- [**Symbols**][symbols]

You can find us on [Discord (pret, #pokered)](https://discord.gg/d5dubZ3).

For other pret projects, see [pret.github.io](https://pret.github.io/).

[wiki]: https://github.com/pret/pokered/wiki
[tutorials]: https://github.com/pret/pokered/wiki/Tutorials
[symbols]: https://github.com/pret/pokered/tree/symbols
[ci]: https://github.com/pret/pokered/actions
[ci-badge]: https://github.com/pret/pokered/actions/workflows/main.yml/badge.svg
