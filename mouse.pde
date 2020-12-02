// マウス操作全般
Mouse mouse = new Mouse();

class Mouse {

  // めんどうだからpublic（あとでゲッター作る）
  public boolean mousePress = false;
  public boolean mousePressed = false;
  public boolean mouseReleased = false;

  // 押されたときに1回だけtrueを返す。
  public boolean MousePressed() {
    boolean flg = this.mousePressed;
    this.mousePressed = false;
    return flg;
  }

  // 離されたときに1回だけtrueを返す。
  public boolean MouseReleased() {
    boolean flg = this.mouseReleased;
    this.mouseReleased = false;
    return flg;
  }
}

void mousePressed() {
  mouse.mousePress = true;
  mouse.mousePressed = true;
  mouse.mouseReleased = false;
}

void mouseReleased() {
  mouse.mousePress = false;
  mouse.mousePressed = false;
  mouse.mouseReleased = true;
}
