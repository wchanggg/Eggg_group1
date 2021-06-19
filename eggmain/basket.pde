class Basket{
  Egg player;
  float x,y;
  PImage basket,brokenegg2;  
  boolean isAlive;

  
  final float BASKET_W = 208;
  final float BASKET_H = 161;
  final float BASKET_Y = 540, BROKENEGG_W = 229, BROKENEGG_H = 110;
  

  Basket(){
    x = 0;
    y = 0;
  brokenegg2 = loadImage("img/game2/brokenegg2.png"); 
  }
  Basket(String filename){
    basket = loadImage(filename);
    x = 389;
    y = 0;
  }
  
    void move(){
     //442
   y = 539;
        if(leftState){
             x -= 7;
       if(x < 0){ 
       x = 0;
      }
  }   
  if(rightState){
          x += 7;
      if(x+BASKET_W > width) {
         x = width-BASKET_W;
      }
  }  
}

  void display(){
    image (basket, x,y);
     }
          
    void checkCollision(Egg player){
      
    if(isHit(player.eggX2,player.eggY2, player.EGG_W2, player.EGG_H2, x, y, 208, 161)){
       egg2 = new Egg();
       egg2.move();
       egg2.display();
    }

        //image(brokenegg2, player.eggX2, 630, BROKENEGG_W, BROKENEGG_H );}  
  }

  boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return  ax + aw >= bx &&    // a right edge past b left
    ax <= bx + bw &&    // a left edge past b right
    ay + ah >= by &&    // a top edge past b bottom
    ay <= by + bh;
}
}
