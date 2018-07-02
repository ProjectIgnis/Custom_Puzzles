Debug.SetAIName("AI") --Sets the AI name
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4) --Begin loading the field for a puzzle, with DUEL_ constants in (int flag) under Master Rule (int rule). 
--The most used constants for puzzles are attack first turn (so you can attack) and simple AI (so the puzzle has some AI)
--List of constants:
--DUEL_TEST_MODE - The player controls the AI. Use for testing, not for challenge puzzles.
--DUEL_ATTACK_FIRST_TURN - Allows the player to attack. Essential for one-turn challenge puzzles.
--DUEL_NO_CHAIN_HINT - Irrelevant for challenge puzzles.
--DUEL_OBSOLETE_RULING - First turn draw and "ignition priority". Irrelevant for challenge puzzles.
--DUEL_PSEUDO_SHUFFLE - Don't shuffle deck. Depending on your puzzle, this may be necessary, or you may not want it.
--DUEL_TAG_MODE - Tag duel. Irrelevant for one-turn challenge puzzles.
--DUEL_SIMPLE_AI - AI player will always activate or summon cards whenever possible, without thinking about strategy. Can be useful in puzzles with care.
--SPEED_DUEL - Speed duel format, 3 zones instead of 5.

Debug.SetPlayerInfo(0,8000,0,0) --Player's Life Points, size of opening hand, and amount of cards in draw phase
Debug.SetPlayerInfo(1,8000,0,0) --AI's Life Points, size of opening hand, and amount of cards in draw phase

--Create the game state here, with functions like Debug.AddCard()

Debug.ReloadFieldEnd() --Reloads the field to save the changes you specified above.
aux.BeginPuzzle() --Set up game loss at end of turn for a one-turn challenge puzzle. Remove for multiple turns or testing.

--LOCATION_DECK  
--LOCATION_SZONE  
--LOCATION_GRAVE   
--LOCATION_HAND    
--LOCATION_MZONE   
--LOCATION_EXTRA  
--POS_FACEDOWN   
--POS_FACEUP     
--POS_FACEUP_DEFENSE    
--POS_FACEUP_ATTACK     
--Debug.Message(any message here)
--Debug.PreEquip(e1,c1)
--Debug.AddCard (int code, int owner, int player, int location, in seq, int pos[, bool proc=false])) 
--Example: Debug.AddCard(40640057,0,0,LOCATION_HAND,0,POS_FACEDOWN) 
--Add a card of (int code), owned by (int owner) and under (int player)'s control, to (int seq) of (int location) in (int pos) position. If (bool proc) is true, it will be treated as properly summoned for the purposes of revive limits. 
