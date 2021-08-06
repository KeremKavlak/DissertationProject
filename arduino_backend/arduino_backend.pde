import processing.serial.*;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.awt.event.InputEvent;
import java.util.Random;
//import java.util.concurrent.ThreadLocalRandom;

Serial myPort;  // Create object from Serial class
String val ="x";     // Data received from the serial port
int mode;
int count;
int gen;
int randomNum;
int elapsed;
int elapsed_strafe;
int randomNum_strafe;
int elapsed_jumpcrouch;
int randomNum_jumpcrouch;
int trigger = 20;


Robot r;
final int SPACE = 32;
final int TABbutton = 9;
final int LCTRL = 17;
final int A = KeyEvent.VK_A;
final int S = KeyEvent.VK_S;
final int D = KeyEvent.VK_D;
final int Q = KeyEvent.VK_Q;
final int W = KeyEvent.VK_W;
final int LClick = InputEvent.BUTTON1_MASK;
final int RClick = InputEvent.BUTTON2_MASK;


//int rn = 0;


void setup()
{
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  try{
    r = new Robot();
  }catch(AWTException a){} // to use global robot var
  
//  size(200,200);

  
}

void draw()
{
  if ( myPort.available() > 0) 
  {  // If data is available,
   val = myPort.readStringUntil('\n');         // read it and store it in val
  // println(val);
  } 

 // print(val);
 // println("=from Arduino");
  if (val !=null){
    val = trim(val);
    val = val.replace("\n", "");
    //println("");

    switchstatements(); //where the function is being called

    }
    
//    background(0);
//    randomResult = clock();
//    text( randomResult, 10, 100);

    
    



}

int clock() {

  if (millis() - elapsed >   trigger) {
    elapsed = millis();
    randomNum =int(random(100, 300));
    
   
  }

  return randomNum;
}




int strafeclock() {

  if (millis() - elapsed_strafe >   trigger) {
    elapsed_strafe = millis();
    randomNum_strafe =int(random(300, 400));
   
  }

  return randomNum_strafe;
}

int jumpcrouchclock() {

  if (millis() - elapsed_jumpcrouch >   trigger) {
    elapsed_jumpcrouch = millis();
    randomNum_jumpcrouch =int(random(300, 800));
   
  }

  return randomNum_jumpcrouch;
}




void btncheck(){ //current solution to breaking loops, may prove problematic

  {
  if ( myPort.available() > 0) 
  {  // If data is available,
   val = myPort.readStringUntil('\n');         // read it and store it in val
  // println(val);
  } 

 // print(val);
 // println("=from Arduino");
  if (val !=null){
    val = trim(val);
    val = val.replace("\n", "");
    //println("");

        }
    }

}

// x.1 = Halo MCC
// x.2 = Counter Strike: Global Offensive
// x.3 = Old School RuneScape (possible to also apply for RS3 I guess?)


void jumpcrouch() { //cursed movement
                   println("jumpcrouch");
                   r.keyPress(SPACE);
                   r.keyPress(LCTRL);
                   delay(jumpcrouchclock());
                   r.keyRelease(SPACE);
                   r.keyRelease(LCTRL);
                   delay(jumpcrouchclock());
                  }
                  
void strafe(){ //cursed movement universal, can be applied to CS I guess.
              r.keyPress(A);
              delay(strafeclock());
              r.keyRelease(A);
              delay(strafeclock());
              r.keyPress(D);
              delay(strafeclock());
              r.keyRelease(D);
              //println(strafeclock() + " 1");
              //println(clock() + " 2");
              }

void meleeshot() { //timing broken
                   println("melee shot");
                   r.keyPress(Q);
                   delay(clock());
                   r.keyRelease(Q);
                   delay(clock());
                   r.mousePress(LClick);
                   delay(clock());
                   r.mouseRelease(LClick);
                   delay(clock());
                   }            
              
void tapshoot(){
               println("tapshoot");
               r.mousePress(LClick);
               delay(clock());
               r.mouseRelease(LClick);
               delay(clock());
               }
               
void bunnyhop(){
                //println("bhop");
                //r.keyPress(W);
                delay(20);
                r.keyPress(SPACE);
                delay(5);
                r.keyRelease(SPACE);
                }


                   
void woodcutting(){
                  println("woodcutting missing"); // do I want to do this
                  }
void mining(){
              println("mining missing"); // the numbers Mason, what do they mean
             }
             
void fishing(){
              println("fishing missing");
              }
              
