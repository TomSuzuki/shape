// エフェクト
class Effect {
	
	private int time = 0;
	
	// コンストラクタ
	public Effect() {
		this.time = 60;
	}
	
	// 表示
	public boolean draw() {
		this.time--;
		
		textSize(height);
		fill(0,0,0,255 * this.time / 60);
		textAlign(CENTER,CENTER);
		text(" ? ",width / 2,height * 0.4);
		
		return this.time <= 0;
	}
	
}