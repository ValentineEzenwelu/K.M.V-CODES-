/*
EZENWELU VALENTINE

DOODLE JUMP:
The game starts with the doodle generating at a random coordinate between
(0 to width-MARGIN), and it will bounce off the platforms if it hits them. The
green and blue platforms will give a normal speed but if the doodle hits the
orange ones, it will be launched with a much higher speed. The brown
platforms are hollow and will break if the doodle hits them. The user can
control where the doodle goes using ‘a’ and ‘d’ keys, moving the doodle to left
and right. Once the doodle falls off the bottom of the screen, a game over
screen will be shown and a play again button start a new game for the user. */


final int BGCOLOR = color(244,240,229); // Grid Background Color
final int LINECOLOR = color(250, 210, 200); // Grid Lines Color
final int GREENCOLOR = color(50, 200, 0); // Color Code for Green Color
final int BLUECOLOR = color(0, 50, 230); // Color Code for Blue Color
final int BROWNCOLOR = color(150, 80, 0); // Color Code for Brown Color
final int ORANGECOLOR = color(240, 180, 10); // Color Code for Orange Color
final String[] TYPES = {"Green", "Green", "Green", "Green", "Green", "Blue", "Blue", "Blue", "Brown", "Orange"}; // 50% Green, 30% Blue, 10% Brown, and 10% Orange
final float PLATFORM_WIDTH = 50; // Platform width value
final float PLATFORM_HEIGHT = 10; // Platform height value
final int NUM_PLATFORMS = 1000; // 1000 platforms generate for the game
final float MARGIN = 50; // Margin to draw platforms in range
final float G = 9.8; // The value for gravity that affects the doodle speed
final float DOODLE_HEIGHT = 50;// height of doodle
final float DOODLE_WIDTH = 50;// width of doodle 
final int DOODLE_XDIFF = 5; // the change in doodle x when moving left or right
PImage doodleLeft, doodleRight; // Image variable to store the doodle Picture
boolean gameOver;// game over boolean 
boolean lookingRight;// looking right boolean 
float doodleX, doodleY;// doodle x and y coordinates 
float doodleSpeed;// doodle speed 
float  scrollSpeed;// scroll speed 
float [] platformX;// paltform x array
float [] platformY;// platform y array 
float [] platformSpeed;// platform speed 
int [] colourSet;// color array 

void setup() {
  size(400, 700);
  doodleLeft = loadImage("doodleLeft.png"); // loading the doodle looking left image
  doodleRight = loadImage("doodleRight.png"); // loading the doodle looking right image
  startGame(); // start the game for the first time
}

void draw() {
  background(BGCOLOR);// grid background colour
  // grid lines
  stroke(LINECOLOR);
  for (int x = 0; x <= width; x += width/50) {
    line(x, 0, x, height);
  }
  for (int y = 0; y <= height; y += height/50) {
    line(0, y, width, y);
  }
  // Draw the platforms that exist and are in the range of the screen
 drawPlatform();
  // Change doodle's x and y coordinates in the direction that it needs to move
  moveDoodle();
  // Apply gravity to the doodle
  applyGravity();
 // Check for collision and make the doodle jump
  checkCollision();
  // Draw doodle
  drawDoodle();
  // Move the blue platforms
  displayGameOver();
  //restart the game 
  restartGame();
}

void drawDoodle() { // Draw doodle according to whether it is looking towards left or right
  if (lookingRight)
    image(doodleRight, doodleX, doodleY, DOODLE_WIDTH, DOODLE_HEIGHT);
  else
    image(doodleLeft, doodleX, doodleY, DOODLE_WIDTH, DOODLE_HEIGHT);
}

void startGame() { // Initialize the doodle properties and create levels
 
 
  doodleX = random(width - DOODLE_WIDTH); // Random  x start position
  doodleY = random(height/2,height - DOODLE_HEIGHT); // Random y start postion
  doodleSpeed = random(5, 10);// speed values at random between 5-10
 generatePlatform();// function to generate platform
  background(BGCOLOR);// grid background
 drawPlatform();// function to draw platform 
  applyGravity();// gravity function 
   lookingRight = true; // Doodle will start facing the right
   gameOver = false; // for checking if game is over 
}

