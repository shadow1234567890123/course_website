package g11;

import java.util.ArrayList;
import java.util.HashSet;

import core.board.Board;
import core.board.PieceColor;
import core.game.Move;

public class SRD {
	//这是连成连续的0,1,2,3,4,5,6个子的时候对应的value，黑为正（max），白为负（min）
	private static int[][] value={
			{0,17,78,141,788,1030,100000},//0
			{0,17,78,141,788,1030,100000},//1
			{0,17,78,141,788,1030,100000}//2
		};
	public int getDirection() {
		return direction;
	}
	public void setDirection(int direction) {
		this.direction = direction;
	}
	public boolean isConsist(BB b) {//检测这条路是否连续
		if(!isValid)return false;//越界直接false
		boolean flag=false;//flag表示是否检测了第一个棋子
		PieceColor startColor=PieceColor.EMPTY;
		for(int i=0;i<6;i++){
			if(!flag){//还没检测到第一个棋子，一直过过过直到第一个棋子出现，非黑即白
				if(b.get(positions[i])!=PieceColor.EMPTY){
					flag=true;
					startColor=b.get(positions[i]);
				}
			}else{//已经记录了第一个棋子，但起始位置不一定在哪
				if(b.get(positions[i])==startColor.opposite()){
					return false;
				}
			}
		}
		return true;
	}
	public PieceColor startColor(BB b){//起始颜色
		for(int i=0;i<6;i++){
			if(b.get(positions[i])!=PieceColor.EMPTY){
				return b.get(positions[i]);
			}
		}
		return PieceColor.EMPTY;
	}
	private boolean isValid;//0代表这个路会越界，1代表正常状态
	private int direction;//0,1,2,3分别代表右上，右，右下，下
	public int getBlackPieceCount(BB b) {
		if(!isValid)return 0;
		int count=0;
		for(int i=0;i<6;i++){
			if(b.get(positions[i])==PieceColor.BLACK)count++;
		}
		return count;
	}
	public int getWhitePieceCount(BB board) {
		if(!isValid)return 0;
		int count=0;
		for(int i=0;i<6;i++){
			if(board.get(positions[i])==PieceColor.WHITE)count++;
		}
		return count;
	}
	private int[] positions;
	public SRD(int direction, PieceColor[] board, int pos){
		int rowOffset=0,colOffset=0;
		this.direction=direction;
		switch(direction){
		case 0:
			rowOffset=-1;
			colOffset=1;
			break;
		case 1:
			rowOffset=0;
			colOffset=1;
			break;
		case 2:
			rowOffset=1;
			colOffset=1;
			break;
		case 3:
			rowOffset=1;
			colOffset=0;
			break;
		}
		if(Move.validSquare(pos)&&BB.validSquare(pos, rowOffset*5, colOffset*5)){
			isValid=true;
			positions=new int[6];
			for(int i=0;i<6;i++){
				positions[i]=(pos/19+rowOffset*i)*19+pos%19+colOffset*i;
			}
		}else{
			isValid=false;//既然这条路没意义了，要其他属性有何用
		}
	}
	public void draw(BB board){
		if(!isValid){
			System.out.println("这条路没意义");
			return;
		}
		System.out.print("("+String.valueOf((char)(positions[0]/19+'A'))+","+String.valueOf((char)(positions[0]%19+'A'))+")");
		switch(direction){
		case 0:
			System.out.print("方向：右上，");
			break;
		case 1:
			System.out.print("方向：右，");
			break;
		case 2:
			System.out.print("方向：右下，");
			break;
		case 3:
			System.out.print("方向：下，");
			break;
		}
		System.out.println("共有"+getBlackPieceCount(board)+"个黑子，"+getWhitePieceCount(board)+"个白子");
		for(int i=0;i<6;i++){
			switch(board.get(positions[i])){
			case BLACK:
				System.out.print("B");
				break;
			case WHITE:
				System.out.print("W");
				break;
			case EMPTY:
				System.out.print("E");
				break;
			}
		}
		System.out.println();
	}
	public HashSet<Integer> getAllAvailablePos(BB b){//获取这条路中的空白位置
		HashSet<Integer> result=new HashSet<>();
		if(!isValid)return result;
		for(int i=0;i<6;i++){
			if(b.get(positions[i])==PieceColor.EMPTY){
				result.add(positions[i]);
			}
		}
		return result;
	}
	public int[] getPositions() {
		return positions;
	}
	public boolean getIsValid() {
		return isValid;
	}
	public void setIsValid(boolean isValid) {
		this.isValid = isValid;
	}
	public int getVal(BB b, PieceColor color, int putCount){
		if(!isValid)
			return 0;//无效路或者有其他棋子挡住的路，价值为0.
		if(!isConsist(b))
			return 0;
		int val=0;
		switch(startColor(b)){
		case BLACK:
			int blackCount=getBlackPieceCount(b);
			if(color==PieceColor.BLACK)//己方棋子
				val=value[putCount][blackCount];
			else val=value[0][blackCount];//对方棋子
			break;
		case WHITE:
			int whiteCount=getWhitePieceCount(b);
			if(color==PieceColor.WHITE)//己方棋子
				val=-value[putCount][whiteCount];
			else val=-value[0][whiteCount];
			break;
		default:
			break;
		}
		return val;
	}
}