void firemaking(){
                 println("firemaking missing");
                 }


void switchstatements() {
    switch (val) {
        case "btn1":
            myPort.clear();
            switch (mode) {
                case 0:
                    //println("mac 1.1");
                    //val = "x";
                    if(val.equals("btn1")==true){ //what I want here is a loop that can be broken with a button press
                      myPort.clear();
                      jumpcrouch();
                      btncheck();
                    }
                    else{
                      val = "x";
                    }
                    break;
                case 1:
                    //println("mac 1.2");
                    if(val.equals("btn1")==true){
                    tapshoot();
                    btncheck();
                    }
                    else{
                    val = "x";
                    }
                    break;
                case 2:
                    println("mac 1.3, RS missing");
                    val = "x";
                    break;
            }
            break;

        case "btn2":
            myPort.clear();
            switch (mode) {
                case 0:
                    //println("mac 2.1");
                    if(val.equals("btn2")==true){
                    strafe();
                    btncheck();
                    }
                    else {
                    val = "x";
                    }
                    break;
                case 1:
                    if(val.equals("btn2")==true){
                    bunnyhop(); // doesn't work, needs to be replaced
                    btncheck();
                    }
                    else {
                    val = "x";
                    }
                    break;
                case 2:
                    println("mac 2.3 ");
                    val = "x";
                    break;
            }
            break;

        case "btn3":
            myPort.clear();
            switch (mode) {
                case 0:
                    meleeshot();
                    val = "x";
                    break;
                case 1:
                    println("mac 3.2");
                    val = "x";
                    break;
                case 2:
                    println("mac 3.3");
                    val = "x";
                    break;
            }
            break;

        case "btn4": //used to exit loops (btn5 can also do this but it changes config)
            val = "x";
            break;

        case "btn5": //sets the modes between the three states (0,1,2) when  it should be 3 it will go back to zero
            myPort.clear();
            switch (mode) {
                case 0:
                    mode++;
                    println(mode);
                    val = "x";
                    break;
                case 1:
                    mode++;
                    println(mode);
                    val = "x";
                    break;
                case 2:
                    mode = 0;
                    println(mode);
                    val = "x";
                    break;
            }
            break;

    } //end of switch block
}




//the following will be required for mouse clicks


//  mouseMove(int x, int y)
//Moves mouse pointer to given screen coordinates.

//mousePress(int buttons)
//Presses one or more mouse buttons.

//  mouseRelease(int buttons)
//Releases one or more mouse buttons.

// https://docs.oracle.com/javase/8/docs/api/java/awt/Robot.html#mousePress-int-

//if (val.equals("btn1")==true){ ////////////////this line is not working!
//myPort.clear(); 
//   println("Yipee");                                                                                                                                                                                         
//  r.keyPress(SPACE);
//  //delay(20);
//  //r.keyRelease(SPACE);
//   //r.keyPress(A);
//  //delay(20);
//  //r.keyRelease(A);

//  val= "400";
//   println(val); //print it out in the console                                                                                                                                                                 
//  }



//random seed for number generation

//add development seciton
//about how code works

//explanation of code can be psydo code

//add photographs

//code snippits to explain key bits of code

//put in diagrams of how it's wired up (for the arduino)

//frizing



//sniper swap TAB x2
//jump crouch CTRL + SPACE
//strafe combo?#
//melee shot
//nade reload
//------------
//tap shoot - https://www.youtube.com/watch?v=N-U7_EDTT1o
//bunny hop
//??
//------------


                //case 0:
                //    println("mac 4.1");
                //    val = "x";
                //    break;
                //case 1:
                //    println("mac 4.2");
                //    val = "x";
                //    break;
                //case 2:
                //    println("mac 4.3");
                //    val = "x";
                //    break;
                
                
                
//void switchstatements(){

//   if (val.equals("btn1")==true) {
//  myPort.clear(); 
//    println("button one has been pressed");
//  }
//  else if (val.equals("btn2")==true) {
//    myPort.clear(); 
//    println("button two has been pressed");
//  }
//    else if (val.equals("btn3")==true) {
//      myPort.clear(); 
//      println("button three has been pressed");
//  }
//    else if (val.equals("btn4")==true) {
//      myPort.clear(); 
//      println("button four has been pressed");
//  }
//    else if (val.equals("btn5")==true) {
//      myPort.clear(); 
//      println("button five has been pressed");
//  }
//  else {

//  }

//}
