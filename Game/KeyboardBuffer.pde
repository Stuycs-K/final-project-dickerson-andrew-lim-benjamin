KeyboardBuffer keyboardInput;
void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  keyboardInput.press(keyCode,true);
}

void keyReleased() {
  //send the number of the key released to your KeyboardBuffer object
  keyboardInput.press(keyCode,false);
}

/**************KeyboardBuffer TAB************/
class KeyboardBuffer {
  //make a list of actions you want to have in your program
  //As a simple example this is just two instance varibles, but a list/array would work well for large quantities.
  boolean P1_UP;
  boolean P1_DOWN;
  boolean P1_LEFT;
  boolean P1_RIGHT;
  boolean P1_SPACE;

  public KeyboardBuffer() {
    P1_UP = false;
    P1_DOWN = false;
    P1_LEFT = false;
    P1_RIGHT = false;
    P1_SPACE = false;
  }

  //Map your keys here. You can bind any key presses to
  //different "actions" e.g. P1_LEFT suggests player1 goes left when this is held down.
  void press(int code, boolean pressed) {
    //println("Pressed: "+code);//Help you figure out codes that aren't working the way you want.
    
    if(code == 'W'){
      P1_UP = pressed;
    }
    if(code == 'S'){
      P1_DOWN = pressed;
    }
    if(code == 'A'){
      P1_LEFT = pressed;
    }
    if(code == 'D'){
      P1_RIGHT = pressed;
    }
    if(code == ' '){
      P1_SPACE = pressed;
    }
    //special codes exist: https://processing.org/reference/keyCode.html
    
  }

}
