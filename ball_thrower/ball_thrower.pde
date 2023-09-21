/* Ezenwelu Valentine
 
 BALL THOWER*/

// VARIABLES DECLARATION
int ballsNum = 0;//number of balls 
float ballDiam;// ball size
float[] x;// x cordinates for ball
float[]y;// y cordinates for ball
float[]diameter;// array for diameter
color[] colourOfBall;// ball colour
float[] opacity;// opacity
boolean[] existingBall;// ball existence 
float[] xSpeed;// x cordinate speed 
float [] ySpeed;// y cordinate speed 

void setup(){
  size(500,500);// canvas
  createArrays();// function to assign arrayes and create them 
}
void draw(){
  background(0);// black
  display();// function to display the balls 
  move();// function to move balls 
  fade();// function to fade balls
}
// create array function
void createArrays() {
  x = new float[300];
  y = new float[300];
  xSpeed = new float[300];
  ySpeed = new float[300];
  diameter = new float[300];
  colourOfBall = new color[300];
  opacity = new float[300];
  existingBall = new boolean[300];
}
// function to generate ball
void generateBall(int xValue, int yValue) {
  if (ballsNum < 300) {// ball generates as long as it is less that 300
    diameter[ballsNum] = int(random(20, 50));
    colourOfBall[ballsNum] = color(random(255), random(255), random(255));
    opacity[ballsNum] = random(155,255);
    existingBall[ballsNum] = true;
    xSpeed[ballsNum] = random(-6, 6);
    ySpeed[ballsNum] = random(-6, 6);
    
    x[ballsNum] = xValue;
    y[ballsNum] = yValue;
    ballsNum++;
  }
}

//function to display ball
void display() {
  for (int i = 0; i < ballsNum; i++) {
    if (existingBall[i]) {
      fill(colourOfBall[i], opacity[i]);
      circle(x[i], y[i], diameter[i]);
    }
  }
}
//function to assign the mouse pressed to release balls 
void mousePressed() {
  for(int i =1 ; i < int(random(2,100)); i+=int(random(1,5)))
  {
  generateBall(mouseX, mouseY);
  }
}

//function to move the balls 
void move() {
  for (int i = 0; i < ballsNum; i++) {
    x[i] += xSpeed[i]; 
    y[i] += ySpeed[i]; 

     if (x[i] <= 0 || x[i] >= width) {
      xSpeed[i] = -xSpeed[i];
    }
    if (y[i] <= 0 || y[i]>= height) {
      ySpeed[i] = -ySpeed[i];
    }
  }
}
// fading ball away function 
void fade() {
  for (int i = 0; i <ballsNum; i++) {
    opacity[i] -= 1; 
    if (opacity[i] <= 0) {
      existingBall[i] = false; 
    }
  }
}
