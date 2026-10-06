                             Baldur's Gate II
		    Solaufein Romance Modification Pack
		  Westley Weimer <weimer@cs.berkeley.edu>
                             \/ Release 104 \/

                             http://weidu.org

		Table of Contents
		~~~~~~~~~~~~~~~~~
I. 	About
II. 	Installation
III.    Component 1:    Solaufein
IV.	Known Bugs
V.	Thanks
VI. 	FAQ (Spoilers)
VII.	Changes


		Section I. About
		~~~~~~~~~~~~~~~~
The Solaufein Romance Mod Pack adds the following component to BGII: 

(01) Solaufein of Ust Natha becomes an NPC who can join your party.
        He's a Chaotic (Good/Neutral) Drow fighter/mage. 
        He has "plenty" of dialogue.
        He has a number of interjections in common SoA encounters. 
        He will banter twice with each other party member. 
        He will attempt to romance the PC regardless of race,
                gender or other loved ones. If you don't like it,
                just tell him to go away. 
        He can still Dimension Door (don't abuse it!).
        He can be abducted by Bodhi (watch out!). 
      Three Solaufein-specific challenges (one requires ToB).
      Two Solaufein-specific rewards. 
      Auto-Buff Spellcaster scripts. 


		Section II. Installation
		~~~~~~~~~~~~~~~~~~~~~~~~
BGII is required. ToB is optional but recommended. The Sola Romance will
install correctly over (or without) the Ascension Mod. It should
work fine with any WeiDU mod. See the webpage for details. 

Unzip the main ZIP file into your BGII main directory. This is normally:
        C:\Program Files\Black Isle\BGII - SoA\

Run (click on) "Setup-Solaufein.exe". 

First, pick your favorite language. Currently available: 
  American English 
  a German translation by Falk Swoboda 
  an Italian translation by Luciana Boscaratto
  a French translation by Ly Meng, Laurent Duvernet, Cocobard and Banshee
  a Portuguese translation by Allyonora
  a Polish translation by Damian Staniszewski
  a Russian translation by Serdrick & Aerie.ru

Then choose which components you would like to install. You may always
uninstall them later by re-running "Setup-Solaufein.exe". 

You do *not* need to start a new game to take advantage of anything you
installed. 

The components should install correctly for international players who have
both DIALOG.TLK and DIALOGF.TLK. 


		Section III. Solaufein 
		~~~~~~~~~~~~~~~~~~~~~~
I wrote the Solaufein Romance for two reasons. One was that I wanted to get
a better handle on Infinity Engine scripting. Could it really be that hard
to write a non-buggy romance? The second was a minor rebellion against the
Bioware "romance = therapy" and "no one has a backbone" notions. I
personally have trouble with the Aerie romance because she's so weak and
the Viconia romance because she lies. Anomen is sufficiently annoying at
the beginning that it is amazing anyone will sit through his romance to the
end (he does get some good dialog at the end, though). 

So although Solaufein is "an Underdark Heathcliff, brooding and comely", he
shouldn't require babying. He mostly asks philosophy questions. The BGII
dialogue medium does not really lend itself to exploring such issues
fully. You should imagine that your character and Sola actually have
detailled discussions that aren't made explicit. Similarly, you may find at
some point that you want to say something that isn't an option in the
dialogue. At this point you should realize two things. One is that you can
write to me and I'll add your response to the dialog tree. The other is
that you must actually care about the issues involved for this to be
happening, so the romance has attained its goal of being interesting. 

Somewhat like the Anomen (or later Viconia) romance, your dialogues will
help guide Solaufein's morality and will determine the outcome of later
events.

Solaufein currently has two pieces of banter with each of the other NPCs. 
His banter does not depend on SoA or ToB. 

Some minor spoilers for the Underdark occur in this section.

Solaufein's Background Information:

    When asked about his past, SOLAUFEIN adds little beyond what you
    already know. As one of a small number of good Drow he will always be
    an outcast. Solaufein prefers not to speak of his old life in Ust
    Natha. The memory of the time he shared with Phaere before she was
    turned against him is too poignant and the memory of her eventual
    hatred and death is too cruel. Still, Solaufein will admit to being
    the leader of the Male Fighters' Guild in Ust Natha. He is also a
    magician of no small talent. When Phaere was taken from him he became a
    fervent (but secret) follower of Eilistraee Silverhair. He can be given
    to brooding melancholy. 

[ Minor spoilers for the Underdark follow: ] 

You must play through the Drow City, spare Solaufein's life when
Phaere asks you to kill him and receive his phony eggs. Solaufein can be
found EITHER:
  (1) just outside of Ust Natha         (AR2100)
  (2) just North and West of Elhan      (AR2500)
  (3) using the Fate Spirit in ToB      (pocket plane)
He will appear in whichever of these you visit first after completing the
Ust Natha quests. This is normally (1), but if you are adding Sola into an
existing game where you have already done the underdark you can find him at
(2). 

When you find Solaufein in Ust Natha you may ask him to go to the surface
and meet you there later instead. If you take him with you in the Underdark
he will leave the party briefly to teleport past Elhan's patrols at the
Underdark Exit. You can find him again just north and west of Elhan. 

If your character is Evil, Solaufein begins Chaotic Neutral. Otherwise he
starts out Chaotic Good.

Solaufein will be abducted by Bodhi regardless of whether you are romancing
him or how far you have gotten in the romance. She just thinks he's neato.
You should too. Solaufein's abduction has no effect on your other romances:
Bodhi will still abduct Viconia, Jaheira, Anomen or Aerie as appropriate.
Unlike the others, however, the Undead Solaufein is actually quite
powerful. Good luck. 

Many people find the Eclipse challenge difficult. It is optional. You can
tell Solaufein that his dream is probably nothing and they won't come to
fight you. You can also say this to him when "manually" by talking to him
explicitly, so even if you are already past the point with the dream you
can still avoid the fight. 

Roleplaying Note: The third Solaufein challenge (the Eclipse party) has
some "humorous" dialogue in the spirit of Bondari and the Spectator
Beholder. If you don't like that sort of thing just immediately ask them to
"be serious" and they'll stop. Currently you will be warned about the
Eclipse fight during any morning/day after you have killed Sendai or
Abazigal. The actual fight will take place the next time you are outside or
in a forest at night after the warning. If you are not interested in
battles, tell Solaufein that you don't want to fight and the battle will
be skipped. [ Note: the Eclipse party may cast "Nature's Beauty" on you, a
7th level Druid spell that blinds permanently with no saving throw. The
blindness will not "wear off" but you can get rid of it with "Dispel
Magic". This spell is quite useful in general, consider having your own
druids memorize it. ] 

Cannot wait for the Underdark? You can just create Solaufein out of whole
cloth:
	CLUAConsole:CreateCreature("Sola17")	// 1750000 XP
	CLUAConsole:CreateCreature("Sola15")	// 1500000 XP
	CLUAConsole:CreateCreature("Sola12")	// 1250000 XP
	CLUAConsole:CreateCreature("Sola10")	// 1000000 XP
	CLUAConsole:CreateCreature("Sola7")	//  750000 XP
	CLUAConsole:CreateCreature("Sola5")	//  500000 XP

However, the continuity will be a little weaker.

Q: How can I speed up the Solaufein Romance?

A1: Usually: CLUAConsole:SetGlobal("SolaTimer","GLOBAL",0)
If that's not doing anything then some other event has to occur before it
can advance. Try resting. If all else fails, use the chart below. 

A2: If you talk to Solaufein directly (with the Talk icon) he will say "I
have nothing to say with you right now), but his timer will be reset to
about 5 seconds. He'll talk to you soon if he has anything to say. 

