package g11;

import java.util.ArrayList;
import java.util.HashSet;

import core.board.Board;
import core.board.PieceColor;
import core.game.Move;

public class SRD {
	//��������������0,1,2,3,4,5,6���ӵ�ʱ���Ӧ��value����Ϊ����max������Ϊ����min��
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
	public boolean isConsist(BB b) {//�������·�Ƿ�����
		if(!isValid)return false;//Խ��ֱ��false
		boolean flag=false;//flag��ʾ�Ƿ����˵�һ������
		PieceColor startColor=PieceColor.EMPTY;
		for(int i=0;i<6;i++){
			if(!flag){//��û��⵽��һ�����ӣ�һֱ������ֱ����һ�����ӳ��֣��Ǻڼ���
				if(b.get(positions[i])!=PieceColor.EMPTY){
					flag=true;
					startColor=b.get(positions[i]);
				}
			}else{//�Ѿ���¼�˵�һ�����ӣ�����ʼλ�ò�һ������
				if(b.get(positions[i])==startColor.opposite()){
					return false;
				}
			}
		}
		return true;
	}
	public PieceColor startColor(BB b){//��ʼ��ɫ
		for(int i=0;i<6;i++){
			if(b.get(positions[i])!=PieceColor.EMPTY){
				return b.get(positions[i]);
			}
		}
		return PieceColor.EMPTY;
	}
	private boolean isValid;//0�������·��Խ�磬1��������״̬
	private int direction;//0,1,2,3�ֱ�������ϣ��ң����£���
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
			isValid=false;//��Ȼ����·û�����ˣ�Ҫ���������к���
		}
	}
	public void draw(BB board){
		if(!isValid){
			System.out.println("����·û����");
			return;
		}
		System.out.print("("+String.valueOf((char)(positions[0]/19+'A'))+","+String.valueOf((char)(positions[0]%19+'A'))+")");
		switch(direction){
		case 0:
			System.out.print("�������ϣ�");
			break;
		case 1:
			System.out.print("�����ң�");
			break;
		case 2:
			System.out.print("�������£�");
			break;
		case 3:
			System.out.print("�����£�");
			break;
		}
		System.out.println("����"+getBlackPieceCount(board)+"�����ӣ�"+getWhitePieceCount(board)+"������");
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
	public HashSet<Integer> getAllAvailablePos(BB b){//��ȡ����·�еĿհ�λ��
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
			return 0;//��Ч·�������������ӵ�ס��·����ֵΪ0.
		if(!isConsist(b))
			return 0;
		int val=0;
		switch(startColor(b)){
		case BLACK:
			int blackCount=getBlackPieceCount(b);
			if(color==PieceColor.BLACK)//��������
				val=value[putCount][blackCount];
			else val=value[0][blackCount];//�Է�����
			break;
		case WHITE:
			int whiteCount=getWhitePieceCount(b);
			if(color==PieceColor.WHITE)//��������
				val=-value[putCount][whiteCount];
			else val=-value[0][whiteCount];
			break;
		default:
			break;
		}
		return val;
	}
}
