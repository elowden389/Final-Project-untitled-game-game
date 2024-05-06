<h3> Untilted Game Game <h3>

// Global Variables //
VAR player_games = 0
VAR destroyed_games = 0
VAR feature_one = false // When true the initial character 'sprite' is revealed
VAR shop_unlocked = false

VAR has_sword = false
VAR has_armor = false

VAR player_health = 100 
VAR player_damage = 2

-> start

== function make_game(game_amount) == // Used to add games after choice is selected
 ~ player_games += game_amount


== function absorb_game(game_amount) == // Used to increase player health
 ~ player_health += (game_amount/5.15)
 ~ player_health = FLOOR(player_health)
 ~ player_games = 0


== start == 
You make games.

+ [Make a game]
    You've created your first game. It's not great, but it's an admirable first attempt nonetheless.
    ~ player_games += 1
    You decide to keep making games.
    -> hub


== hub ==
{
 - feature_one: Your character: (o)
                Health: {player_health} // Character with no upgrades
}


{
 - has_sword && has_armor: Your character: \\[o]/ // Character with sword and armor
                           Health: {player_health}
 - has_sword: Your character: \\(o)/
              Health: {player_health} // Character with only sword purchased
 - has_armor: Your character: [o]
              Health: {player_health} // Character with only armor purchased
}
 
 
{
 - player_games > 1: You have {player_games} games
 - player_games == 1: You have {player_games} game
 - player_games == 0: You have no games :(
 - else: You've managed to obtain {player_games} games. I'm sorry, but possessing negative games poses a threat to both the game world and the real world. I have to shut this down now. ->END
}


+ [Make 5 games]
    {~You made 5 mediocre games...|You made 5 great games. Congratulations!|You made 5 really bad games. Ouch.|}
    ~ make_game(5)
    -> hub

+ [Light 10 games on fire]
    {!You've burned 10 games.|You've burned 20 games...|You've burned 30 games. Why?|You've burned 40 games... :/|You've burned 50 games... :(|You've burned 60 games... :'(| You've burned 70 games. Please stop.|...|(;_;)|You've burned 100 games. You make me sick.}
    ~ destroyed_games += 10
    ~ player_games -= 10
    -> hub

+ [Absorb all your current games]
    You absorbed {player_games} games...
    ~ absorb_game(player_games)
    -> hub

* [Trade 25 games to obtain new features from the developer]
    Here's a character for you to upgrade and a shop from which to buy shiny new items!
    ~ player_games -= 25
    ~ feature_one = true
    ~ shop_unlocked = true
    -> hub

+ [Go to Shop] // Shop can only be accessed after buying first set of new features
     -> Shop


== Shop ==
{
 - !shop_unlocked: You have not yet unlocked the shop! -> hub
}

{Welcome to the shop! You asked for it, so I delivered, but don't think I'll be doing you another favor.|Welcome to the shop!}

* [Buy a polished steel sword (50 games)] // character item
    ~ player_games -= 50
    ~ has_sword = true
    ~ feature_one = false
    -> hub

* [Buy a sturdy set of chainmail armor (125 games)] // character item
    ~ player_games -= 125
    ~ has_armor = true
    ~ feature_one = false
    ~ player_health += 75
    -> hub

+ [Make a request for the developer to create a boss fight (250 games)] //progression item, make this lead to new knot, point of no return

Hmmm, you're not satisfied with making games just for the sake of it, huh? I thought you would appreciate my work, but I guess I have more to improve upon.

I'll give you the boss fight you selfishly desire, but know that I'm doing it not because you asked for it, but because I want to challenge my programming skills.

I'm making the fight in real time, so there's no chance for me to beta test it. If you rushed to request this feature in an attempt to annoy me, I will begrudgingly allow you one chance to further prepare.

Your current games: {player_games}
Your current HP: {player_health}
    ** [Pay 250 games and proceed]
        ~ player_games -= 250
        -> boss_fight
    ** [Let me prepare first]
        -> hub
    
+ [Go back]
    -> hub


== boss_fight == // The boss fight!!! No matter what this is where the game ends
{ 
 - player_games < 0: Did you seriously think I would let you enter the boss fight boss without requiring 250 of your games? My work is valuable, and you need to learn to treat it as such. I believe a trip back to the beginning of the game will teach you a lesson.
        -> END
}

Darkness engulfs you as you're whisked away to a colossal boss arena spanning hundreds of feet. Before you, a grand gate swings open, and you brace for a monstrous beast to charge at you. Instead, you're met with the sight of a man casually walking out from the gate.

"Behold! It is I, the developer. You can't imagine the challenges I faced coding my consciousness into this game, but your selfishness earlier really kicked me into overdrive."

"Nevertheless, this is the showdown you've been anticipating. Give me everything you've got."

A sense of dread echoes through your body as you begin to anticipate what horrors the developer has in store for you. (Can he hear my thoughts?) Pushing aside your fears, you prepare yourself for a worthy boss fight.

You charge towards the developer with a newfound sense of purpose...

TO BE CONTINUED when I don't have 3 million finals :0
-> END






