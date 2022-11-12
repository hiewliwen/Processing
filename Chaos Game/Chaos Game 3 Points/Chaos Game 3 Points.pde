// Declaring global variables
// S1, S2, S3 are vectors that contain the X & Y positions of the randomly selected seeds. 
// SS is a vector that contain the X & Y position of the starting point
PVector S1, S2, S3, SS;
float currentSx, currentSy, nextSx, nextSy;	
int seedSize = 5;
 
void setup() {
	size(1024, 1024);	// set the screen to be 1024*1024 pixel large
	frameRate(10000);		// force the framerate to be 120fps
	background(0);		// set background colour to black
	randomSeeds();		// 3 random seeds and starting point location
	displaySeeds();		// display all the 4 points

	currentSx = SS.x;	//initialize the X position of the current point which is also the starting point at iteration 0.
	currentSy = SS.y;	//initialize the Y position of the current point which is also the starting point at iteration 0.

}

void draw() {
	chooseSeed();		// randomly choose the next seed location. 
	displayNewPoint(currentSx, currentSy);	// display the new point

	// if (frameCount %1000 == 0){
	// 	println(frameCount / (millis()/1000f));
	// }
}

void randomSeeds(){
	S1 = PVector.random2D();
	S2 = PVector.random2D();
	S3 = PVector.random2D();	
	SS = PVector.random2D();

// PVector.random2D() returns a float value between -1 to 1.
// Need to map the value between 0 & screensize
	SS.x = mapVector(SS.x);
	SS.y = mapVector(SS.y);
	S1.x = mapVector(S1.x);
	S2.x = mapVector(S2.x);
	S3.x = mapVector(S3.x);
	S1.y = mapVector(S1.y);
	S2.y = mapVector(S2.y);
	S3.y = mapVector(S3.y);
 }

void displaySeeds(){

	fill(255, 0, 0);
	ellipse(S1.x, S1.y, seedSize, seedSize);
	ellipse(S2.x, S2.y, seedSize, seedSize);
	ellipse(S3.x, S3.y, seedSize, seedSize);
	
	fill(0,255,0);		
	ellipse(SS.x, SS.y, seedSize, seedSize);
}

// Function that performs the mapping. 
// It takes in a float value and return the float mapped value. 
float mapVector(float S){
	float new_S = map(S, -1, 1, 0, width);
	return new_S;
}

// Choose a random number between 1 and 3 inclusive. 
// 1 will correspond to Seed 1 and so on.
void chooseSeed(){
	int x = (int) random(1, 4);

	switch (x) {
		case 1:
			nextSx = S1.x;
			nextSy = S1.y;
			break;

		case 2:
			nextSx = S2.x;
			nextSy = S2.y;
			break;

		case 3:
			nextSx = S3.x;
			nextSy = S3.y;
			break;
	}

	// Take the mid point value between the current point & the chose point. 
	// Then set the resultant point to current point 
	currentSx = (currentSx + nextSx)/2;
	currentSy = (currentSy + nextSy)/2;
}

void displayNewPoint(float x, float y){
	fill(255);
	ellipse(x, y, 2, 2);
}