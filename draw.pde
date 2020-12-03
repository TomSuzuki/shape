// 描く（マウスを離したらtrueを返す）
boolean drawShape() {
	
	// リセット
	if (mouse.MousePressed()) data.reset();
	
	// データ追加
	if (mouse.mousePress) data.addData();
	
	// 描画
	if (mouse.mousePress) data.drawData();
	
	return mouse.MouseReleased();
}
