package g11;

import java.util.ArrayList;
import java.util.Comparator;

public class S1 implements Comparable<S1> {
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getVal() {
		return val;
	}
	public void setVal(int val) {
		this.val = val;
	}
	private int pos;
	private int val;
//	public Atom(int pos, Board b){
//		//System.out.println("Atom-("+String.valueOf((char)(pos/19+'A'))+","+String.valueOf((char)(pos%19+'A'))+")");
//		this.pos=pos;
//		ArrayList<Road> roads=b.findInfluencedRoads(pos);
//		this.val=0;
//		for(Road road:roads){
//			//road.draw(b);
//			this.val+=road.getVal(b);
//		}
//	}
	public S1(int pos, int val){
		this.pos=pos;
		this.val=val;
	}
	@Override
	public int compareTo(S1 other) {
		return this.getVal()==other.getVal()?0:(this.getVal()<other.getVal()?1:-1);//从小到大排序
	}
}
