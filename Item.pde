class Item {
  int[] kind = new int[3];
  int x;
  int y;
  int size;
  boolean isAlive;

  Item(int y) {
    for (int i = 0; i < kind.length; i++) {
      kind[i] = i;
    }
    isAlive = true;
    size = 20;
    x = int(random(size, width - size));
    this.y = y;
  }



  void display() {
    if (isAlive) {
      rect(x, y, size, size);
    }
  }

  void move() {
    if (isAlive) {
      y += 1;
    } else {
      y = 1000;
    }
  }

  void isHit() {
    if (!gameover.isPlayerAlive && !gameover.over) {
      float distance = dist(player.x, player.y, x, y);

      if (distance < size/2) {
        isAlive = false;
        fill(255, 0, 0);
        player.levelUp();
      }
    }
  }
}