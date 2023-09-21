/* Ezenwelu Valentine

 FROG HOP GAME */

//Global varibles decleration
int level =1;// game level
int bandHeight;// game board height
float frogX;// x cordinate of frog
float frogY;// y cordinate of frog
float frogDiam;//size of frog
float offset;// to change hazards locations
boolean objectInCanvas = false;// objects that display on canvas
int frogJump;// distance of the frog's jump
float spacing;// spacing
float hazardSize;// size of hazard
float offSetChange = 0.75;// change of offset
float[] obstaclesX;// obstacles x coodinates
float[] obstaclesY;// obstacles Y axis coodinates
boolean objectOverlap;// over lap of objects
boolean gameOver = false;
boolean detectWin = false;//to detect win and change level


void setup() {
  fullScreen();// full screen mode
  //variables assigning
  bandHeight = height/(level+4);//
  frogX = width/2;
  frogY = height -(bandHeight/2);
  frogDiam = bandHeight/3;
  frogJump = bandHeight;
  spacing = bandHeight*3;
  hazardSize = bandHeight/2;
  obstaclesX = new float[level + 2];
  obstaclesY = new float[level + 2];
  createObstacles();
  offset = 0.0;
}

void draw() {
  drawWorld();// the board of the game
  drawFrog(frogX, frogY, frogDiam);// draw frog function
  drawHazards();// draw hazard function
  winGame();// function to win game
  gameOver();// game over function
}

//functiobn to draw the world/ board o the game
void drawWorld() {
  // bands of the world
  noStroke();// no lines
  fill(#DB7E04);//light brown
  rectMode(CORNER);
  rect(0, 0, width, bandHeight);// top band

  for (int i = 1; i <= level+4; i++) {
    fill(#6785B7);// light blue
    rect(0, bandHeight*i, width, bandHeight);// middle band
  }
  fill(#DB7E04);// light brown
  rect(0, (level + 3)*bandHeight, width, bandHeight);// buttom band
}

// function to draw the frog
void drawFrog(float x, float y, float diam) {
  fill(#0C9032);// green
  circle(x, y, diam);// frog
}
// objects on display in canvas
boolean objectInCanvas(float x, float y, float diam) {

  return x - diam / 2 >= 0 && x + diam / 2 <= width && y - diam / 2 >= 0 && y + diam / 2 <= height;
}

//function to move the frog
void moveFrog(float xChange, float yChange) {
  if (frogY < frogJump) {
    frogJump = bandHeight/2;// frog moves half of bandheight
  }

  float newFrogX = frogX+ xChange;
  float newFrogY =frogY + yChange;
  if (objectInCanvas(newFrogX, newFrogY, frogDiam)) {
    frogX = newFrogX;
    frogY = newFrogY;
  }
}
// keys for frog movement
void keyPressed() {
  if (!gameOver) {
    if (key == 'w' || key == 'W' || key == 'i' || key == 'I' || keyCode == UP) {// to move up
      moveFrog(0, -frogJump);
    } else if (key == 's' || key == 'S' || key == 'k' || key == 'K' || keyCode == DOWN) {// to move down
      moveFrog(0, frogJump);
    } else if (key == 'a' || key == 'A' || key == 'j' || key == 'J' || keyCode == LEFT) {// to kove left
      moveFrog(-frogJump, 0);
    } else if (key == 'd' || key == 'D' || key == 'l' || key == 'L' || keyCode == RIGHT) {// to move right
      moveFrog(frogJump, 0);
    }
  }
}
// function to create game obstacles
void createObstacles() {
  obstaclesX= new float[level + 2];
  obstaclesY= new float[level + 2];
  int numObstacles = level + 2;
  float spacing = bandHeight / (numObstacles - 1);
  for (int i = 0; i < numObstacles; i++) {
    obstaclesX[i] = 0;
    obstaclesY[i] =(height - (bandHeight * (level+2 )))/2 + bandHeight/2;
  }
}
// boolean to draw hazard
boolean drawHazard(int type, float x, float y, float size) {
  boolean overlapped = objectsOverlap(x, y, frogX, frogY, size, frogDiam);
  if (type==0) {
    fill(#FFFFFF);// white
    circle(x, y, size);
  } else if (type==1) {
    fill (0);// black
    rectMode(CENTER);
    rect(x, y, size, size);
  } else if (type==2) {
    fill(#E01414);//light red
    circle(x, y, size);
  }
  return overlapped;
}

// boolean for drawing of all the hazards
boolean drawHazards() {

  float startY = (height - (bandHeight*(level+2)))/2 + bandHeight/2;
  boolean frogOverlapped = false;
  for (int i = 0; i < obstaclesX.length; i++) {
    int hazardType = 2 - (i%3);
    float offset1 = (hazardType + 3)*offset;
    float hazardSpacing = ((obstaclesX.length - i) + 2) * bandHeight;
    for (float x = obstaclesX[i]; x<width+bandHeight*10; x+=hazardSpacing) {
      if (hazardType%2 == 0) {
        offset1 = offset;
      } else {
        offset1 = -offset;
      }
      float y = obstaclesY[i] + i*bandHeight;
      float hazardX = x + hazardSpacing * offset1/bandHeight;
      float hazardY = startY + i*bandHeight;
      drawHazard(hazardType, hazardX, hazardY, hazardSize);
      boolean overlapped = drawHazard(hazardType, hazardX, hazardY, hazardSize);

      if (overlapped) {
        frogOverlapped = true;
      }
    }
  }
  return frogOverlapped;
}
// function for moving hazards
void moveHazards() {
  offset += offSetChange;
  if (offset > bandHeight) {
    offset = offset%bandHeight;
  }
}
//function for message dispaly on top of the canvas
void displayMessage(String m) {
  float textSize = bandHeight/2;
  float x = width/2;
  float y = bandHeight/2;

  textAlign(CENTER, CENTER);
  textSize(textSize);
  fill(0);
  text(m, x, y);
}
// function to detect win in a level in the game
boolean detectWin() {
  return frogY <= bandHeight;
}

//function to reset the position of the frog after detecting win
void resetFrogPosition() {
  frogX = width / 2;
  frogY = height - bandHeight / 2;
}

// function to change level after detecting win
void levelUp() {
  level++;
  bandHeight = height/(level+4);
  frogDiam = bandHeight/2;
  hazardSize = bandHeight*0.8;
  offset = bandHeight;
}

// boolean for overlapping of objects
boolean objectsOverlap(float x1, float y1, float x2, float y2, float size1, float size2) {
  float distance = dist(x1, y1, x2, y2);
  float radiusSum = size1 / 2 + size2 / 2;
  return distance < radiusSum;
}

// function for game over
void gameOver() {
  if (!gameOver) {
    displayMessage("LEVEL " + level);
    if (drawHazards()) {
      gameOver = true;
    }
    moveHazards();
  } else {
    displayMessage("GAME OVER");
  }
}

// function for level win
void winGame() {
  if (detectWin()) {
    levelUp();
    resetFrogPosition();
    createObstacles();
  }
}
