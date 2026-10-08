//////////////////////////////////////////////////////////////////////////
// Let the TOB fate spirit know about Solaufein
//////////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM FATESP 6
  IF ~!Dead("Solaufein")
!Dead("sola")
!InMyArea("solaufein")
!InMyArea("sola")
Global("SolaufeinSummoned","GLOBAL",0)~ THEN 
   REPLY @1 // ~Bring me Solaufein, the drow fighter/mage.~ 
    DO ~CreateVisualEffect("SPPORTAL",[1999.1218])
Wait(2)
CreateCreature("sola17",[1999.1218],0)
ActionOverride("Solaufein",AddXPObject(Myself,1000000))
ActionOverride("Sola",AddXPObject(Myself,1000000))
SetGlobal("SolaufeinSummoned","GLOBAL",1)~ GOTO 8
END
