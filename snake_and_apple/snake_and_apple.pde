/*
  EZENWELU VALENTINE 
  
  SNAKE GAME:
There is a “snake” (a line of green circles) which moves around 
the canvas, controlled by the keyboard. The J and A keys will 
make the snake turn left, and D and L will make it turn right. 
Since you control how it turns, not the direction it moves, this 
makes it tricky at first. The snake does not move smoothly. 
Instead, every few frames, a new circle is added to the “head” 
end, and the circle at the “tail” end disappears. There are some 
“apples” (red circles). When the snake “eats” an apple, the snake 
grows. It doesn’t grow instantly, but the circle at the tail will not 
disappear the next few times that the head moves. The snakecannot go off the canvas, or “bite itself”, or the game is over. If the snake eats all of the apples, 
then a new level begins, where the snake is longer, moves faster, grows faster, and has more apples 
to eat.
*/

//VARIABLES DECLARATION

final int ROWS=20, COLS=15; //The number of rows and columns of squares
final int SQ_SIZE=40;       //The size of each square in pixels
int startingLength = 3;// DEGINNING LENGTH OF THE SNAKE 
int currentLength;// LENGHT OF THE SNAKE AS APPLES ARE EATEN 
int[] xCoordinate = new int [COLS];// coordinate of snake x axis 
int[] yCoordinate = new int [ROWS];// coordinate of snake y axis 
int frameCounter = 0;
int snakeSpeed = 30;// speed of the snake 
int[] testX, testY;
int direction = 0;
final int[] xMovement = {0, -1, 0, +1}; //X change for down, left, up, right
final int[] yMovement = {+1, 0, -1, 0}; //Y change for down, left, up, right
int startingApples =4;// level 1 apple number
int currentApples;// number of apples as game progress
int[] appleX = new int[startingApples];// x coordinates of apple
int[] appleY = new int [startingApples];// x coordinates of apple
int snakeGrowth = 3;// rate of ssnake growth
boolean growth = false;
int tailIndicator ;
boolean gameOver = false;
int currentLevel = 1;
boolean newLevel = false;

void setup() {
  size(600, 800); //MUST be COLS*SQ_SIZE,ROWS*SQ_SIZE CANVAS SIZE
  resetSnake();// FUNCTION TO RESET SNAKE
  resetApples();// FUNCTION TO RESET APPLE 
}

