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
  boolean P1_UP, P1_DOWN, P1_LEFT, P1_RIGHT, P1_SPACE, P1_INTERACT, P1_8, P1_9, P1_0;
  boolean[] keyList = new boolean[]{P1_UP, P1_DOWN, P1_LEFT, P1_RIGHT, P1_SPACE, P1_INTERACT, P1_8, P1_9, P1_0};

  public KeyboardBuffer() {
    for(int i = 0; i<keyList.length; i++){
      keyList[i] = false;
    }
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
    if(code == 'E'){
      P1_INTERACT = pressed;
    }
    if(code == '8'){
      P1_8 = pressed;
    }
    if(code == '9'){
      P1_9 = pressed;
    }
    if(code == '0'){
      P1_0 = pressed;
    }
    //special codes exist: https://processing.org/reference/keyCode.html
    
  }

}
