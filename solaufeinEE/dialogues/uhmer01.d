REPLACE ~UHMER01~

IF ~~ THEN BEGIN 5 // from: 8.0 4.1 1.1
  SAY #32640 /* ~Always willing to satisfy a customer...with gold, that is.~ */
  IF ~GlobalGT("SolaTalk","GLOBAL",13)~ THEN DO ~StartStore("wwmer01",LastTalkedToBy(Myself))~ EXIT
  IF ~!GlobalGT("SolaTalk","GLOBAL",13)~ THEN DO ~StartStore("uhmer01",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN 12 // from: 11.0
  SAY #32663 /* ~More than pleased to, <SIRMAAM>.~ */
  IF ~GlobalGT("SolaTalk","GLOBAL",13)~ THEN DO ~StartStore("wwmer01",LastTalkedToBy(Myself))~ EXIT
  IF ~!GlobalGT("SolaTalk","GLOBAL",13)~ THEN DO ~StartStore("uhmer01",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN 15 // from: 14.0
  SAY #38049 /* ~Of course.  Help yourself.~ */
  IF ~GlobalGT("SolaTalk","GLOBAL",13)~ THEN DO ~StartStore("wwmer01",LastTalkedToBy(Myself))~ EXIT
  IF ~!GlobalGT("SolaTalk","GLOBAL",13)~ THEN DO ~StartStore("uhmer01",LastTalkedToBy(Myself))~ EXIT
END

END