A3: The "real time" timers used in BGII romances are related to the frame
rate in your baldur.ini file. If you set the frame rate to 60 the romance
chats will occurs twice as fast (as measured by your real-world wall
clock). 

Q: How can I stop the Solaufein Romance? 

A: Talk to Solaufein directly and you will be given the option of turning
him down gently. You may do this at any time if you start to feel
uncomfortable. In addition, there are (obvious) dialogue choices that will
turn off the romance. 

Q: How can I speed up the Solaufein inter-party banter? 

A1: Usually: CLUAConsole:SetGlobal("SolaBanter","GLOBAL",0)
Note that it may still take a few seconds before something happens as
Solaufein selects one of the party members at random. Note that Sola will
not banter if someone who can join the party is nearby but not actually in
the party.

Q: Why should I use these auto-buff spellcaster scripts?

A: They buff very rapidly, saving you the trouble of clicking here and
there for hours. This means that you are more likely to actually use spell
protections, which will help you to get the full benefit out of characters
like Solaufein. 

Q: What spells are used by the auto-buff scripts?

A: Stoneskin, Strength, Shield, Pro-Fire, Pro-Elec, Pro-Acid, Pro-Cold,
Spirit Armor, Resist Fear, Remove Fear, Chaotic Commands, Death Ward,
Pro-Magic-Energy, Ghost Armor, Pro-Lightning, Armor-Faith, Minor
Spell-Defl, Minor Spell-Turn, Spell-Defl, Spell-Turn, Blur, Pro-Evil,
Mirror Image, Invis, Barkskin, Res-Fire, Pro-Fire, Regenerate, Archons,
Imp-Haste, Free-Action, FS:Red, FS:Blue, Spell Trap, Phys-Mirror, Blade
Barrier, Draw-Holy-Might, Chant, Def-Harmony, Bless, Neg-Plane-Pro, Melf
Met. 

		Section IV. Known Bugs
		~~~~~~~~~~~~~~~~~~~~~~
** The Sola mod is reported to break if you cheated in the Girdle of Gender
   and experimented with it.
        Solution: *Don't do that*. 

** You may use Boo Two's "Return to Party" ability on non party members. Do
   _not_ do that. I cannot find a way to make sure that it is only used on
   PCs, so you'll have to police yourself (or risk losing her!). 
	Cause: Weimer lacks knowledge. 

** Apparently it is possible to spawn a huge batch of Boo Twos.
        Cause: I have no idea. Treat her nicely. 

** Solaufein's dialogue should have more variety in its "yes, go on"
   responses.
        Cause: Weimer is lazy. 

** The Moonray will not heal the party member wearing the Cloak of Mirroring. 
        Cause: Game Engine bug. Sorry!

Please report any bugs you encounter to weimer@cs.berkeley.edu. 

If you think any of the dialogue is weak, let me know. Without feedback
it's hard to tell. :-)


		Section V. Thanks
		~~~~~~~~~~~~~~~~~
The Solaufein Romance was written using a number of excellent utilities:

	Near Infinity
	Infinity Engine Editor Pro
	Infinity Explorer

I recommend them all. You should be able to find them all from
http://www.teambg.net. I do not recommend the TeamBG Dialog Utility or the
TeamBG Mass Converter. In fact, my disappointment with them led me to
create my own dialogue and installation utilities. See

        http://weidu.org

Solaufein's poetry is excerpted from the works of the following poets (and
quite a few others):
	W. H. Auden		("O plunge your hands in water ...")
	Thomas O. Davis		("Come in the evening, ...")
	Thomas Moore		("Long, lond be my heart ...")
	Arthur Rimbaud		("I have seen the sunset, ...")
	Thomas Tickell		("I hear a voice you cannot hear ...")
	William Wordsworth	("The sounding cataract ...")
        Percy Shelley           ("Favour my solemn song ...")
        Robert Frost            ("I have been one acquainted with ...")

If you like any of it, check them out!

Solaufein's party banter (i.e., the things he says to the other NPCs) was
blatantly adapted from famous quotations (e.g., King, Emerson, Gibran). 
If you see anything in it that looks good, assume I didn't write it. If you
see anything about turnips or nether scrolls, blame it on me. 

Solaufein's picture was taken from the old Lady Nightshade archive. If you
have a better one, let me know: I maintain a gallery of alternate Sola
portraits that work with this mod at the main Sola webpage.

Thanks to David Gaider for the Dimension Door spell and the lovely
Ascension Mod. 

Thanks go out to my worthy beta testers:
	Mike Clark
	Joe Mulei
	Nancy Wallace
        Laura Uerling (special thanks for the GC tactics)

And to my lovely foreign language support team:
        Falk Swoboda: Double-Duty German Translation
        Luciana Boscaratto: Italian Translation 
        Ly Meng, Archange de la Redemption, Cocobard: French Translation
        Laurent Duvernet, Artemidore: French Translation
        Banshee: French Translation
        Allyonora: Portuguese Translation
        Damian Staniszewski: Polish Translation
        Serdrick & Aerie.ru: Russian Translation

