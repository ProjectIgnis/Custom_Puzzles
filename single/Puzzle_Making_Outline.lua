Debug.SetAIName("AI") --Set's the AI name
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4) --Begin loading the field for a puzzle, with DUEL_ constants in (int flag) under Master Rule (int rule) Most use for puzzles is attack first turn and simple AI, aka, vs a puzzle AI and allowing to attack.
--List of constrants:
--DUEL_TEST_MODE
--DUEL_ATTACK_FIRST_TURN
--DUEL_NO_CHAIN_HINT
--DUEL_OBSOLETE_RULING
--DUEL_PSEUDO_SHUFFLE
--DUEL_TAG_MODE
--DUEL_SIMPLE_AI
--SPEED_DUEL

Debug.SetPlayerInfo(0,8000,0,0) -- Player's Lifepoints, Set opening hand, and draw phase
Debug.SetPlayerInfo(1,8000,0,0) -- AI's Lifepoints, Set opening hand, and draw phase
--Contents here like add card
Debug.ReloadFieldEnd() --Reload's the field to add everything. ALWAYS NEEDED with reloadfieldbegin
aux.BeginPuzzle() --Start's it as a puzzle. Remove to allow muti turns / debugging.



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
