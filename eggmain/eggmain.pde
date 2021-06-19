Basket basket;
Egg egg2;

final int GAME_START = 0,GAME_RULES = 1, RULE_ONE = 2, GAME_ONE = 3, RULE_TWO=4, GAME_TWO=5, RULE_THREE=6, GAME_THREE=7, RULE_FOUR=8, GAME_FOUR=9, RULE_FIVE=10, GAME_FIVE=11, GAME_OVER=12;
int gameState = 0;

float lifeX = 1200-41-65,lifeY = 33.5;
int health = 3;

final float START_BUTTON_WIDTH = 233;
final float START_BUTTON_HEIGHT = 59.5;
final float START_BUTTON_X = 470;
final float START_BUTTON_Y = 649;

final float GO_BUTTON_WIDTH = 100;
final float GO_BUTTON_HEIGHT = 67.8;
final float GO_BUTTON_X = 1027.5;
final float GO_BUTTON_Y = 681.5;

final float NEXT_BUTTON_WIDTH = 217.5;
final float NEXT_BUTTON_HEIGHT = 143.7;
final float NEXT_BUTTON_X = 939;
final float NEXT_BUTTON_Y = 672.7;

boolean leftState = false;
boolean rightState = false;


final int GAME_INIT_TIMER = 940;
int gameTimer = GAME_INIT_TIMER;

PImage home,life,rules,rule1,rule2,rule3,rule4,rule5,bk1,bk2,bk3,bk4,bk5,gamelose;
PImage gameonewin, gametwowin, gamethreewin, gamefourwin, gamefivewin;
PImage startNormal, startHovered, goNormal, goHovered, nextNormal, nextHovered, restartNormal, restartHovered ;
PFont font;