Special thanks go out to those helpful ones who helped to translate the
poetry for the German edition: 
      Elanor
      Gala
      Dyara
      Knuddel
      Medinilla (we'll never forget you)
      Rote Zora
      Siegmund
      Veldan
      Malakai

Thanks to VDH for suggesting the name "Eclipse Vengeresse" for the Eclipse
Avenger in the French version. 

And to those other initial people worthy enough to report bugs or suggest
features:
        Tina Schäfer
        starrie
        Maria Kretschy 
        Dyara
        Shayla Dormyr
        Gwion 
        Sophia Ahmed

And to the loyal opposition, for dialogue advice and ideas (and for keeping
me honest):
        Jason Compton

And to my banter beta testers:
        Jason Compton
        Shayla Dormyr
        Falk Swoboda
        Kreese Rasvar
        Katherine F.

Thanks to Rob Scott for the Sola ToB epilogue ideas. Thanks to Al Bowers,
Scarlet Tang, Lisa Jonte, Sphira and Afi for extra Solaufein conversations. 


		Section VI. FAQ (Spoilers)
		~~~~~~~~~~~~~~~~~~~~~~~~~~
This section contains spoilers for the Solaufein romance and additional
tactical encounters. 

Q: With whom will Solaufein have interjections (i.e., extra dialogue with
another actor that need not involve the PC)? 

Promenade:      Galoomp the Bookseller, Lady Yuth, Belmin Elf-Hater, 
Graveyard:      Pai'Ni
Docks:          Priest of Oghma
Gates:          Flydian
Trademeet:      Khellon
Grove:          Faldorn
Windspear:      Illusory Ogre, Samia, Grancor (Wolf Trap), Firkraag, Conster
De'Arnise:      Captain Arat
Government:     Staked Viconia, Delon, Tolgerias
Umar:           Madulf, Hiding Valygar
                (A book merchant will have a special book to sell to _you_
                 if you are far along romancing Sola.)
Temple Ruins:   Shade Lord
Sphere:         Solamnic Knight 
Sewers:         Gaal
Bridge:         Raelis
Mind Flayers:   Simyaz, Slave Leader
Overland:       Drizzt
Suldenesselar:  Elven Kids, Demin, Leaflord, Raamilat
Hell:           Wraith Sarevok

Don't read the rest of this section unless you are stuck or you have
already completed the Solaufein romance. Seriously. It'll be so much better
if you don't know what will happen or what is important. 


*SPOILERS BELOW*

Q: I'm getting slaughtered by the Revenge Spiders. What's up with that?

A1: I tried to make this an actually difficult fight. It's not that the
enemies are overly powerful ... it's that they use half-decent tactics
and unfamiliar attacks. Watch out for that strength drain. As the dialogue
suggests, killing one makes the others stronger. In particular, killing one
will Haste and heal another. So it behooves you to attack them one at a
time. It's also worth noting that they try to go after the party member
with the worst AC. Perhaps you can distract them with summoned fodder or
invisible party members? Finally, they are somewhat resistant to physical
blows. 

A2: The ever-delightful Laura Uerling offers this tactical advice:

    As for tactics, one reason that it was so hard to beat them was that it
  took me a while to figure out what *their* tactics were. I'd scuttle my
  wimpy mages off to the side to keep them out of harm's way only to have
  the RSs make a beeline for them. At first they seemed to be going after
  spellcasters, so I made sure Aerie and Nalia didn't cast spells. No dice;
  the RSs still went after them. By the end, I was convinced that they go
  after the party members in ordering of increasing hit points. Am I right?
  [ No, they go after the party member with the worst AC. -Wes ] 
    One of the problems with this battle is that it occurs rather
  unexpectedly right after the party sleeps, and you don't have time to
  cast many time-limited protective spells before they show up.
    What finally did work was casting haste and free-action on as many
  characters as I could. (I had the RoFA and Keldorn's armor, which helped)
  I had my spellcasters casting 'safe' area affect spells asap, since after
  the first couple of reloads I resigned myself to losing them quickly.
  Holy Smite was *very* effective, and Chain Lightning helped some too.
  Unfortunately I didn't have a mage that could cast A-D's HW, or I would
  have tried that. Summons are useless, since they get caught in the Web
  and are completely ignored by the RSs. Other than that, since they could
  heal themselves, I treated them like Greater Werewolves; I ganged up on
  them one-at-a-time and whacked them to death. Not pretty, but it worked.


Q: All of my characters except Solaufein disappeared!

A: That's normal, check the dialogue. Sola must face that challenge alone. 
They'll come back when he "wins". 


Q: I'm getting slaughtered by Archryssa. What's up with that? 

A: With practice she's not all that difficult. But since you can only use
Sola (and thus cannot rely on Korgan's axe or Keldorn's dispelling or
Jaheira's elementals or whatnot), you must be able to use Sola effectively.
I think it's a fun challenge. Anyway, don't flee (and try not to become
confused or afraid or invisible) -- if you leave for too long she'll just
teleport you back and heal. Distract the Revenge Spider somehow (summoned
monster?) and kill the RS with magic from afar. She'll summon some animals
and skeleton warriors -- you should be able to handle it. When she runs out
of Ironskins the first time she gets a "second wind": more ironskins and an
another aura of flaming death, plus another Spider. Wait her out. When you
do go in for the kill, do it fast.  If you take too long she'll cast
Sanctuary and Heal herself.


Q: I still cannot handle Archryssa. Any stronger hints?

A: This sequence worked for me: Stoneskin, Blur, Blur, Mirror Image,
Invisible Stalker, Flame Arrow (Revenge Spider), Acid Arrow (RS), Magic
Missile (RS), kill RS, wait out Archryssa. Tenser's Transformation.
Lowering the Difficulty Level to the easiest setting will prevent her from
getting a "second wind". Here's what Gwion did:

   I just love the wand of fire and give one to every mage. Sola even came
   with one... He had the ring of free action and just wandered around,
   happily being teleported back if he strayed too far, until the web
   evaporated. Then he switched to the boots of speed and started using the
   fire column effect on the spider, roasting any other summons in the
   flames. It took around 8 shots per spider, he waited until Archryssa's
   second wind, then killed the other one, switching back to the ring for
   web avoidance first. Daystar's sunray nearly killed off the skeletons.
   Sola finished them off easily, he'd been relying on his magic resistance
   (plus this rather nice +10 amulet we picked up in Ust Natha) to ignore
   Archryssa's effects and she did almost nothing to him - easily healed.
   When the summons were gone, he reached into his pack and pulled out a
   Breach scroll, which cheerfully stripped Archryssa's protections away.
   Then he just hit her with the Flail of Ages (Daystar in the off-hand)
   until she died. She did hide and heal twice, but he just waited for her
   to come out again, then attacked her.


Q: Undead Solaufein keeps ending my life. Why isn't Solaufein this powerful
when he's on my side?

A: He is this powerful on your side. Actually, he's more powerful on your
side (if you know how to use him). If you're finding Undead Solaufein to be
too difficult, you're probably not buffing enough (and you're not used to
having Solaufein buffed up -- the Undead Solaufein buffs quite a bit before
the battle with spells like Improved Haste and Protection from Fire, and
I'm sure you noticed the Fireshields and whatnot). His triple-threat Spell
Immunities will prevent you from using Dispel Magic, True Sight, Sunray or
False Dawn on him. As is so often the case in these tales, he knows how to
use Protection from Magic Weapons. You can't hide for too long, or he'll
use his Dimension Door ability to head back to Player1. However, If you set
the difficulty level to "Easiest" he won't get his "second wind". My best
advice: try to wait it out for 14 rounds until his spell immunities wear
off. If you have a high level cleric, Turn him. 


Q: He's still killing me. That Lolth stuff isn't helping. 

A: Actually, the Lolth stuff may be helping, since Vampires tend to get
caught in the Revenge Spider webs. The dialogue mentioned that Solaufein
was developing into some sort of powerful Lich/Vampire hybrid. Use that
knowledge to your advantage. In particular, he has the fighting power of an
Ancient Vampire (immune to up to +2 weapons, rapid regeneration) and the
magical defenses of a Lich (immune to spells of level 1 through 5), plus
his augmented stellar magic resistance.  Unless you are channeling Merlin,
a magical assault is probably out (you'd need something like Ruby Ray or
Warding Whip to even get past his defenses, and then you'd need quite a few
Lower Resistances ... but you cannot target him with those until you dispel
his invisibility). On the other hand, a melee assault is quite dangerous.
You'll have a hard time getting rid of his Fireshields and
Pro-Magic-Weapons since Breach won't work. His melee attacks drain levels
(right hand) and cause death (left hand). Ouchy! Just be glad I didn't have
him keep his equipment. 


Q: OK, I killed him ... but how do I restore him *and* my other romance
when Bodhi only has one heart?

A: Just stuff them all in that statue. It'll work out. You don't even have
to be fast about it -- the statue will "remember" that you had the heart. 


Q: I'd like to practice on the Eclipse Party, but I hate waiting around (or
I don't have room for Solaufein in my party). 

A: You may start the Eclipse fight at any time using this command:

        CLUAConsole:CreateCreature("solaspy1")


Q: I'm getting my head handed to me on a platter by the Eclipse party.
Dude, what were you thinking? 

A1: They're do-able, really. Actually, my big concern used to be that
they're too easy to be a ToB challenge. Having play-tested them a bit more,
that's no longer my concern :-). However, Keldorn and Solaufein should be
able to take down at least half of them by themselves (depending on how you
guided the romance). [In fewer than 10 tries] I was able to defeat the
entire gang on Impossible with a F/T, Sola and Keldorn. Of course, Keldorn
was gibbed and Sola died. :-(

A2: Read the file solarom\README-Eclipse.txt for Gwion's analysis of the
Eclipse foes. That file is ON YOUR HARDDRIVE, not on my webserver. 

A3: If you lower the diffuclty level to "Normal" they get 6 seconds of
timestop every two rounds instead of every other round. If you move it down
to "Easiest" they get 6 seconds of timestop eveyr 3 rounds *and* all of
their buffs are dispelled before the fight starts. 


Q: Somehow, that's not reassuring. Any real hints? 

A1: Well, the standard tricks of trapping the area to hell and back
in advance probably won't work since they send in some fodder beforehand. 
Time Stop and Time Trap are pretty poor choices to use against them. The
normal method for this sort of party is to ignore the fighters, take out
the mages and then go back for the fighters. However, these guys put a lot
of pressure on you real fast -- it's not clear that you can ignore the
fighters for too long. Try dispelling their buffs first (important:
improved hasted regenerators regenerate twice as fast!), then nuking the
area with multiple dragon's breaths. Protection from magic weapons and
stoneskin are a must. Try to trick them into attacking someone who is
protected from magic weapons. If you want to keep your spells alive, take
down the Sorcerer early. Try to avoid ever being hit by the fighters
because blindness is seriously annoying. This is tricky, because they will
use Critical Strike and Smite to ensure that they hit you. Also, the
fighters are basically immune to missile damage. They're tough because
they're buffed up fighters who combine Improved Haste, Critical Strike and
Regeneration. Consider doing something similar yourself. Oh, and don't have
your whole party stand in one spot. That would be suboptimal :-). The magic
users use the "cast and attack" trick (that you should be using) in
conjunction with Energy Blades ... that hurts. Use Physical Mirror or
something to block their missile attacks (they're doing it to you). Also,
notice that when they start fighting, Solaufein invokes Eilistraee and she
grants him her protection (which turns out to be temporary immunity to
blindness, stun and timestop). Use that to your advantage. Try to take on
their warriors one at a time (if you can) -- I'd go for the Anti-Paladin or
the Kensai first. If you can get the warrios to drop their weapons in panic
they become *much* easier.

A2: Althernai offers this strategy:

  I take much of what I said regarding the difficulty back now. The key was
  that I needed to cast a triple Dispel Magic on them before the battle
  began - then the cleric and druid took full damage from the Dragon's
  Breath (the others have 60% resistance I think from the helm and the
  ring). For some reason, I do not think of my enemies as having used buffs
  before teleporting in - I think this is because of Bioware's policy of
  making all resistances permanent rather than potion based. I did not do
  anything else differently except this - no Mordy's, no Circlets, etc. I
  did use Spell Immunity to keep my mages out of sight completely - they
  tend to get chopped up very quickly. Nobody died, nobody got level
  drained or blinded. [ Editor's Note: Radael does tell you that he buffed
  before the battle in the dialogue. ] 


Q: What were you thinking when you designed this?

A: As you may have heard, I like tactical challenges. This fight is an
object lesson in preparation. Their party is actually a pretty standard
assortment of single-classed characters with 4 million XP each. They're
using the same rules for THAC0, HP, AC, saves and spell memorization that
you are. Sola won't start this fight until you hit 4M XP as well, so that
part is even. They have pretty good but not godly stats (e.g., Radael's
base strength is 17, lots of 18 dexterities). They're carrying pretty
standard stuff (e.g., helm of defense, cloak of protection +1, amulet of 5%
magic resistance, 5 potions of superior healing) aside from their special
weapons (Eclipse Blades) which are actually pretty much on par with (or
weaker than) the stuff you should have now (e.g., Carsomyr +6, Ravager +6,
Foebane +5, Crom Fayer, Celestial Fury, Flail of Ages +5). Their only big
advantage that you cannot really duplicate is that every-other-round time
stop, which effectively makes them twice as fast as you (well, slightly
less, since Sola can move in the stillness). This should be fine, however,
since you're twice as smart. 


Q: Well, I managed to make a dent in those Eclipse Losers but then they
just ran away, regenerated and came back, about the same time that the
Sorcerer decided to go on a little Dragon's Breath appreciation spree. It
was diced party flambee. The fact that all of my characters were blind
didn't help. 

A: If all else fails, lower the difficulty level. Recall also that you
don't have to tackle this fight -- you were obliquely told how to avoid it.  
If you want an incentive, you get to keep their weapons and Solaufein's
boon if you kill them (the Eclipse Avenger would go well with Sarevok). Did
you try summoning things and running away? Nuking them from a distance?
Distributing Pro-Magic-Weapons scrolls? Using Hardiness before the battle?
Upping your Fire Resistance beforehand? Using Smite back on their warriors?
Tried punching the sorcerer and druid with your non-magical fist? In my
personal opinion this battle is harder than the default ToB ending battle
(Mel and the pools) but easier than the Ascension Mod ToB ending (Mel and
the Five). Since this is one of the two hardest battles in the game, pull
out all the stops: did you save any Mind Flayer Control Circlets? How about
that Rift Device your familiar carried out of the sewers for you? 


Q: Isn't Solaufein way too powerful?

A: Solaufein can be very powerful in the hands of a player with a detailed
tactical knowledge of BG2. However, he can also be quite weak if you are
not familiar with the ins and outs of fighter/mages. Gwen Morse offers this
example:

  I could have taken Sola with me and had [ fun ]. But, the guy kept
  _dying_ on me. Even more than Haer'Dalis. I very much wanted him, but, he
  was dying in just about every significant battle I sent him into. I
  couldn't even nurse him along till he got [ powerful equipment ]. So, I
  finally stuffed him in the Pocket Plane and brought back someone else. I
  fully realilze this was a problem with my own tactical play (or lack
  thereof), but, I needed a party that I was used to playing with.


Q: What are the Romance "Rewards"? 

A: If you answer Solaufein's philosophy questions pragamtically, Sola will
receive a special sword (a Moonblade) that grants him a number of combat
protections and powers. The sword tends to make it easier to keep Solaufein
alive in combat if you are not interested in micromanaging everything. When
Sola has quite a bit of experience (ToB levels) the sword will "upgrade" to
make it comparable to ToB weapons. If, on the other hand, you answer
Solaufein remorsefully, Solaufein will gain the ability to memory extra
spells and call forth a Moonray (similar to a Sunray, but it also does
massive magic damage to enemies and heals the party) a few times per day. 


Q: What are all of the Solaufein dialogues? How can I control the Solaufein
romance? 

A: (This section is somewhat outdated). I'm assuming that you know how to
use the CLUAConsole. If not, grab Dan Simpson's BGII Walkthrough from the
web. 

All of the important variables controlling the Sola romance are "GLOBAL".

"SolaTalk" and "SolaTimer" determine the average romance dialogues. They
are similar to "LoveTalk" and "JaheiraRomance". 

SolaTimer is normally set to "3200". At a framerate of 30 this gives a
delay of 27 minutes (wall-clock, your time) between Sola romance chats. 

In the description below "Chat:" indicates that Sola will talk to you. This
is normally controlled by the mutex "SolaPCTalk". It is normally 0, but
when Sola wants to talk to you (for romance, based on some SolaTalk
variable) it is set to 1 by his script and then reset to 0 by his dialogue
(when you're done talking). This helps to avoid race conditions. In the
normal BGII romances the same thing is attained by incrementing the
LoveTalk variable twice (odd means something, even means something else).
"Talk++" means SolaTalk is incremented once.  All of the romance chats also
require that the global real time timer SolaTimer be expired. All of the
romance chats reset it.  Chats marked with a (*) can increment the
variables SolaRemorse and SolaPragma. 

Variable	Value	Meaning
~~~~~~~~	~~~~~	~~~~~~~
SolaTalk	-1	You've annoyed Solaufein and the romance is no
			longer active.
SolaTalk	1	Chat: what should I call you? Talk++
		2	Chat: Childhood. Talk++
		3	Chat: Phaere deception. Talk++
		4	Chat: Inherent good and evil (*). Talk++
		5	Chat: Eilistraee. Talk++

		6	Conditions: Party rests outside, SolaSpiderSpawn==0
			Chat: Spider nightmare. SolaSpiderSpawn := 3.
			
SolaSpiderSpawn 3	Summone the revenge spdiers. SolaSpiderSpawn := 4.
			
SolaTalk	6	Condition: SolaSpiderSpawn=4
			Chat: Ust Natha slaves (*). Talk++
		7	Chat: Redemption poem (*). Talk++
		8	Chat: Social contract (*). Talk++
		9	Chat: Summoned monster morality (*). Talk++

		10	Condition: SolaFoeSpawn=0
			Chat: Archryssa chat. SolaFoeSpawn := 3

SolaFoeSpawn	3	Gate out other party members.

SolaFoeSpawn	3	Condition: Archryssa dead.
			Gate in party members.
			Chat: Archryssa dead chat. SolaFoeSpawn := 6. 

SolaTalk	10	Condition: SolaFoeSpawn=6
			Chat: Traps (*). Talk++
		11	Chat: Golems and prophecy. Talk++
		12	Chat: Children and fire (*). Talk++
		13	Chat: Dance! Talk++

SolaTalk	14	Condition: daytime, city, dungeon
			Chat: Let's go moongazing. SolaMoon := 2

SolaMoon	2	Condition: night, !city, !dungeon
			Chat: Step away from the others. SolaMoon := 4

SolaMoon	4	Condition: you & sola alone away from others
			Chat: Moon reward.
			SubCondition: SolaPragma >= SolaRemorse
				Moon's Blade reward
			SubCondition: SolaPragma < SolaRemorse
				Memorization & Moonray reward
			SolaMoon := 6

SolaMoon	6	Condition: night, SolaSleep=0
			Chat: Let's sleep.
			SolaSleep := 3 (yes) or -1 (no)
SolaSleep	3	Chat: Thanks!
			SolaSleep := 4

SolaDiscussMorning 0	Condition: morning, outside
			Chat: Mornings. SolaDiscussMorning++
SolaDiscussEvening 0	Condition: evening, outside
			Chat: Evenings. SolaDiscussEvening++
SolaDiscussWoods 0	Condition: day, woods, outside
			Chat: Woods. SolaDiscussWoods++


		Section XII. Changes
		~~~~~~~~~~~~~~~~~~~~
From Release 1:
	* New "Known Bugs" added with causes after some communication with
	  the TeamBG people.
From Release 2-3:
	* A few bugfixes. Sola now has reform-party dialogue and tries to
	  avoid talking when enemies can smite you. 
From Release 4:
        * Use the Weimeric dialogue compiler and setup utility instead of
          the TeamBG ones. Fix a number of spelling errors. Add ToB support
          for Solaufein. Start Sola near Elhan instead of the Underdark. 
From Release 10-ish:
        * Use the Weimeric dialogue compiler to address foriegn language
          issues. Rudimentary Italian and German translations are
          available.
From Release 13:
        * Automatically log all strings to a file to make bug reporting
          easier.
From Release 14:
        * Fixed a bug that was preventing correct installation on some
          computers. The symptoms were that the DLGs would not install
          correctly, Sola had nothing to say and the Fate Spirit stopped
          working. 
From Release 16:
        * Fixed a bug where Sola using his sword and the PC using Celestial
          Fury could crash the game if they hit and killed something "at
          the same time". 
        * Fixed a bug where an incomplete Sola romance from SoA would not
          continue in ToB. If you already have such a game going (you
          picked up Sola in SoA but didn't complete the romance), talking
          to Sola directly (e.g., click on the mouth icon and then click on
          Sola) should fix the problem. He'll say "I have nothing to say to
          you right now" but will start talking soon after. 
From Release 17:
        * Fixed an open file handle bug typo that left 0-byte files if you
          closed the install window instead of pressing return. 
From Release 18:
        * Official German translation by Falk Swoboda. Thanks, Falk!
From Release 19:
        * You may now uninstall the MOD, but I don't personally recommend
          it. 
        * Better error checking for a flat directory structure. 
From Release 20:
        * Solaufein now comes with a -2 rep loss if your rep is high.
        * Solaufein's challenges and rewards happen even if you are not
          romancing him.
        * Official Italian translation by Luciana Boscaratto. Thanks!
From Release 21:
        * Solaufein now comes with inter-party dialogue.
        * Solaufein now has yet another tough challenge (this one is ToB
          only): the servants of the Unholy Eclipse. 
From Release 25:
        * Fixed Minsc banter loop bug.
        * Improved some of the dialogue based on outside suggestions. 
From Release 26:
        * Fixed a scripting typo (IncremenetGlobal), H'D banter loop
        * Fixed a bug where bantering with Sola would prevent nearby
          non-joined NPCs from every joining with you again. Now Sola will
          not banter if such people are nearby. 
        * Dialogue changes, thanks to all my beta testers!
        * Archryssa now uses a cut-scene to prevent foul play
From Release 27:
        * The Moonray spell no longer turns all neutral characters into
          enemies (oops!) and now it does successfully dispel illusions
        * Fixed a typo that was preventing Shangalar, Layen and Sion from
          casting Stoneskin.
        * Solaufein will no longer become an enemy if you make the Drow
          city mad while he is inside it. 
        * We can now making pausing dialogues. Thanks M!
        * Slightly Smarter Mages now available.
        * Installation should be much faster now that we don't allocate
          _way_ too much memory in dc.exe.
From Release 28:
        * Re-Allow Sola to join you in the the Underdark (for GB), but
          you have the option of asking him to meet you on the surface
          instead. 
From Release 29:
        * Fix some scripting bugs with Sola joining and leaving in the
          Underdark.
        * Change Archryssa so that if you flee or hide she just teleports
          you back to her (instead of doing damage to Player1). 
        * Sola now comes with enough potions of fortitude to satisfy those
          worried about his average CON until you can get the girdle.
From Release 30-31:
        * Upgrade to the new WeiDU!
        * Added Kuroisan and the Red Badge foes. 
        * Fixed an Eclipse gang game-crashing bug (thanks GB!)
        * New German translation from Falk.
        * Fixed a bug in the "smarter mages" bit where they would cast
          spells at almost anyone.
From Release 32:
        * Move lovely Germanic translations from Falk.
        * Pulled the Poison guys and the Acid guy into an install-time
          option.
        * Eclipse guys now take you to a special Eclipse area (thanks GB!)
From Release 33:
        * The Fate Spirit DLG is a file that is allowed to be missing.
From Release 34:
        * Fixed some bugs involving REPLACE and EXTEND_* with DLGs that
          were ALLOW_MISSING'd. Thanks, Shelley!
From Release 35: 
        * Thanks, Gwion!
        * A text file describing the Eclipse guys is now included.
        * Archryssa now slaps you if you run away. 
        * A Giant Spider teleports in before the revenge spiders to suck
          up traps.
        * The Eclipse guys now respond to the difficulty level.
        * The Poison gang now have their own little area. 
From Release 35: 
        * Fixed an NI-induced bug in the Eclipse weaponry that may have
          been responsible for those game crashes.
From Release 36:
        * More Gwion tactical fixes. Smarter dragons, tighter red badge
          cutscenes, archryssa lower resistance, etc. 
From Release 37:
        * Fixed a bug where Ylekilnu could cast Nature's Beauty an infinite
          number of times. Thanks, Gwion! Also, he could cast Creeping Doom
          at enemies. Whoops!
        * New WeiDU will not choke on read-only files. Fixed a bug where
          Sola would redo his "please let me join you" convo all the time.
From Release 38:
        * Additional Italian translations! Thanks Lucy!
        * Upgrade to the new WeiDU. 
        * Let people out of the guarded compound! Made the condition for
          that just a bit easier. 
From Release 39:
        * Dialogue typos fixed. Special thanks to Sophia Ahmed. 
        * Add a "Moonblade Upgrade" (when Sola has 3.5M XP) that beefs
          up the Moonblade with clerical protections. This is in response
          to complaints that it is not powerful enough for all of ToB. 
        * Fixed a bug preventing the Eclipse encounter from occuring.
        * Added GB's improved mind flayers.
        * Made Archryssa easier on the easiest difficulty level. Also, no
          contingency for her if she's dead!
        * Added the random SoA encounters to the "tactical encounters"
          option. 
        * Upgrade to the newest WieDU so that we preserve state trigger
          "weights". 
From Release 40:
        * Include the rest of the SoA dragons in Smarter Dragons. 
        * Fixed a bug that prevented the tactical encounters from
          installing.
        * New German dialogue from the mighty Falk.
From Release 41:
        * Bodhi Abduction added! Gadzooks!
From Release 42:
        * Fixed a copy-paste abduction bug from the Kelsey guys. Thanks, JC
          and Ghrey!
        * Pro-Fire and Pro-Elect in the GC, thanks to Dshobbit. 
From Release 43:
        * Improved Bodhi added. 
From Release 44:
        * A bunch of GB tactical encounters added.  
        * Fixed an Abduction bug that stalled things if Sola was your only
          romance.
        * Added Italian translations for the Abduction. 
        * Fixed a bug that would prevent Italian/German installations of
          Improved Bodhi.
From Release 45-46:
        * More GB random encounters.
        * Tweak the Kuroisan script to be CPU-friendly. 
        * Eclipse tweak: avoid bugs, don't always go for WorstAC, cast
          Death Fog on Mordy. Thanks, Kish!
        * Tweak the ImpBodhi AI to use all of the spells, but be a bit
          easier.
        * Add one Sola post-nookie dialogue (more to follow). 
        * Fix a bug that was preventing the kit from installing. 
From Release 47:
        * Fix a Kuroisan bug. 
From Release 48:
        * Archer kit can now specialize in melee weapons.
        * Fixed Tsuki +5 -- no more dispelling its benefits. 
From Release 49:
        * New German text from Falk (and Elanor). 
        * No Snakes while there are enemies about. :-)
        * Beefed up TorGal a bit ...
        * Include Ishan's Insanity
        * Include Xyx's colored beholders and beholder hive upgrade
        * Include some goodies from KR's Deeper Shadows of Amn
        * Vaguely new README layout. 
From Release 50:
        * Fixed a Boo2 bug where returning him to the party would not kill
          him. 
        * Eilistraee's blessing (Eclipse fight) is now temporary.
        * Use the new WeiDU: we can be installed under VPC on the Mac.
From Release 51:
        * Sanchudokuu's acid backlash damage has been reduced by a factor
          of 3.3. In addition, it grants immunity to the Acid Arrow
          projecticle so that you cannot make infinite loops with the blade
          and physical mirror (or whatnot).
        * Include two GB patches: Mae'Var's cleric and Demon-Knights. 
        * ToB Epilogues included, based on those of Rob Scott. 
        * TorGal no longer calls for help.
        * Imp Bodhi now regenerates at 1/3rd her old speed. 
        * Set Giant Troll XP up to 5000, Spirit Troll XP down to 10000. 
        * Fix Spirit Trolls so that they become invincible. 
        * Spawn Giant Trolls instead of Blizzard Trolls now. 
        * Fix a "TorGal's claw" bug. 
        * Kangaxx the Demilich fixes
From Release 52-54:
        * You can skip past the Imp Bodhi dialogue. 
        * GB's multig.d fix
        * Give Generic Archers ToB high-level abilities
        * Fix yet another Sola dialogue loop.
        * Fix a bug where Sola would never have the children talk.
        * Kuroisan is now worth 40,000 XP. 
        * Tor'Gal now carries the Flail Head of Cold. 
        * Give Solaufein tree-of-life and hell dialogues. 
        * Eclipse fight is now optional.
        * If someone who is not Solaufein uses the Moonblade, E takes
          it back. No giving it to thieves. That goes double for Tsuki +5. 
          Thanks to Mattia Loy for the last two ideas. 
From Release 55:
        * Archer Kit now has equipment in ToB. :-) 
From Release 56:
        * Reduce the number of times Adalon can run away to 3 (was 6! what
          was I thinking?)
        * Kuroisan now gives up after 1 hour and comes back 1 day later.
        * Fixed a bug in mind flayer detonate -- it could affect the whole
          party even if they were really scattered.
        * Really fixed the TorGal spirit troll bug.
        * Spirit Trolls changed around: now they do spiritual things. :-)
Also From Release 56:
        * Fixed Epilogue Typos
        * Fixed Epilogue always appearing for Sola even if he's not in the
          party.
        * Added the French Translation! Special thanks to Ly Meng. 
        * Even if the dialogue loops (which I would hate), you can no
          longer lose 2 rep multiple times from Sola joining. 
From Release 57:
        * New German translations from Falk! 
From Release 58:
        * Fix a problem where if you got really hurt in the Eclipse fight
          the screen would mysteriously shift back to where you were before
          and the game would get stuck. 
        * Fixed a bug in the improved mages so that they recast their buffs
          every 8 hours instead of every 1 hour.
        * Change boo2 to solaboo to avoid a Nalia romance conflict.
        * Minor Epilogue editing. Thanks, Kish. 
From Release 59:
        * More spirit troll gibberish. 
        * More French translations by Ly Meng! Thanks!
        * Added more ways to quit romancing Sola before the big dance. 
From Release 60:
        * Dialogue corrections from Sophia Ahmed. 
        * Fixed "Dialgoue" problem with the Tree Of Life. 
From Release 61:
        * Fixed(?) Dialog Loops in the Tree of Life and Hell.
        * Fixed string 300 error where Solaufein would yell at you if
          told him to wait with Elhan.
        * Improved Mages no longer use Time Stop (9th level spell) inside a
          Chain Contingency. Thanks to Jens-Martin Gammelgård Karlsson for
          pointing out this bug. 
        * Kuroisan will now go after CF +5. 
From Release 62:
        * Interjections for SoA added, loosely increasing the amount of
          Sola dialogue by 20%. Yes, we have Kelsey envy. See the FAQ for
          locations. 
        * Rephrase the loop-avoidance dialogue code to avoid LOCALS. 
        * Proofreading by Scarlet Tang. Thanks!
        * Double the timeout for improved mage re-buff-casting to 4800.
        * Sanchuudoku now actually looks like a Katana. 
        * Two fighters guarding Kangaxx in KR's Deeper Shadows of Amn (
          in the Sola "extra tactics" component) had droppable copies of
          the supposed-to-be-unique Silver Sword, Water's Edge and Rashad's
          Talon. Fixed. 
        * "MISSING" files added to foreign-language translations so that
          the translators can tell what remains to be done. 
        * Remove LICH01.CRE from distro, it causes some problems for David
          Milward (and presumably others). 
        * BAF sources no longer distributed with the main ZIP. Email me if
          you would like the commented versions or just decompile them. 
From Release 63:
        * Whoops, Valen is not required.
From Release 64:
        * Added Improved Irenicus. 
From Release 65:
        * KR's Gnome F/I no longer drops a staff of fire (unique item). 
        * Improved Mind Flayers can no longer break the game by teleporting
          away in the Spellhold test or the Watcher's Keep level. 
        * Added one more post-nookie banter: black ravens. 
        * Changed a few ReallyForceSpells in the final Improved Irenicus
          fight to SpellNoDecs (cut and paste error).
From Release 66:
        * Since we're not including LICH01 anymore, we now do a
          COPY_EXISTING to get lich levels up past 11 (where they are in
          the default game, sigh). 
        * Added Littiz Imp Irenicus information. 
        * Fix a bug where SoA players could not install due to Keldorn
          dialogue problem.  
        * Included GB's Meteor Swarm, Ice Swarm and Firestorm duration
          fixes. 
From Release 67:
        * Include SCRL3I.ITM in Imp Guarded Compound. Thanks, Reiella. 
        * Laurent Duvernet gave us the original Rimbaud for the French
          translation.
        * Changed Imp Bodhi to avoid looping dialogue. 
        * Fixed a "black raven" dialogue bug if you had Keldorn in the
          party. 
        * Fixed a bug where if you rejected Sola and then got the rewards
          he would get "stuck" on the "Oh, Eilistraee has touched my soul"
          line. 
From Release 68:
        * Bloodbane gets the new throwing spear animation. 
        * New German translations by Falk Swoboda. 
        * Added Improved Sahuagin City to Tactical Encounters. 
From Release 69:
        * Imp Bodhi no longer does Abyssal Darkness or Cloud of Bats in
          chapter 2/3. 
        * Undead Sola is now a little smarter if you run away from him. 
        * Added French Translation update by Artimedore. 
        * MISSING files now automatically updated with each release for
          translation ease.
From Release 70:
        * Eclipse guys now get Death Warded if you're on CORE or above. 
        * Moved to self-extracting zip files so that "use folder names"
          always happens. Let me know if this works.
        * Updates will be slower for a bit, life has been busy. :-(
From Release 71:
        * Eclipse guys now get Death Warded if you're on HARD or above. 
        * Added Auto-Buff Spellcaster Scripts.
From Release 72:
        * Sola Interjection proofreading by Scarlet Tang. Thanks!
        * Smarter Mages: Liches are now *much* harder to kill with
          pro-undead scrolls. Or to run away from in general!
        * Tactical Encounters: all "useless" Undead (e.g., not vampires,
          not liches) now have weak Undead-ish powers (e.g., blindness,
          horror, doom). 
        * One more attempt to fix the mysterious area change bug 
          in the Eclipse fight. 
        * Some Sola ToB banter added. Installed automatically if you have
          ToB. 
From Release 73:
        * Translation problem fixed, thanks to FakeMustache. 
From Release 74:
        * Include Paul Ward's description of Imp Irenicus without ToB
          installed. 
        * Added a "shut up and kiss me" option to the Black Ravens for Kiki.
        * Fixed a bug where the Sahu Priestess was force-casting mantle.
        * Rassadihn sent in quite a few bugfixes for the Deeper Shadows
          Kangaxx Guardians. String typos, spell trigger problems, mystery
          messages, lich coloring, etc. Thanks!
From Release 75:
        * Fixed stupid duplicate label. 
From Release 76:
        * Eclipse Club can now be used by clerics (etc.). Bug reported by
          M. Klag. 
        * Sola was giving some dialogues too early (before Sleep). Thanks
          to Lisa Jonte for pointing this out. 
        * Archryssa now casts "Death Spell" on arrival to take out
          lingering summons. Yes, this is not a perfect solution. 
        * Undead now use "weak under powers" every 3 rounds (or more), not
          every 2.
From Release 77:
        * Fixed a problem where all interjections were giving an error
          like:
              Too Few Parameters to Trigger Global("SOLA_IJ3",0)
From Release 78:
        * Fixed a problem where all interjections were giving an error
          like:
              Unknown Action: InParty("Sola") 
From Release 79:
        * If Sola is already in party when you are doing Ust Natha (because
          you Console'd him in), he will not respawn when you finish.
        * Resting the party with a Dead Sola in it no longer crashes the
          game.  
        * Typo fix from Rassadihn. 
        * Sola has a final interjection in ToB just before the PC chooses
          Godhood (or not). Special thanks to Pamm for inspiration. Lisa,
          Kiki, other-content-fans: Yes, I'm thinking about more dialogue.
          Something about committing, perhaps.
        * Took out all of the tactical components -- they are now in the
          Tactics mod (by popular request). 
From Release 80:
        * Fixed DLG typos with Belmin Elf-Hater, Korgan-Vic banter. Thanks
          Michael Helling.
        * Updated German translation by Falk Swoboda. Thanks!
From Release 81:
        * Added a new lovetalk about identity. This one is a prelude to a
          future talk about commitment. 
From Release 82:
        * The Moonray will makes Sola temporarily immune to Acidic Backlash
          and Fireshield so that he won't get hurt by party members when
          casting it. 
        * More typos fixed by Rassadihn!
        * Added The Worn Leather Book. Special thanks to our resident
          CSoH-in-training, the "fiery" Kiki. Bonus points to Lisa Jonte as
          well. You can buy the book from Elence Fielding, one of the
          merchants that hangs out near the Umar Inn. If you buy it and
          give it to Sola, he should chat about it. 
From Release 83:
        * Book bugfix, clarity, etc: You must be past the Dance lovetalk
         (SolaTalk > 13) in order to be able to BUY the book from Elence
         Fielding. You must not have rejected Sola (SolaTalk not -1) and
         you must put the book in Sola's backpack in order to get the chat
         on it. You're so demanding, Kiki. :-) 
From Release 84:
        * More book bugfixes. Sigh. 
From Release 85:
        * The book never dies. Everything seems to work this time. Really.  
From Release 86:
        * Updated German translation by Falk. Thanks!
        * A number of English typos were fixed by Falk. Thanks!
        * Updated the book dialogue based on Kiki's magic flowchart. 
From Release 87:
        * Wow, bad version of WeiDU made mod uninstallable. 
From Release 88:
        * All "Solaufein repeats his Please-let-me-Join" dialogue loops
          should now be squashed. Special thanks to Furiel.
        * Book typo fixed. Thanks, Scarlet. 
        * Happy belated turkey day.
From Release 89:
        * Fixed typo in Drizzt convo (Ardulace vs. Despana). Thanks, Jason
          Whittaker. 
        * Added a new post-nookie banter from Scarlet and Lisa. You two
          rule! Keep 'em coming!
        * Added a new post-nookie banter from Sphira. Excellent work --
          somewhat complex. 
From Release 90:
        * Fixed a missing > in Sphira's chat. Thanks Jason and GB. 
        * Fixed typo in Tolgeris interject. Also re-positioned it. Thanks,
          Sophia. 
        * Fixed some typos in the Sphira chat. Thanks, Scarlet. 
From Release 91:
        * First Revenge spider battle now responds to diff slider. 
        * You can now back out of the romance at any time by talking
          directly to Solaufein and turning him down gently. 
        * Fixed Eclipse & Lovetalk typos. Thanks, Kismet. 
        * Upgrade to the new, non-banter-destroying WeiDU 95. 
From Release 92:
        * Fixed a bug in the Sola-Vamp dialogue script. 
        * Boo2 now has a portrait. Thanks, Michael Helling. 
        * New Cocobard French translations. 
From Release 93:
        * Now includes Scarlet's lovely Ambition (= "post vamp-sola")
          dialogue. 
From Release 94:
        * Auto-buff script bug-fixes. Thanks, John. 
        * Fixed the bug that looked like this: 
  [ReallyForceSpell] argument [WIZARD_DRAGONS_BREATH] not found in [Spell.IDS] 
          for SoA players. Thanks: Dread Pirate, Johnathon Price, Sphira,
          Shinamaste, Peter Flor, John King, Ken Hydock. 
From Release 95:
        * No getting the moonblade in the pocket plane. 
        * Added R's Eclipse summary. 
        * Added Afi's poem lovetalk. Thanks!
        * Added Anonymous Donor's Raamilat interjection. Thanks!
        * Minor Tsuki no Ken tweak. 
From Release 96:
        * An updated German translation from Falk Swoboda and his team of
          poetry translators. 
        * Anonymous Donor turns out to be Hendryk. Thanks! 
        * Edited Afi's poem lovetalk about to make the second half sound
          more like this Solaufein.
        * Tsuki+5 weakened a bit. Thanks, Rataxes and SixOfSpades. 
        * Xazziri 'loaded gun' dialogue fixup. 
        * Fixed a Boo Two problem where Sola was never actually summoning
          him. Thanks, NegaDruid.
From Release 97:
        * Xazziri 'loaded gun' dialogue fixup (again). 
        * Added Banshee's French translation. Thanks!
From Release 98:
        * Added Allyonora's Portuguese translation. Thanks!
          See http://www.balduran.com.br/forum/viewforum.php?f=13 for
          Portuguese discussions. 
From Release 99:
        * Typo: "hear and mind" -> "heart and mind". Thanks, Celandra
          Silvermoon. New WeiDU, yada yada. 
From Release 100:
        * Added Polish Translation by Damian Staniszewski. Thanks!
        * Happy New Year!
From Release 101:
        * AutoBuff scripts no longer walk after Player1. 
        * Updated Damian's Polish translation. 
        * the bigg's Solaufein-ShadeLord-Mazzy fix is included. 
        * Typos fixed. Thanks, Sture. 
        * If Sola is imprisoned, when you talk to him you can now get him
          to rejoin you. 
        * Added Serdrick & Aerie.ru's Russian Translation. Thanks! 
From Release 102:
        * Updated Folk's German translation. Thanks!
From Release 103:
        * Updated French translation.
From Release 104:
        * Added Spanish translation by Clan REO with files from Ancalgon.
