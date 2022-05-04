PlayAgain:
HighScore=0
Close
cls

'Animal Guessing Program
'The computer will try to guess the animal the user is thinking of by using
'Artificial Intelligence technigues.
'The computer will have the ability to learn about animals.
'For most answers, a multitude of answers will be available.

'***********************
'Set up Variables/Screen
'***********************
Color 2,0
Open "Animals.IDX" for input as #1

'Give Introduction
'=================
Locate 1,36:Print "Animal"
Print "Please think of an animal."
Delay 3
Print
Print "Now, please answer the questions. When that has been completed, Roland"
Print "will try to guess the animal you were thinking of."
Print
Color 14,0

'****************************
'Let's start asking questions
'****************************
Line Input "1.Does it have a tail?";Temp$
	TAIL$=Ucase$(Temp$)
	If tail$="Y" then tail$="YES"
	If Tail$="N" Then Tail$="NO"
Line Input "2.How Many Legs Does It Have?";Ulegs$
	Legs$=ucase$(ulegs$)
	If legs$="0" then legs$="NONE"
Line Input "3.How Many eyes does it have?";Ueyes$
	Eyes$=ucase$(Ueyes$)
	If Eyes$="0" then Eyes$="NONE"	
Line Input "4.Can it fly?";Temp$
	Fly$=Ucase$(Temp$)
	If Fly$="Y" then Fly$="YES"
	If Fly$="N" Then Fly$="NO"

Line Input "5.Can it swim?";Temp$
	Swim$=Ucase$(Temp$)
	If Swim$="Y" then Swim$="YES"
	If Swim$="N" Then Swim$="NO"

Line Input "6.Can it go on ground?";Temp$
	Ground$=Ucase$(Temp$)
	If Ground$="Y" then Ground$="YES"
	If Ground$="N" Then Ground$="NO

Line Input "7.What type of skin does it have?";USkin$
	Skin$=ucase$(Uskin$)

Line Input "8.What does it like to eat?";Udiet$
	Diet$=ucase$(Udiet$)

Line Input "9.Does it have webbed feet and scaled legs?";Temp$
	Webbed$=Ucase$(Temp$)
	If Webbed$="Y" then Webbed$="YES"
	If Webbed$="N" Then Webbed$="NO

Line Input "10.How many toes does it have?";Utoes$
	Toes$=Ucase$(Utoes$)
	If Toes$="0" then Toes$="NONE"	
Line Input "11. How many body segments does it have?";USegments$
	Segments$=ucase$(Usegments$)
	If Segments$="0" then Segments$="NONE"	
'**********************
'Start Pattern Matching
'**********************

'Find out how many animals are known
'===================================

Input #1,A$
B=Val(A$)


'SetUp Variables
'===============
HighScore=0    			'Shows the highest number of matches for an animal.
NumberOfCloses=1		'Shows how many close matches have been made

'Start looking for the closest match
'===================================
For Z=1 to B
	CurrentScore=0		'Shows how close the animal in file to users animal is.
	Close
	Open "ANI"+right$(Str$(Z),len(str$(Z))-1)+".dat" for input as #2
	Input #2,PatTail$
	Input #2,PatLegs$
	Input #2,PatEyes$
	Input #2,PatFly$
	Input #2,PatSwim$
	Input #2,PatGround$
	Input #2,PatSkin$
	Input #2,PatWebbed$
	Input #2,PatSegments$
	Input #2,PatToes$
	Input #2,PatDiet$
	Input #2,PatAnimal$
If PatTail$=Tail$ then currentscore=currentscore+1
If PatLegs$=legs$ then currentscore=currentscore+1
If PatEyes$=Eyes$ then currentscore=currentscore+1
If PatFly$=Fly$ then currentscore=currentscore+1
If PatSwim$=Swim$ then currentscore=currentscore+1
If PatGround$=Ground$ then currentscore=currentscore+1
If PatSkin$=Skin$ then currentscore=currentscore+1
If PatDiet$=Diet$ then currentscore=currentscore+1
If PatToes$=Toes$ then currentscore=currentscore+1
If PatSegment$=Segment$ then currentscore=currentscore+1
If PatWebbed$=Webbed$ then currentscore=currentscore+1

If CurrentScore>HighScore then
	HighScore=CurrentScore
	ClosestAnimals$=PatAnimal$
	End If
Next

Color 2,0
	Print "Was your animal a "+closestanimals$+"?"
	Input "Y/N";endd$
	if ucase$(endd$)="Y" or ucase$(endd$)="YES" then print "It is therefore obvious that my intelligence is superior from my counterparts!":Goto AskPlayAgain

'Add new animal if needbe
'========================
print
Line Input"What animal had you chosen?";RealAnimal$
Animal$=ucase$(RealAnimal$)
Close
Open "Animals.IDX" for output as #1
write #1,str$(b+1)
close
Open "ANI"+right$(Str$(b+1),len(str$(b+1))-1)+".dat" for Output as #2
Write #2, Tail$
Write #2, Legs$
Write #2, Eyes$
Write #2, Fly$
Write #2, Swim$
Write #2, Ground$
Write #2, Skin$
Write #2, Webbed$
Write #2, Segments$
Write #2, Toes$
Write #2, Diet$
Write #2, Animal$


cls
AskPlayAgain:
Line Input"Thankyou. Do you wish to play again?";PlayAgain$
If ucase$(PlayAgain$)="Y" or ucase$(playAgain$)="YES" then goto PLAYAGAIN
Stop