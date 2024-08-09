abstract class Character {
  float x, y;
  int size;
  int hp;
  int st;
  color col;
  int bullet_speed;
  int bullet_type;
  int bullet_size;
  int level;


  Character(float x, float y, int level) {
    this.x = x;
    this.y = y;
    this.level = level;
    setStatas(level);
  }

  void displayText() {
    fill(0);
    textSize(32);
    text(hp, x- 5, y + 10);
    fill(255);
  }
  abstract void display();
  abstract void move();
  abstract void shot();
  abstract void setStatas(int level);
  
}