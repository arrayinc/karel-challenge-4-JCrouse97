/* File: Challenge-4.k
 ---------------------------
Generalize the program you wrote in Challenge 3 so that Karel
is able to climb a stair-step mountain of any height and place
a flag on its top.

Thus, in addition to climbing the mountain in that exercise,
it should be able to scale a molehill or Mount Everest.
*/

//-------------------LOCAL LIBRARY---------------------

//***KAREL MUST START FACING RIGHT***

import "turns";

function toWall(){
	while(frontIsClear()){
		move();
	}
}

function up() {
	turnLeft();
	move();
	turnRight();
}

function right() {
	move();
}

function left() {
	turnAround();
	move();
	turnAround();
}

function down() {
	turnRight();
	move();
	turnLeft();
}

//-----------------------Actual Program-----------------------------

function Hike(){
	right();
	controller();
}


function ascend(){
	while(frontIsBlocked()){
		turnLeft();
		move();
		if(rightIsClear()){
			turnRight();
			move();
		} else {
			turnAround();
			move();
			turnRight();
			}
	}
}


function descend(){
	while(rightIsBlocked()){
		if(frontIsClear()){
			move();
			if(rightIsClear()){
				fall();
			} else { controller();}
		} else {controller();}
	}
}

function fall(){
	turnRight();
	move();
	turnLeft();
}

function controller(){
	while(frontIsBlocked()){
		ascend();
	}
	if(frontIsClear()){
		if(beepersInBag()){
			putBeeper();
			descend();
		}
	}
}