void draw() {
  background(#06279B);// NAVY BLUE
  gameOver();// GAME OVER FUNCTION
 
}

//FUCTION TO DRAW CRICLES
void drawCircles(int[] x, int[] y, int n, int colour) {
  for (int i=0; i<n; i++) {
    if (i < x.length && i < y.length) {
      int pixelX = x[i] * SQ_SIZE + SQ_SIZE / 2; // Convert grid coordinates to pixels
      int pixelY = y[i] * SQ_SIZE + SQ_SIZE / 2;  // Convert grid coordinates to pixels
      fill(colour);//parameters
      circle(pixelX, pixelY, SQ_SIZE);//draw circle/ parameters
    }
  }
}

//function to create the snake
void fillArray (int[]a, int n, int start, int delta) {

  for (int i=0; i<=n; i++) {
    a[i] = start + i*delta;
  }
}

//function to reset the snake
void resetSnake() {
  currentLength = startingLength + currentLevel;

  fillArray(xCoordinate, currentLength, COLS/2, 0);
  fillArray(yCoordinate, currentLength, -1, -1);

  if (newLevel) {
    direction = yMovement[1];
  }
  moveSnake(0, 1);
  tailIndicator  = startingLength -1;
}


// function to move snake 
void moveSnake(int addX, int addY) {
  for (int i = currentLength - 1; i > 0; i--) {
    xCoordinate[i] = xCoordinate[i - 1];
    yCoordinate[i] = yCoordinate[i - 1];
  }
  xCoordinate[0] += addX; //change the x-coordinate of the snake head
  yCoordinate[0] += addY; //change the x-coordinate of the snake head

  if (growth) { //if the snake is allowed to grow,
    currentLength++;
    tailIndicator ++;
    growth = false;
  }
  if (currentLength >= xCoordinate.length) {
    expandSnakeArrays();
  }
}


void addSnake() {
  currentLength++;
  if (currentLength > xCoordinate.length) {
    expandSnakeArrays();
  }
  tailIndicator ++;
}

void expandSnakeArrays() {
  int newSize = xCoordinate.length + snakeGrowth;

  int[] newxCoordinate = new int[newSize];
  int[] newyCoordinate = new int[newSize];

  for (int i = 0; i < xCoordinate.length; i++) {
    newxCoordinate[i] = xCoordinate[i];
    newyCoordinate[i] = yCoordinate[i];
  }
  xCoordinate = newxCoordinate;
  yCoordinate = newyCoordinate;
}
void keyPressed() {
  //When the user clicks the L or D keys also left arrow, the snake should turn clockwise, while pressing the A or J keys as well as right causes the snake to turn counter-clockwise.
  if (key == 'L' || key == 'l'|| key =='D'|| key == 'd'|| keyCode == LEFT) {
    direction = (direction + 1) % 4; // Turn the snake clockwise
  } else if (key == 'A' || key == 'a' || key == 'j' || key == 'J'||keyCode == RIGHT) {
    direction = (direction + 3) % 4; // Turn the snake counter-clockwise
  }
}
// function to create and return the array n 
int [] randomArray(int n, int max) {// randon array parameters
  int[] values = new int [n];
  for (int i=0; i<n; i++) {
    values[i] = (int) random(max+1);
  }
  return values;
}

//function to reset apple 
void resetApples() {

  currentApples = startingApples + currentLevel;

  appleX = new int[currentApples];
  appleY = new int[currentApples];
  int[] randomX = randomArray(currentApples, COLS-1) ;
  int[] randomY = randomArray(currentApples, ROWS - 1) ;

  for (int i = 0; i<currentApples; i++) {
    appleX[i] = randomX[i];
    appleY[i] = randomY[i];
  }
}


// function to search fo pair of coordinate in the first n element of array x and y
int searchArrays(int[] x, int[]y, int n, int start, int keyX, int keyY) {
  for (int i = start; i<n; i++) {
    if (x[i] == keyX && y[i] == keyY) {
      return i;
    }
  }
  return -1;
}

// function to delete apple after eaten 
void deleteApple(int eatenApple) {

  for (int i = eatenApple; i < currentApples - 1; i++) {
    appleX[i] = appleX[i + 1];
    appleY[i] = appleY[i + 1];
  }
  currentApples--;
}
//fuction to check for apple collision 
void checkAppleCollisions() {
  int index = searchArrays(appleX, appleY, currentApples, 0, xCoordinate[0], yCoordinate[0]);

  if (index != -1) {
    deleteApple(index); // Delete the apple at the collision index
    currentLength++;
  }

  if (currentApples == 0 && !newLevel) {
    newLevel();
  }
}

boolean detectCrash() {

  int headX = xCoordinate[0]; // X coordinate of the snake's head
  int headY = yCoordinate[0]; // Y coordinate of the snake's head

  // Check if the snake's head is outside the canvas boundaries
  if (headX < 0 || headX >= COLS || headY < 0 || headY >= ROWS) {
    return true; // Snake has left the canvas
  }

  // Check if the snake's head collides with any other part of the snake
  for (int i = 1; i < currentLength; i++) {
    if (headX == xCoordinate[i] && headY == yCoordinate[i]) {
      return true; // Snake has bitten itself
    }
  }

  return false; // No crash detected
}

// function to move to new level 
void newLevel() {

  if (!newLevel) {
    newLevel = true;
    currentLevel++;
    resetSnake();
    snakeSpeed +=5;
    resetApples();

    textAlign(CENTER);
    fill(0);
    textSize(50);
    text("level" + currentLevel, width/2, 100);
  }
  newLevel = false;
}
//  gameOver function 
void gameOver(){
   if (!gameOver) {
    if (frameCounter % snakeSpeed == 0) {
      moveSnake(xMovement[direction], yMovement[direction]);
      checkAppleCollisions();
    }
    frameCounter++;
    
    if (detectCrash()) {
      gameOver = true;
      textAlign(CENTER);
      fill(0);
      textSize(50);
      text("GAME OVER", width/2, height/2);
      noLoop();
    }

    if (currentApples == 0) {
      newLevel();
    }
  }


  drawCircles(xCoordinate, yCoordinate, currentLength, #219B06);//snake parameters 
  drawCircles(appleX, appleY, currentApples, #9B060B);// apple parameters
}
