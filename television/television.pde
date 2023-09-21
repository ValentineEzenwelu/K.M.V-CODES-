/* Ezenwelu Valentine
 
 television
 */
import javax.swing.JOptionPane;
float tvX;// x cordinate for tv
float tvY;//y cordinate for tv
float tvHeight;// height of tv
float tvWidth;// width of tv
float screenX;// x cordinate of screen
float screenY;// y cordinate of screen
float screenWidth;// screen width
float screenHeight;//screen height
float buttonSize;// size of buttons
float button1X;// x cordinate for colour button
float button2X;// x cordinate for sketch button
float  button3X;// x cordinate for type button
float button1Y;// y cordinate for colour button
float  button2Y;//y cordinate for sketch button
float  button3Y;//  y cordinate for type button
float button4X;// x cordinate for reset button
float button4Y;// y cordinate for reset button
float buttonWidth;// button width
float buttonHeight;// button height
float stand1X;// tv stand 1
float stand1Y;
float stand1X2;
float stand1Y2;
float stand2X;//tv stand 2
float stand2Y;
float stand2X2;
float stand2Y2;
float stand3X;// tv stand 3
float stand3Y;
float stand3X2;
float stand3Y2;
float stand4X;// tv stand 4
float stand4Y;
float stand4X2;
float stand4Y2;
float hanger1X;//frame hanger
float hanger1Y;
float hanger1X2;
float hanger1Y2;
float hanger2X;
float hanger2Y;
float hanger2X2;
float hanger2Y2;
float frameX;// frame
float frameY;
float frameSize;// frame size
float sunX;// sun picture
float sunY;
float sunSize;// sun size
float waterX;// water picture
float waterY;
float waterWidth;//water width
float waterHeight;//water height
float groundX;// ground
float groundY;
float groundWidth;
float groundHeight;
String colour = "  colour";//colour
String sketch = "sketch";//sketch
String type = "type";//type
String Reset = "reset";//reset
float antenna1X;// tv antenna
float antenna1Y;
float antenna1X2;
float antenna1Y2;
float antenna2X;
float antenna2Y;
float antenna2X2;
float antenna2Y2;
Boolean colourFunction= false;// colour function
Boolean sketchFunction = false;// sketch function
Boolean typeFunction = false; // type function
Boolean resetFunction = false;// reset function


