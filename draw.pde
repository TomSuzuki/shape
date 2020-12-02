// 描く（マウスを離したらtrueを返す）
boolean drawShape() {
  
  // リセット
  if(mouse.MousePressed()) data.reset();

  // データ追加
  if (mouse.mousePress) data.addData();

  // 背景
  background(255, 255, 255);
  
  // 描画
  data.drawData();

  return mouse.MouseReleased();
}
