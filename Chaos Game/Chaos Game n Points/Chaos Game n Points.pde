// Declaring global variables
// n is the number of randomSeeds to spawn
// randomSeed is an array that contains all the randomSeed locations
int n = 5;
int seedSize = 5;
int iteration = 1000000;
int [][] randomSeed = new int[n][2];
int [][] startSeed = new int[1][2];
int currentSx, currentSy, nextSx, nextSy;	

 
void setup() {
//	size(1000, 1000);	// set the screen to be 1024*1024 pixel large
	fullScreen();
	translate(width/2, height/2);
	frameRate(10000);	// force the framerate to be 10000 fps
	background(0);		// set background colour to black
	randomSeeds();		// n random seeds and starting point location
	displaySeeds();		// display all n points and starting location

	currentSx = startSeed[0][0];	//initialize the X position of the current point which is also the starting point at iteration 0.
	currentSy = startSeed[0][1];	//initialize the Y position of the current point which is also the starting point at iteration 0.
}


void draw() {
	for (int t = 0; t < iteration; ++t) {
		chooseSeed();		// randomly choose the next seed location. 
		displayNewPoint(currentSx, currentSy);	// display the new point	
	}
	noLoop();
}


void randomSeeds(){
	for (int i = 0; i < n; ++i) {
		randomSeed[i][0] = floor (random (-width/2, width/2));
		randomSeed[i][1] = floor (random (-height/2, height/2));
	}

	startSeed[0][0] = floor (random (-width/2, width/2));
	startSeed[0][1] = floor (random (-height/2, height/2));
}


void displaySeeds(){
	fill(255, 0, 0);
	for (int i = 0; i < n; ++i) {
		ellipse(randomSeed[i][0], randomSeed[i][1], seedSize, seedSize);
	}
	fill(0,255,0);		
	ellipse(startSeed[0][0], startSeed[0][1], seedSize, seedSize);
}


// Choose a random number between 1 and 3 inclusive. 
// 1 will correspond to Seed 1 and so on.
void chooseSeed(){
	int r = floor (random(0, n));
	nextSx = randomSeed[r][0];
	nextSy = randomSeed[r][1];

	// Take the mid point value between the current point & the chose point. 
	// Then set the resultant point to current point 
	currentSx = int ((currentSx + nextSx)/2);
	currentSy = int ((currentSy + nextSy)/2);
}


void displayNewPoint(float x, float y){
	fill(255);
	ellipse(x+width/2, y+height/2, 2, 2);
}
