Debug.SetAIName("[AI]Justice")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

Debug.ReloadFieldEnd()
Debug.ShowHint("Yo. This is my puzzle maker. Using this, you declare card names to place in their locations. After this, the puzzle exports.")
Debug.ShowHint("Due to limitations, you cannot declare a card with an alius to add.")

local e1=Effect.GlobalEffect()
e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
e1:SetCode(EVENT_PREDRAW)
e1:SetCountLimit(1)
e1:SetProperty(EFFECT_FLAG_NO_TURN_RESET)
e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
	local mzone=aux.Stringid(1546122,1)
	local szone=aux.Stringid(1546122,2)
	local pzone=aux.Stringid(1546122,3)
	local fzone=aux.Stringid(1546122,4)
	local grave=aux.Stringid(1546122,5)
	local hand=aux.Stringid(1546122,6)
	local deck=aux.Stringid(1546122,7)
	local extra=aux.Stringid(1546122,8)
	local ban=aux.Stringid(1546122,9)
	local fu=aux.Stringid(1546122,11)
	local fd=aux.Stringid(1546122,12)
	local equip=aux.Stringid(1546122,14)
	while Duel.SelectYesNo(tp,aux.Stringid(1546122,0)) do
		local ac=Duel.AnnounceCard(tp)
		if Duel.SelectYesNo(tp,aux.Stringid(1546122,10)) then p=tp else p=1-tp end
		local c=Duel.CreateToken(p,ac)
		if c:IsType(TYPE_MONSTER) then
			if c:IsType(TYPE_PENDULUM) then
				if c:IsType(TYPE_FUSION) or c:IsType(TYPE_SYNCHRO) or c:IsType(TYPE_XYZ) then --or c:IsType(TYPE_LINK) then
					e:SetLabel(Duel.SelectOption(tp,pzone,mzone,grave,extra,ban))
					if e:GetLabel()==1 then
						local choice=Duel.SelectOption(tp,fu,fd)
						if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN_DEFENSE end
						Duel.MoveToField(c,tp,p,LOCATION_MZONE,pos,true)
						c:CompleteProcedure()
						if c:IsType(TYPE_XYZ) then
							while Duel.GetFlagEffect(tp,1546122)<5 and Duel.SelectYesNo(tp,aux.Stringid(1546122,13)) do
								local ac=Duel.AnnounceCard(tp)
								local mat=Duel.CreateToken(p,ac)
								Duel.Remove(mat,POS_FACEUP,REASON_RULE)
								Duel.Overlay(c,mat)
								Duel.RegisterFlagEffect(tp,1546122,0,0,1)
							end
							Duel.ResetFlagEffect(tp,1546122)
						end
					elseif e:GetLabel()==0 then
						Duel.MoveToField(c,tp,p,LOCATION_SZONE,POS_FACEUP,false)
					elseif e:GetLabel()==2 then
						Duel.SendtoGrave(c,REASON_RULE,p)
					elseif e:GetLabel()==3 then
						local choice=Duel.SelectOption(tp,fu,fd)
						if choice==0 then Duel.SendtoExtraP(c,p,REASON_RULE) elseif choice==1 then Duel.SendtoHand(c,p,REASON_RULE) end
					elseif e:GetLabel()==4 then
						local choice=Duel.SelectOption(tp,fu,fd)
						if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
						Duel.Remove(c,pos,REASON_RULE,p)
					end
				else
					e:SetLabel(Duel.SelectOption(tp,pzone,mzone,grave,hand,deck,extra,ban))
					if e:GetLabel()==1 then
						local choice=Duel.SelectOption(tp,fu,fd)
						if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN_DEFENSE end
						Duel.MoveToField(c,tp,p,LOCATION_MZONE,pos,true)
						c:CompleteProcedure()
					elseif e:GetLabel()==0 then
						Duel.MoveToField(c,tp,p,LOCATION_SZONE,POS_FACEUP,false)
					elseif e:GetLabel()==2 then
						Duel.SendtoGrave(c,REASON_RULE,p)
					elseif e:GetLabel()==3 then
						Duel.SendtoHand(c,p,REASON_RULE)
					elseif e:GetLabel()==4 then
						Duel.SendtoDeck(c,p,0,REASON_RULE)
					elseif e:GetLabel()==5 then
						Duel.SendtoExtraP(c,p,REASON_RULE)
					elseif e:GetLabel()==6 then
						local choice=Duel.SelectOption(tp,fu,fd)
						if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
						Duel.Remove(c,pos,REASON_RULE,p)
					end
				end
			elseif c:IsType(TYPE_FUSION) or c:IsType(TYPE_SYNCHRO) or c:IsType(TYPE_XYZ) then --or c:IsType(TYPE_LINK) then
				if Duel.GetLocationCount(p,LOCATION_MZONE)>0 then
					e:SetLabel(Duel.SelectOption(tp,mzone,grave,extra,ban))
				else
					e:SetLabel(Duel.SelectOption(tp,grave,extra,ban)+1)
				end
				if e:GetLabel()==0 then
					local choice=Duel.SelectOption(tp,fu,fd)
					if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN_DEFENSE end
					Duel.MoveToField(c,tp,p,LOCATION_MZONE,pos,true)
					c:CompleteProcedure()
					if c:IsType(TYPE_XYZ) then
						while Duel.GetFlagEffect(tp,1546122)<5 and Duel.SelectYesNo(tp,aux.Stringid(1546122,13)) do
							local ac=Duel.AnnounceCard(tp)
							local mat=Duel.CreateToken(p,ac)
							Duel.Remove(mat,POS_FACEUP,REASON_RULE)
							Duel.Overlay(c,mat)
							Duel.RegisterFlagEffect(tp,1546122,0,0,1)
						end
						Duel.ResetFlagEffect(tp,1546122)
					end
				elseif e:GetLabel()==1 then
					Duel.SendtoGrave(c,REASON_RULE,p)
				elseif e:GetLabel()==2 then
					Duel.SendtoHand(c,p,REASON_RULE)
				elseif e:GetLabel()==3 then
					local choice=Duel.SelectOption(tp,fu,fd)
					if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
					Duel.Remove(c,pos,REASON_RULE,p)
				end
			elseif c:IsType(TYPE_UNION) then
				if Duel.GetLocationCount(p,LOCATION_MZONE)>0 and Duel.GetLocationCount(p,LOCATION_SZONE)>0 and Duel.IsExistingMatchingCard(unchk,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil,c) then
					e:SetLabel(Duel.SelectOption(tp,equip,mzone,grave,hand,deck,ban))
				elseif Duel.GetLocationCount(p,LOCATION_MZONE)>0 then
					e:SetLabel(Duel.SelectOption(tp,mzone,grave,hand,deck,ban)+1)
				elseif Duel.GetLocationCount(p,LOCATION_SZONE)>0 and Duel.IsExistingMatchingCard(unchk,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil,c) then
					local i=Duel.SelectOption(tp,equip,grave,hand,deck,ban)
					if i>=1 then i=i+1 end
					e:SetLabel(i)
				else
					e:SetLabel(Duel.SelectOption(tp,grave,hand,deck,ban)+2)
				end
				if e:GetLabel()==0 then
					Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
					local g=Duel.SelectMatchingCard(tp,unchk,tp,LOCATION_MZONE,LOCATION_MZONE,1,1,nil,c)
					local tc=g:GetFirst()
					if tc and aux.CheckUnionEquip(c,tc) and Duel.Equip(tp,c,tc) then
						aux.SetUnionState(c)
					end
				elseif e:GetLabel()==1 then
					local choice=Duel.SelectOption(tp,fu,fd)
					if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN_DEFENSE end
					Duel.MoveToField(c,tp,p,LOCATION_MZONE,pos,true)
					c:CompleteProcedure()
				elseif e:GetLabel()==2 then
					Duel.SendtoGrave(c,REASON_RULE,p)
				elseif e:GetLabel()==3 then
					Duel.SendtoHand(c,p,REASON_RULE)
				elseif e:GetLabel()==4 then
					Duel.SendtoDeck(c,p,0,REASON_RULE)
				elseif e:GetLabel()==5 then
					local choice=Duel.SelectOption(tp,fu,fd)
					if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
					Duel.Remove(c,pos,REASON_RULE,p)
				end
			else
				if Duel.GetLocationCount(p,LOCATION_MZONE)>0 then
					e:SetLabel(Duel.SelectOption(tp,mzone,grave,hand,deck,ban))
				else
					e:SetLabel(Duel.SelectOption(tp,grave,hand,deck,ban)+1)
				end
				if e:GetLabel()==0 then
					local choice=Duel.SelectOption(tp,fu,fd)
					if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN_DEFENSE end
					Duel.MoveToField(c,tp,p,LOCATION_MZONE,pos,true)
					c:CompleteProcedure()
					if c:IsType(TYPE_DUAL) and Duel.SelectYesNo(tp,aux.Stringid(1546122,15)) then
						c:EnableDualState()
					end
				elseif e:GetLabel()==1 then
					Duel.SendtoGrave(c,REASON_RULE,p)
				elseif e:GetLabel()==2 then
					Duel.SendtoHand(c,p,REASON_RULE)
				elseif e:GetLabel()==3 then
					Duel.SendtoDeck(c,p,0,REASON_RULE)
				elseif e:GetLabel()==4 then
					local choice=Duel.SelectOption(tp,fu,fd)
					if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
					Duel.Remove(c,pos,REASON_RULE,p)
				end
			end
		elseif c:IsType(TYPE_SPELL) then
			if Duel.GetLocationCount(p,LOCATION_SZONE)>0 then
				e:SetLabel(Duel.SelectOption(tp,szone,grave,hand,deck,ban))
			else
				e:SetLabel(Duel.SelectOption(tp,grave,hand,deck,ban)+1)
			end
			if e:GetLabel()==0 then
				if c:IsType(TYPE_FIELD) or c:IsType(TYPE_CONTINUOUS) then
					local choice=Duel.SelectOption(tp,fu,fd)
					if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
					Duel.MoveToField(c,tp,p,LOCATION_SZONE,pos,true)
				elseif c:IsType(TYPE_EQUIP) and Duel.GetFieldGroup(tp,LOCATION_MZONE,LOCATION_MZONE):IsExists(f,1,nil,p,c) then
					if Duel.IsExistingTarget(f2,0,LOCATION_MZONE,LOCATION_MZONE,1,nil,c) and Duel.SelectYesNo(tp,aux.Stringid(1546122,14)) then
						Duel.MoveToField(c,tp,p,LOCATION_SZONE,POS_FACEUP,true)
						local eq=Duel.SelectMatchingCard(tp,f2,tp,LOCATION_MZONE,LOCATION_MZONE,1,1,nil,c):GetFirst()
						Duel.Equip(tp,c,eq)
					else
						Duel.MoveToField(c,tp,p,LOCATION_SZONE,POS_FACEDOWN,true)
					end
				else
					Duel.MoveToField(c,tp,p,LOCATION_SZONE,POS_FACEDOWN,true)
				end
			elseif e:GetLabel()==1 then
				Duel.SendtoGrave(c,REASON_RULE,p)
			elseif e:GetLabel()==2 then
				Duel.SendtoHand(c,p,REASON_RULE)
			elseif e:GetLabel()==3 then
				Duel.SendtoDeck(c,p,0,REASON_RULE)
			elseif e:GetLabel()==4 then
				local choice=Duel.SelectOption(tp,fu,fd)
				if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
				Duel.Remove(c,pos,REASON_RULE,p)
			end
		elseif c:IsType(TYPE_TRAP) then
			if Duel.GetLocationCount(p,LOCATION_SZONE)>0 then
				e:SetLabel(Duel.SelectOption(tp,szone,grave,hand,deck,ban))
			else
				e:SetLabel(Duel.SelectOption(tp,grave,hand,deck,ban)+1)
			end
			if e:GetLabel()==0 then
				if c:IsType(TYPE_CONTINUOUS) then
					local choice=Duel.SelectOption(tp,fu,fd)
					if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
					Duel.MoveToField(c,tp,p,LOCATION_SZONE,pos,true)
				else
					Duel.MoveToField(c,tp,p,LOCATION_SZONE,POS_FACEDOWN,true)
				end
			elseif e:GetLabel()==1 then
				Duel.SendtoGrave(c,REASON_RULE,p)
			elseif e:GetLabel()==2 then
				Duel.SendtoHand(c,p,REASON_RULE)
			elseif e:GetLabel()==3 then
				Duel.SendtoDeck(c,p,0,REASON_RULE)
			elseif e:GetLabel()==4 then
				local choice=Duel.SelectOption(tp,fu,fd)
				if choice==0 then pos=POS_FACEUP elseif choice==1 then pos=POS_FACEDOWN end
				Duel.Remove(c,pos,REASON_RULE,p)
			end
		end
		Duel.BreakEffect()
	end





	Debug.ShowHint("Click 'OK' to set your LP by using the command line. This feature does not work outside of ygopro_vs_ai_debug.exe. (Your LP will remain as 8000.)")
	Duel.BreakEffect()
	while Duel.GetFlagEffect(tp,1546122)==0 do
		local io=require("io")
		Duel.BreakEffect()
		local str=io.read()
		Duel.BreakEffect()
		local lp=tonumber(str)
		Duel.BreakEffect()
		if type(lp)=="number" and lp>0 and lp<2147483648 then
			Duel.SetLP(tp,lp)
			Duel.RegisterFlagEffect(tp,1546122,0,0,1)
		else
			Duel.BreakEffect()
			Debug.ShowHint("The number you selected was not valid (or not even a number). Try again.")
		end
	end
	Duel.ResetFlagEffect(tp,1546122)
	Debug.ShowHint("Click 'OK' to set your opponent's LP by using the command line. This feature does not work outside of ygopro_vs_ai_debug.exe. (Their LP will remain as 8000.)")
	Duel.BreakEffect()
	while Duel.GetFlagEffect(tp,1546122)==0 do
		local io=require("io")
		Duel.BreakEffect()
		local str=io.read()
		Duel.BreakEffect()
		local lp=tonumber(str,10)
		Duel.BreakEffect()
		if type(lp)=="number" and lp>0 and lp<2147483648 then
			Duel.SetLP(1-tp,lp)
			Duel.RegisterFlagEffect(tp,1546122,0,0,1)
		else
			Duel.BreakEffect()
			Debug.ShowHint("The number you selected was not valid (or not even a number). Try again.")
		end
	end
	Duel.ResetFlagEffect(tp,1546122)




	local io=require("io")
	os = require("os")
	Duel.BreakEffect()
	local tme=os.date("%Y",os.time()).."-"..os.date("%m",os.time()).."-"..os.date("%d",os.time()).." "..os.date("%H",os.time()).."-"..os.date("%M",os.time()).."-"..os.date("%S",os.time())
	local f=io.open("./single/Generated Puzzle "..tme..".lua","w+")
	local del=io.open("./single/unimportant.lua","w+")
	local slp=Duel.GetLP(tp)
	local olp=Duel.GetLP(1-tp)
	local name="[AI]Justice"
	f:write("--created using senpaizuri's puzzle maker\nDebug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI)\nDebug.SetPlayerInfo(0,"..slp..",0,0)\nDebug.SetPlayerInfo(1,"..olp..",0,0)\n")
	local g=Duel.GetFieldGroup(tp,LOCATION_DECK,0)
	if g:GetCount()>0 then
		f:write("\n--Main Deck")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",0,0,LOCATION_DECK,0,POS_FACEDOWN)")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,LOCATION_EXTRA,0)
	if g:GetCount()>0 then
		f:write("\n--Extra Deck")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",0,0,LOCATION_EXTRA,0,"..tc:GetPosition()..")")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,LOCATION_HAND,0)
	if g:GetCount()>0 then
		f:write("\n--Hand")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",0,0,LOCATION_HAND,0,POS_FACEDOWN)")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,LOCATION_GRAVE,0)
	if g:GetCount()>0 then
		f:write("\n--GY")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",0,0,LOCATION_GRAVE,0,POS_FACEUP)")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,LOCATION_REMOVED,0)
	if g:GetCount()>0 then
		f:write("\n--Banished")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",0,0,LOCATION_REMOVED,0,"..tc:GetPosition()..")")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,LOCATION_MZONE,0)
	if g:GetCount()>0 then
		f:write("\n--Monster Zones")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			if tc:GetEquipCount()>0 then
				f:write("\nlocal m_"..i.."=Debug.AddCard("..tc:GetCode()..",0,0,LOCATION_MZONE,"..tc:GetSequence()..","..tc:GetPosition()..")")
				local tg=tc:GetEquipGroup()
				local eq=tg:GetFirst()
				for b=1,tg:GetCount() do
					f:write("\nlocal eq_"..i.."_"..b.."=Debug.AddCard("..eq:GetCode()..","..eq:GetControler()..","..eq:GetControler()..",LOCATION_SZONE,"..eq:GetSequence()..","..eq:GetPosition()..")")
					del:write("\nDebug.PreEquip(eq_"..i.."_"..b..",".."m_"..i..")")
					eq=tg:GetNext()
				end
			else
				f:write("\nDebug.AddCard("..tc:GetCode()..",0,0,LOCATION_MZONE,"..tc:GetSequence()..","..tc:GetPosition()..")")
			end
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,LOCATION_SZONE,0):Filter((function(c)
		return not (c:IsFaceup() and (c:IsType(TYPE_EQUIP) or c:IsType(TYPE_UNION)))
	end),nil)
	if g:GetCount()>0 then
		f:write("\n--Spell & Trap Zones")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",0,0,LOCATION_SZONE,"..tc:GetSequence()..","..tc:GetPosition()..")")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,0,LOCATION_DECK)
	if g:GetCount()>0 then
		f:write("\n--Main Deck")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",1,1,LOCATION_DECK,0,POS_FACEDOWN)")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,0,LOCATION_EXTRA)
	if g:GetCount()>0 then
		f:write("\n--Extra Deck")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",1,1,LOCATION_EXTRA,0,"..tc:GetPosition()..")")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,0,LOCATION_HAND)
	if g:GetCount()>0 then
		f:write("\n--Hand")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",1,1,LOCATION_HAND,0,POS_FACEDOWN)")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,0,LOCATION_GRAVE)
	if g:GetCount()>0 then
		f:write("\n--GY")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",1,1,LOCATION_GRAVE,0,POS_FACEUP)")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,0,LOCATION_REMOVED)
	if g:GetCount()>0 then
		f:write("\n--Banished")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",1,1,LOCATION_REMOVED,0,"..tc:GetPosition()..")")
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,0,LOCATION_MZONE)
	if g:GetCount()>0 then
		f:write("\n--Monster Zones")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			if tc:GetEquipCount()>0 then
				f:write("\nlocal m_"..i.."=Debug.AddCard("..tc:GetCode()..",1,1,LOCATION_MZONE,"..tc:GetSequence()..","..tc:GetPosition()..")")
				local tg=tc:GetEquipGroup()
				local eq=tg:GetFirst()
				for b=1,tg:GetCount() do
					f:write("\nlocal eq_"..i.."_"..b.."=Debug.AddCard("..eq:GetCode()..","..eq:GetControler()..","..eq:GetControler()..",LOCATION_SZONE,"..eq:GetSequence()..","..eq:GetPosition()..")")
					del:write("\nDebug.PreEquip(eq_"..i.."_"..b..",".."m_"..i..")")
					eq=tg:GetNext()
				end
			else
				f:write("\nDebug.AddCard("..tc:GetCode()..",1,1,LOCATION_MZONE,"..tc:GetSequence()..","..tc:GetPosition()..")")
			end
			tc=g:GetNext()
		end
	end
	local g=Duel.GetFieldGroup(tp,0,LOCATION_SZONE):Filter((function(c)
		return not (c:IsFaceup() and (c:IsType(TYPE_EQUIP) or c:IsType(TYPE_UNION)))
	end),nil)
	if g:GetCount()>0 then
		f:write("\n--Spell & Trap Zones")
		local tc=g:GetFirst()
		for i=1,g:GetCount() do
			f:write("\nDebug.AddCard("..tc:GetCode()..",1,1,LOCATION_SZONE,"..tc:GetSequence()..","..tc:GetPosition()..")")
			tc=g:GetNext()
		end
	end
	f:write("\nDebug.ReloadFieldEnd()")
	f:close()
	del:close()

	local inFile = io.open("./single/unimportant.lua", "r")
	local inFileContents = inFile:read("*a")
	local appendFile = io.open("./single/Generated Puzzle "..tme..".lua","a")
	appendFile:write("\naux.BeginPuzzle()")
	appendFile:write(inFileContents)
	inFile:close()
	appendFile:close()
	os.remove("./single/unimportant.lua")

	Duel.BreakEffect()
	Debug.ShowHint("The script has been sucessfully exported as 'Generated Puzzle "..tme..".lua'.")
	Duel.SetLP(0,0)
end)
Duel.RegisterEffect(e1,0)

function f(c,p,ec)
	return c:CheckUniqueOnField(p)
end
function f2(tc,ec)
	return tc:IsFaceup() and ec:CheckEquipTarget(tc)
end
function unchk(c,eqc)
	return c:IsFaceup() and eqc:CheckEquipTarget(c) and aux.CheckUnionEquip(eqc,c)
end
