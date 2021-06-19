class Egg{
  
  float eggX2,eggY2=-203, ySpeed2;
  PImage egg2,brokenegg2,word2;
  final float EGG_W2 = 163,  EGG_H2 = 203;;
  final float OFFSET_X1 = 33.2,  OFFSET_X2 = 11.8, OFFSET_Y = 20;


  
  Egg(){
  egg2 = loadImage("img/game2/egg2.png");
  eggX2 = random(OFFSET_X1, width - OFFSET_X1 - EGG_W2);
  brokenegg2 = loadImage("img/game2/brokenegg2.png"); 
  word2 = loadImage("img/word2.png"); 

  }
  
   void move(){
      eggY2 += ySpeed2;
      ySpeed2 = 6;
      

      }
  
   void display(){
           if(eggY2+EGG_H2 >= 630){    
        image(brokenegg2, eggX2, 630);
        image(word2,311.532,204);
               if (isMouseHit(NEXT_BUTTON_X, NEXT_BUTTON_Y, NEXT_BUTTON_WIDTH, NEXT_BUTTON_HEIGHT)) {
      image(nextHovered, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if (mousePressed) {
        gameState = RULE_THREE;
        mousePressed = false;
      }
    } else {
      image(nextNormal, NEXT_BUTTON_X, NEXT_BUTTON_Y);
    }          
     
        
        
      }else{     
     image(egg2, eggX2, eggY2);
   }
    }
  
   void kill(){  

  }
  
}
