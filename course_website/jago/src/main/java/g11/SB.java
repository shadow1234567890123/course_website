package g11;

public class SB {
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getBlackValue() {
		return blackValue;
	}
	public void setBlackValue(int blackValue) {
		this.blackValue = blackValue;
	}
	private int pos;
	private int blackValue;
	public SB(int pos, int blackValue){
		this.pos=pos;
		this.blackValue=blackValue;
	}
	public void draw(){
		System.out.println("Pos:"+pos+", Value:"+blackValue);
	}
}
