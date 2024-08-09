abstract class Character {
  float x, y;
  int size;
  int hp;
  int st;
  color col;
  int bullet_speed;
  int bullet_type;

  Character(float x, float y, int level) {
    this.x = x;
    this.y = y;

    setStatas(level);
  }

  void displayText() {
    fill(0);
    textSize(32);
    text(hp, x- 5, y + 10);
    fill(255);
  }
  
  
  
  
  abstract void updata(Bullet b, Character c);
  abstract void display();
  abstract void move();
  abstract void shot();
  abstract void setStatas(int level);
}
