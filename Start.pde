class Start{
  int lv = 0;
  int d = 90;
  void startScreen() {
    background(#F4F79D);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("SHOOTING_GAME", width/2, height*0.3);
    text("select level", width/2, height*0.4);
    fill(255,0,0);
    
    for(int i=0;i<3;i++){
      noStroke();
      if(dist(mouseX,mouseY,50+d/2+i*(d+15),height*0.55)<d/2){
        fill(155,0,0);
      }else{
        fill(255,0,0);
      }
      ellipse(50+d/2+i*(d+15),height*0.55,d,d);
      fill(0);
      text(i+1, 50+d/2+i*(d+15),height*0.575);
    }
    if(mousePressed ){
      if(isEllipse()){
        lv = selectLv();
      }
    }
  }
  int getLevel(){
    return lv;
  }
  boolean isEllipse(){
    for(int i=0;i<3;i++){
      if(dist(mouseX,mouseY,50+d/2+i*(d+15),height*0.55)<d/2){
        return true;
      }
    }
    return false;
  }
  int selectLv(){
    for(int i=0;i<3;i++){
      if(dist(mouseX,mouseY,50+d/2+i*(d+15),height*0.55)<d/2){
        return i+1;
      }
    }
    return 0;
  }
  void display(){
    startScreen();
  }
}