void applyGravity() {// function to apply gravity on doodle while jumping 
  doodleY -= doodleSpeed;
  doodleSpeed -= G / 60;
}
void generatePlatform() {// function for the continious generation of platforms 
  platformX = new float[NUM_PLATFORMS];
  platformY = new float[NUM_PLATFORMS];
  colourSet = new int[NUM_PLATFORMS];
  platformSpeed = new float[NUM_PLATFORMS];

  for (int i = 0; i < NUM_PLATFORMS; i++) {
    platformX [i] = random(0, width - PLATFORM_WIDTH);
    colourSet[i] = int(random(0, TYPES.length));
    platformY[i] = height - MARGIN - 7*i*PLATFORM_HEIGHT;
    platformSpeed[i] = 0;
    if (TYPES[colourSet[i]].equals("Blue")) {
        if(random(0,1)> 0.5){
        platformSpeed[i] = 1;
        }else{
          platformSpeed[i] = -1;
        }
      }
  }
}
void drawPlatform() {// function to draw plateforms
  for (int i = 0; i < NUM_PLATFORMS; i++) {
    if (platformY[i] < height && platformY[i]+ PLATFORM_HEIGHT > 0) {
      int colour;
      if (TYPES[colourSet[i]].equals("Blue")) {
        colour = BLUECOLOR;
      } else if (TYPES[colourSet[i]].equals("Orange")) {
        colour = ORANGECOLOR;
      } else if (TYPES[colourSet[i]].equals("Brown")) {
        colour = BROWNCOLOR;
      }else{
        colour = GREENCOLOR;
      }
      fill(colour);
      rect(platformX[i], platformY[i], PLATFORM_WIDTH, PLATFORM_HEIGHT, 20);
    }
  }
   blueMovement();
}
void  blueMovement() {// function for the movement of the blue plateform 
  for (int i = 0; i < NUM_PLATFORMS; i++) {
    if (platformY[i] < height && platformY[i]+ PLATFORM_HEIGHT > 0) {
      if (TYPES[colourSet[i]].equals("Blue")) {
        if (platformX[i] <= 0 || platformX[i] >= width - PLATFORM_WIDTH) {
         platformSpeed[i] = - platformSpeed[i];
        }
        platformX[i]+= platformSpeed[i];
      }
    }
  }
}
void  scroll(){// scroll function 
  for (int i = 0; i < NUM_PLATFORMS; i++) {
    platformY[i] +=  scrollSpeed;
   
  }
}
void checkCollision() {// fuction to check for colision with platforms 
  for (int i = 0; i < NUM_PLATFORMS; i++) {
    if (platformY[i] < height && platformY[i] + PLATFORM_HEIGHT > 0) {
      if (doodleY + DOODLE_HEIGHT >= platformY[i] && doodleY <= platformY[i] + PLATFORM_HEIGHT &&
          doodleX + DOODLE_WIDTH >= platformX[i] && doodleX <= platformX[i] + PLATFORM_WIDTH) {
        if (TYPES[colourSet[i]].equals("Orange")) {
          // Collision with orange platform
          doodleSpeed = 10 + random(0, 3) * (doodleY - height / 2) / (height / 2);
           scrollSpeed = 3 * doodleSpeed;
           scroll();
        } else if (TYPES[colourSet[i]].equals("Brown")) {
          // Collision with brown platform
          platformY[i] = -PLATFORM_HEIGHT; // brown platform disappears
        } else {
          // Collision with either green or blue platform
          doodleSpeed = 5 + random(0, 3) * (doodleY - height / 2) / (height / 2);
           scrollSpeed = 1.5 * doodleSpeed;
           scroll();
        }
      }
    }
  }
}

void displayGameOver(){// function to show that game is over 
  if (doodleY > height) {
    gameOver = true;
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(#C61218);
  text("Game Over", width / 2, height / 2);
 
   fill(0);
    rect(width / 2 - 60, height / 2 + 40, 120, 40, 10);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Play Again", width / 2, height / 2 + 60);
  }
 
}


void restartGame(){// functiuon to restart the game 
  if (gameOver && mousePressed && mouseX > width / 2 - 60 && mouseX < width / 2 + 60 && mouseY > height / 2 + 40 && mouseY < height / 2 + 80) {
  startGame();
  }
}


void moveDoodle() {// function to move doodle
  if (keyPressed) {
    if (key == 'a' || key == 'A'||keyCode == LEFT) {// a and left arrow is to turn the doddle left 
      doodleX -= DOODLE_XDIFF;
      lookingRight = false;
    } else if (key == 'd' || key == 'D'||keyCode == RIGHT) {// d and right arrow is to turn the doodle right
      doodleX += DOODLE_XDIFF;
      lookingRight = true;
    }
  }
  if (doodleX < 0) {
    doodleX = width;
  } else if (doodleX > width) {
    doodleX = 0;
  }
}