void setup() {
  size(1000, 1000);//canvas
  background(#AF6B17);//brown
  //variables declaration
  tvX = width/5;
  tvY = height/5;
  tvWidth = width/1.7;
  tvHeight = height/2.64;
  screenX = width/3.7;
  screenY = height/4.5;
  screenWidth = width*5/12;
  screenHeight = height/4;
  button1X = width/1.35;
  button1Y = height/3.6;
  button2X = width/1.35;
  button2Y = height/2.57;
  button3X = width/1.35;
  button3Y = height/2;
  button4X = width/2.5;
  button4Y = height/2.1;
  buttonWidth = width/6;
  buttonHeight = height/18;
  stand1X = width/2;
  stand1Y = height/1.73;
  stand1X2 = width/4.5;
  stand1Y2 = height/1.38;
  stand2X = width/2;
  stand2Y = height/1.73;
  stand2X2 = width/1.28;
  stand2Y2 = height/1.38;
  stand3X = width/2;
  stand3Y = height/1.73;
  stand3X2 = width/2.57;
  stand3Y2 = height/1.38;
  stand4X = width/2;
  stand4Y = height/1.73;
  stand4X2 = width/1.63;
  stand4Y2 = height/1.38;
  hanger1X = width/4.5;
  hanger1Y = 0;
  hanger1X2 = width/9;
  hanger1Y2 = height/18;
  hanger2X = width/4.5;
  hanger2Y =  0;
  hanger2X2 = width/3;
  hanger2Y2 = height/18;
  frameX = width/18;
  frameY = height/18;
  frameSize = width/2.9;
  sunX = width/4.5;
  sunY = height/9;
  sunSize = width/11;
  waterX = width/16.8;
  waterY = width/5.1;
  waterWidth = width/2.9;
  waterHeight = height/4.9;
  groundX = 0;
  groundY = height/1.38;
  groundWidth = width;
  groundHeight = height/2.25;
  antenna1X = width/2.02;
  antenna1Y =  height/5;
  antenna1X2 =  width/4;
  antenna1Y2 = width/9;
  antenna2X  =width/2.02;
  antenna2Y  = height/5;
  antenna2X2  = width/1.38;
  antenna2Y2 = height/9;
  buttonSize = width/14;
  drawFrame();//draw frame function
  drawTv();// draw tv function
  drawGround();// draw ground function
}

void draw() {
  buttonFunction();// funtions for buttons
}

//function for drawing tv
void drawTv() {
  stroke(0);// black
  strokeWeight(10);
  line(stand1X, stand1Y, stand1X2, stand1Y2);// tv stand 1
  line(stand2X, stand2Y, stand2X2, stand2Y2);// tv stand 2
  line(stand3X, stand3Y, stand3X2, stand3Y2);// tv stand 3
  line(stand4X, stand4Y, stand4X2, stand4Y2);// tv stand 4
  strokeWeight(3);
  line(antenna1X, antenna1Y, antenna1X2, antenna1Y2);// antenna 1
  line(antenna2X, antenna2Y, antenna2X2, antenna2Y2);// antenna 2
  stroke(#989393);// gray
  strokeWeight(10);
  fill(#8E563C);// dark brown
  rect(tvX, tvY, tvWidth, tvHeight);// television
  stroke(255);// white
  strokeWeight(5);
  fill(#423C8E);// purple

  rect(screenX, screenY, screenWidth, screenHeight);// tv screen
  noStroke();
  fill(#423C8E);// purple
  rect(button4X, button4Y, buttonWidth, buttonHeight);//reset button
  fill(255);// white
  textAlign(CENTER, CENTER);

  text("reset", button4X+buttonWidth/2, button4Y+buttonHeight/2);
  textSize(width/45);//size of text

  noStroke();

  fill(#423C8E);//purple
  circle(button1X, button1Y, buttonSize);//colour button
  fill(255);//white
  textAlign(CENTER, CENTER);
  text("colour", button1X, button1Y);
  textSize(width/45);//textsize
  fill(#423C8E);
  circle(button2X, button2Y, buttonSize);//sketch button
  fill(255);//white
  text("sketch", button2X, button2Y);
  textSize(width/45);//text size
  fill(#423C8E);//purple
  circle(button3X, button3Y, buttonSize);// type button
  fill(255);//white
  text("type", button3X, button3Y);
  textSize(width/45);//text size
  fill(#423C8E);// purple
}

// function for drawing frame
void drawFrame() {

  stroke(0);//black
  strokeWeight(7);
  fill(255);//white
  square(frameX, frameY, frameSize);//frame
  stroke(0);//black
  strokeWeight(1);
  line(hanger1X, hanger1Y, hanger1X2, hanger1Y2);//frame hanger
  line(hanger2X, hanger2Y, hanger2X2, hanger2Y2);

  fill(#F7C50F);//yellow
  noStroke();

  circle(sunX, sunY, sunSize);// frame sun

  fill(#0FBBF7);
  rect(waterX, waterY, waterWidth, waterHeight);
}
void drawGround() {
  fill(#8E563C);//dark brown
  rect(groundX, groundY, groundWidth, groundHeight);//ground
}

// function for the functionality of the buttons
void buttonFunction() {

  if (colourFunction) {
    stroke(300);
    fill(random(255), random(255), random(255));// ranom colors
    rect(screenX, screenY, screenWidth, screenHeight);//to only change the colour of the screen
    colourFunction = false;
  }
  if (sketchFunction) {
    if (mousePressed) {
      if (pmouseX>screenX && pmouseX<screenX+screenWidth && pmouseY>screenY && pmouseY<screenY+screenHeight) {
        if (mouseX>screenX && mouseX<screenX+screenWidth && mouseY>screenY && mouseY<screenY+screenHeight) {
          stroke(0);
          strokeWeight(3);
          line(pmouseX, pmouseY, mouseX, mouseY);// drawing from previous x and y to recent x and y
        }
      }
    }
  }
  if (typeFunction) {
    stroke(255);// white
    strokeWeight(5);
    fill(#423C8E);// purple
    rect(screenX, screenY, screenWidth, screenHeight);// tv screen
    String type =  JOptionPane.showInputDialog("Write a text on tv");// type command
    textSize(20);
    fill(0);// black
    textAlign(CENTER, CENTER);
    text(type, screenX+screenWidth/2, screenY+screenHeight/2);
    typeFunction = false;
  }
}

void mouseClicked() {
  if (mouseX>button1X-buttonSize/2 && mouseX<button1X+buttonSize/2 && mouseY>button1Y-buttonSize/2 && mouseY<button1Y+buttonSize/2) {//mouse function for colour
    colourFunction = true;
  }
  if ( mouseX>button2X-buttonSize/2 && mouseX>button2X-buttonSize/2 && mouseX<button2X+buttonSize/2 && mouseY>button2Y-buttonSize/2 && mouseY<button2Y+buttonSize/2) {// mouse function for sketch
    sketchFunction = true;
  }
  if (mouseX>button3X-buttonSize/2 && mouseX<button3X+buttonSize/2 && mouseY>button3Y-buttonSize/2 && mouseY<button3Y+buttonSize/2) {// mouse function for type
    typeFunction= true;
  }
  if (mouseX>button4X && mouseX<button4X+buttonWidth && mouseY>button4Y && mouseY<button4Y+buttonHeight) {// mouse function for reset
    resetFunction = true;
    resetScreen();
  }
}
void resetScreen() {
  stroke(100);
  strokeWeight(3);
  fill(#423C8E);// purple
  rect(screenX, screenY, screenWidth, screenHeight);// to reset things that only display on the screen
  resetFunction = false;
}
