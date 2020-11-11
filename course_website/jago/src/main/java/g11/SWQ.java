package g11;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.PriorityQueue;
import core.board.Board;
import core.board.PieceColor;

public class SWQ {
	private PriorityQueue<Integer> positions;
	private SW[] whiteBoard;
	public SWQ(){
		whiteBoard=new SW[361];
		for(int i=0;i<361;i++)
			whiteBoard[i]=new SW(i, 0);
		positions=new PriorityQueue<Integer>(new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {
				return whiteBoard[o1].getWhiteValue()>whiteBoard[o2].getWhiteValue()?1:-1;
			}
		});
	}
	public boolean offer(int pos, int whiteValue){
		whiteBoard[pos].setWhiteValue(whiteValue);
		return positions.offer(pos);
	}
	public void clear(){
		positions.clear();
	}
	public void remove(int pos){
		positions.remove(pos);
	}
	public ArrayList<Integer> getBestPos(Board b, int count){
		ArrayList<Integer> result=new ArrayList<Integer>();
		int i=0;
		for(Iterator<Integer> iter = positions.iterator(); iter.hasNext()&&i<count;){
			Integer pos=(Integer)iter.next();
			if(b.get(pos)==PieceColor.EMPTY){
				result.add(pos);
				i++;
			}else{
				positions.remove(iter);
			}
		}
		return result;
	}
	public ArrayList<SW> getBestNodes(BB b, int count){
		ArrayList<SW> result=new ArrayList<SW>();
		int i=0;
		for(Iterator<Integer> iter = positions.iterator(); iter.hasNext()&&i<count;){
			Integer pos=(Integer)iter.next();
			if(b.get(pos)==PieceColor.EMPTY){
				result.add(new SW(pos, whiteBoard[pos].getWhiteValue()));
				i++;
			}else{
				positions.remove(iter);
			}
		}
		return result;
	}
	public void draw(){
		for(Iterator<Integer> iter = positions.iterator(); iter.hasNext();){
			(whiteBoard[(Integer)iter.next()]).draw();
		}
	}
	public int get(int i){
		return whiteBoard[i].getWhiteValue();
	}
}
