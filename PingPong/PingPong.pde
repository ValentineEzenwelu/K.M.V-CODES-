/* Ezenwelu valentine 
*/
float ballX;//ball position on x
float ballY;// ball position on y
int ballSize;// ball size
float ballSpeed;// ball speed
int rightPaddleX;// right paddle
int rightPaddleY;// right paddle 
int leftPaddleX; // left paddle
int leftPaddleY;// left paddle
int paddleWidth, paddleHeight;// paddle width and height
float speedX;//ball speed
float speedY;// ball speed
float angleX;// ball angle
float angleY;// ball angel
int paddleSpeed;// paddle speed
int mouseScore = 0;// mouse score
int keyScore = 0;// key score
final int MAX_SPEED = 7;
final int MIN_SPEED = 8;
int winNumber = 11;// number to win
boolean leftClick, rightClick,up,down;
float distanceR;// right distance 
float distanceL;// left ditance
boolean gameOver;// gameover

void setup(){
  size(1000,800);// canvas size
  ballX = width/2;// x coordinate of ball
  ballY = height/2;// y cordinate of ball
  angleX= random(0, TWO_PI);// ballX angle
  angleY = random(0,90);// ballY angle
  ballSize = 15;//size of ball
  ballSpeed = 4;// ball speed
  speedX = ballSpeed*cos(angleX);// ball direction x and y 
  speedY = ballSpeed*sin(angleY*2);
  
   rectMode(CENTER); // paddle dimensions
  leftPaddleX = 10;
  leftPaddleY = height/2; 
  rightPaddleX = width - 10;
  rightPaddleY = height/2; 
  paddleWidth = 10;
  paddleHeight = 100;
  paddleSpeed = 4;
}


void draw(){
  background(#052150);
  drawGame();
  movePaddles();
  stopPaddles();
  bounceOffPaddles();
  moveBall();
  ballSpeed();
  ballBounce();
  
  gameStop();
  gameOverCheck();
  
  
  
}



void drawGame(){
  fill(255);//white
  circle(ballX, ballY, ballSize);
    fill(#43AFF5);//sky blue
    rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);
    rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);
    drawScore();
}
    
void drawScore(){ 
  textSize(20);
  fill(#c3c3d6);
  String toPrint = "Keyboard: " + keyScore;  
  text(toPrint, width/4-textWidth(toPrint)/2, 50);
  
  toPrint = "Mouse: " + mouseScore; 
  text(toPrint, width*3/4-textWidth(toPrint)/2, 50);
  
}



void movePaddles(){// moving the paddles with the keyboard and mouse
  if (up){
     leftPaddleY = leftPaddleY - paddleSpeed;//move left paddle up
  }
  
  if (down){
    leftPaddleY = leftPaddleY + paddleSpeed;// move left paddle down
  }
  
  
  if (leftClick){
    rightPaddleY = rightPaddleY - paddleSpeed;// move right paddle up
  }
  
  if (rightClick){
     rightPaddleY = rightPaddleY + paddleSpeed;// move right paddle down
  }
}
void keyPressed() { // when key is pressed paddle moves


  if (keyCode == UP) { 
    up = true;
  }
  

  if (keyCode == DOWN) {
    down = true;
  }
}


void keyReleased() { // when key is realsed paddle stops 
   if (keyCode == UP) {
    up = false;
  }
  
  if (keyCode == DOWN) {
    down = false;
  }
  
}

void mousePressed() { // when mouse is pressed paddle moves
  
  if (mouseButton == LEFT) {
    leftClick = true;
  } 
  
  if (mouseButton == RIGHT) {
    rightClick = true;
  }
}


void mouseReleased() { // when mouse is released paddle stops

    if (mouseButton == LEFT) {
    leftClick = false;
  }
  
  if (mouseButton == RIGHT) {
    rightClick = false;
  }
}

void stopPaddles() { // stop paddle from leaving canvas
  
  if (leftPaddleY - paddleHeight/2 < 0) {//left paddle 
    leftPaddleY = leftPaddleY + paddleSpeed;
  }
  
  if (leftPaddleY + paddleHeight/2 > height) {
    leftPaddleY = leftPaddleY - paddleSpeed;
  }
  

  if (rightPaddleY - paddleHeight/2 < 0) {//right paddle
    rightPaddleY = rightPaddleY + paddleSpeed;
  }
  if (rightPaddleY + paddleHeight/2 > height) {
    rightPaddleY = rightPaddleY - paddleSpeed;
  }
}



void moveBall(){// make the ball move 
  ballX = ballX + speedX;// ball moves horizontally
  ballY = ballY + speedY;// ball moves vertically
}

 void ballSpeed() { // ball speed in motion 
 
   distanceL = abs( ballY - leftPaddleY);// ball distance to the left
   distanceR = abs(ballY - rightPaddleY);// ball distance to the right
   
     if ( (ballX - ballSize <= leftPaddleX + paddleWidth/2) && distanceL <= 10 ) {
       speedX = MIN_SPEED;
     } 
     if ( ballX - ballSize <= leftPaddleX + paddleWidth/2 && distanceL >20 && distanceL <= 45) {
       speedX = MAX_SPEED;
     } 
     
     if ((ballX +ballSize >= rightPaddleX - paddleWidth/2) && distanceL <= 10)  {
       speedX = -MIN_SPEED;
     } 
     if ( ballX + ballSize/2 >= rightPaddleX - paddleWidth/2 && distanceR >20 && distanceL <= 45) {
       speedX = -MAX_SPEED;
     } 
}

void ballBounce() {  // make ball bounce off the screen 

    if (ballX > width-ballSize/2) { 
    // ball reset
    ballX = width/2;
    ballY = height/2;
    speedX = -speedX;

    keyScore = keyScore+1; 
    
  } else if (ballX < 0 + ballSize/2) { 
   // ball reset
    ballX = width/2;
    ballY = height/2;
    speedX = -speedX;
    
    mouseScore = mouseScore + 1;
  }
  
  if (ballY > height - ballSize/2) { // bounce of bottom wall
    speedY = -speedY;
  } else if (ballY < 0 + ballSize/2) {// bouce off top wall
    speedY = -speedY;
  }  

}

void bounceOffPaddles() { // make ball bouce off paddles
// all bouce off left paddle
 if (ballX - ballSize <= leftPaddleX + paddleWidth/2 &&  ballY - ballSize/2 <= leftPaddleY + paddleHeight/2 && ballY - ballSize/2 >= leftPaddleY - paddleHeight/2) {
   if (speedX < 0) {
     speedX = -speedX;
   }
 }
 
 //ball bounce off right paddle
 if (ballX + ballSize/2 >=  rightPaddleX-paddleWidth/2 && ballY + ballSize/2 <= rightPaddleY + paddleHeight/2 && ballY + ballSize/2 >= rightPaddleY - paddleHeight/2) {
  if (speedX>0) {
   speedX = -speedX;
   }
 }
}
 

void gameOverCheck() { // check when gameOver is true
  if (mouseScore == winNumber) {
    gameOver = true;
  }
  
  if (keyScore == winNumber) {
    gameOver = true;
  }
}

void gameStop() { // stop game when game is over
  if (gameOver) {
    speedX = 0; 
    speedY = 0;
    paddleSpeed =0;
  }
}