void setup(){
  size(1200, 800);
  life = loadImage("img/life.png");
  home = loadImage("img/home.png");
  rules = loadImage("img/rules.png");  
  rule1 = loadImage("img/rule1.png");  
  rule2 = loadImage("img/rule2.png");  
  rule3 = loadImage("img/rule3.png");  
  rule4 = loadImage("img/rule4.png");  
  rule5 = loadImage("img/rule5.png");  
  bk1 = loadImage("img/bk1.png");  
  bk2 = loadImage("img/bk2.png");  
  bk3 = loadImage("img/bk3.png");  
  bk4 = loadImage("img/bk4.png");  
  bk5 = loadImage("img/bk5.png");  
  gamelose = loadImage("img/gamelose.png"); 
  gameonewin = loadImage("img/gameonewin.png"); 
  gametwowin = loadImage("img/gametwowin.png"); 
  gamethreewin = loadImage("img/gamethreewin.png"); 
  gamefourwin = loadImage("img/gamefourwin.png"); 
  gamefivewin = loadImage("img/gamefivewin.png"); 
  
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  goNormal = loadImage("img/goNormal.png");
  goHovered = loadImage("img/goHovered.png");
  nextNormal = loadImage("img/nextNormal.png");
  nextHovered = loadImage("img/nextHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  
  basket = new Basket("img/game2/basket.png");  

 // brokenegg2 = new Basket();
  egg2 = new Egg();
  
  font = createFont("font/Chalkduster.ttf",77);
  textFont(font);

}

void draw() {
    // Switch Game State
  switch(gameState) {
    case GAME_START:
  image(home, 0, 0);
     if (isMouseHit(START_BUTTON_X, START_BUTTON_Y, START_BUTTON_WIDTH, START_BUTTON_HEIGHT)) {
      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_RULES;
        mousePressed = false;
      }
    } else {
      image(startNormal, START_BUTTON_X, START_BUTTON_Y);
    }
     
     if (gameTimer <= 0) gameState = GAME_RULES;
     

    break;
    case GAME_RULES:
  image(rules, 0, 0);
       if (isMouseHit(GO_BUTTON_X, GO_BUTTON_Y, GO_BUTTON_WIDTH, GO_BUTTON_HEIGHT)) {
      image(goHovered, GO_BUTTON_X, GO_BUTTON_Y);
      if (mousePressed) {
        gameState = RULE_ONE;
        mousePressed = false;
      }
    } else {
      image(goNormal, GO_BUTTON_X, GO_BUTTON_Y);
    }    

    break;    
    case RULE_ONE:
  image(rule1, 0, 0);
       if (isMouseHit(GO_BUTTON_X, GO_BUTTON_Y, GO_BUTTON_WIDTH, GO_BUTTON_HEIGHT)) {
      image(goHovered, GO_BUTTON_X, GO_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_ONE;
        mousePressed = false;
      }
    } else {
      image(goNormal, GO_BUTTON_X, GO_BUTTON_Y);
    }    
    break;
    
    case GAME_ONE:
  image(bk1, 0, 0);
     drawUI();
 
     if (gameTimer <= 0) {
        image(gameonewin, 0, 0);
       if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
      image(nextHovered, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if (mousePressed) {
        gameState = RULE_TWO;
        mousePressed = false;
      }
    } else {
      image(nextNormal, NEXT_BUTTON_X, NEXT_BUTTON_Y);
    }          
     }

    break;
    
    case RULE_TWO:
  image(rule2, 0, 0);
  
  
         if (isMouseHit(GO_BUTTON_X, GO_BUTTON_Y, GO_BUTTON_WIDTH, GO_BUTTON_HEIGHT)) {
      image(goHovered, GO_BUTTON_X, GO_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_TWO;
        mousePressed = false;
      }
    } else {
      image(goNormal, GO_BUTTON_X, GO_BUTTON_Y);
    }    
     initTime();

    break;
    
    case GAME_TWO:
  image(bk2, 0, 0);
     drawUI();
           basket.move();
       basket.display();
       basket.checkCollision(egg2);
       egg2.move();
       egg2.display();
     
      
      if (gameTimer <= 0) {
        image(gametwowin, 0, 0);
       if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
      image(nextHovered, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if (mousePressed) {
        gameState = RULE_THREE;
        mousePressed = false;
      }
    } else {
      image(nextNormal, NEXT_BUTTON_X, NEXT_BUTTON_Y);
    }          
     }

    break;
    
   case RULE_THREE:
  image(rule3, 0, 0);
  initTime();
           if (isMouseHit(GO_BUTTON_X, GO_BUTTON_Y, GO_BUTTON_WIDTH, GO_BUTTON_HEIGHT)) {
      image(goHovered, GO_BUTTON_X, GO_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_THREE;
        mousePressed = false;
      }
    } else {
      image(goNormal, GO_BUTTON_X, GO_BUTTON_Y);
    }    
  
    break;
    
    case GAME_THREE:
  image(bk3, 0, 0);
     drawUI();
     
       if (gameTimer <= 0) {
        image(gamethreewin, 0, 0);
       if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
      image(nextHovered, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if (mousePressed) {
        gameState = RULE_FOUR;
        mousePressed = false;
      }
    } else {
      image(nextNormal, NEXT_BUTTON_X, NEXT_BUTTON_Y);
    }          
     }

    break;
    case RULE_FOUR:
  image(rule4, 0, 0);
  initTime();
       if (isMouseHit(GO_BUTTON_X, GO_BUTTON_Y, GO_BUTTON_WIDTH, GO_BUTTON_HEIGHT)) {
      image(goHovered, GO_BUTTON_X, GO_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_FOUR;
        mousePressed = false;
      }
    } else {
      image(goNormal, GO_BUTTON_X, GO_BUTTON_Y);
    }    
  
    break;
    case GAME_FOUR:
  image(bk4, 0, 0);
     drawUI();
        if (gameTimer <= 0) {
        image(gamefourwin, 0, 0);
       if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
      image(nextHovered, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if (mousePressed) {
        gameState = RULE_FIVE;
        mousePressed = false;
      }
    } else {
      image(nextNormal, NEXT_BUTTON_X, NEXT_BUTTON_Y);
    }          
     }
     
    break;
    
    case RULE_FIVE:
  image(rule5, 0, 0);
  initTime();
       if (isMouseHit(GO_BUTTON_X, GO_BUTTON_Y, GO_BUTTON_WIDTH, GO_BUTTON_HEIGHT)) {
      image(goHovered, GO_BUTTON_X, GO_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_FIVE;
        mousePressed = false;
      }
    } else {
      image(goNormal, GO_BUTTON_X, GO_BUTTON_Y);
    }    
  
    break;
    
   case GAME_FIVE:
  image(bk5, 0, 0);
     drawUI();
        if (gameTimer <= 0) {
        image(gamefivewin, 0, 0);
       if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
      image(nextHovered, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if (mousePressed) {
        gameState = RULE_ONE;
        mousePressed = false;
      }
    } else {
      image(nextNormal, NEXT_BUTTON_X, NEXT_BUTTON_Y);
    }          
     }

    break;
    
    case GAME_OVER:
  image(gamelose, 0, 0);
   if (isMouseHit(START_BUTTON_X, START_BUTTON_Y, START_BUTTON_WIDTH, START_BUTTON_HEIGHT)) {
      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_RULES;
        mousePressed = false;
      }
    } else {
      image(restartNormal, START_BUTTON_X, START_BUTTON_Y);
    }

    break;


}}

//life & timeUI
void drawUI(){
     for (int i = 0; i < health; i++) {
      image(life,  lifeX - i*78 ,lifeY);
    }
        if(health <= 0){
      gameState = GAME_OVER;
     }
     
    //timeUI
    String timeString = convertFrameToTimeString(gameTimer);
    fill(0,0,0);
    text(timeString, 60, 100); 
    
    gameTimer --;    
}


//time
void addTime(float seconds) {
  gameTimer += round(seconds * 60);
}

String convertFrameToTimeString(int frames) {
  String result = "";
  float totalSeconds = float(frames) / 60;
  result += nf(floor(totalSeconds/60), 2);
  result += ":";
  result += nf(floor(totalSeconds%60), 2);
  return result;
}

void initTime(){
       gameTimer = GAME_INIT_TIMER;
}

//isMouseHit
boolean isMouseHit(float bx, float by, float bw, float bh) {
  return  mouseX > bx && 
    mouseX < bx + bw && 
    mouseY > by && 
    mouseY < by + bh;
}

void keyPressed() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      leftState = true;
      break;
    case RIGHT:
      rightState = true;
      break;

    }
  } 
}

void keyReleased() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      leftState = false;
      break;
    case RIGHT:
      rightState = false;
      break;
    }
  }
}
