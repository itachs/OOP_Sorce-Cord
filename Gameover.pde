class Gameover {
  boolean isPlayerAlive;
  boolean over;
  Gameover() {
    isPlayerAlive = true;
    over = false;
  }

  void display() {
    isPlayerAlive = player.isDie();
  

    if (isPlayerAlive || over) {
      background(255, 100, 0);
      fill(0);
      text("Gameover", width/2, height/2);
     
      fill(255);
    }
  }
}