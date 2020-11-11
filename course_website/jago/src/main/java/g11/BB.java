package g11;

import core.board.*;
import static core.board.PieceColor.*;
import static core.game.Move.*;
import java.io.BufferedWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Observable;
import java.util.Observer;
import java.util.Random;
import core.game.Move;
import g11.S1;
import g11.SRD;

public class BB{
		private HashSet<Integer> getAvailablePosInInfluencedRoad_Set(int pos){
			ArrayList<SRD> roads = findInfluencedRoads(pos);
			HashSet<Integer> result=new HashSet<>();
			for(SRD road:roads){
				result.addAll(road.getAllAvailablePos(this));
			}
			return result;
		}
		public ArrayList<Integer> getAvailablePosInInfluencedRoad(int pos){
			HashSet<Integer> hashSet=getAvailablePosInInfluencedRoad_Set(pos);
			ArrayList<Integer> result=new ArrayList<>();
			for(Integer integer:hashSet){
				result.add(integer);
			}
			return result;
		}
		public ArrayList<Integer> getAllAvailablePos(){
			ArrayList<Integer> result=new ArrayList<>();
			for(int i=0;i<361;i++){
				if(this.get(i)==PieceColor.EMPTY)
					result.add(i);
			}
			return result;
		}
		public ArrayList<S1> getAllAtomsInAvailablePos(){
			ArrayList<S1> result=new ArrayList<>();
			for(int i=0;i<361;i++){
				if(this.get(i)==PieceColor.EMPTY)
					result.add(new S1(i, 0));
			}
			return result;
		}
		public ArrayList<S1> getAvailableAtomsInInfluencedRoads(Board b, Move move){
			if(move==null){
				ArrayList<S1> result=new ArrayList<>();
				for(int i=8;i<=10;i++){
					for(int j=8;j<=10;j++){
						if(!(i==9&&j==9))
							result.add(new S1(i*19+j, 0));
					}
				}
				return result;
			}
			HashSet<Integer> hashSet=getAvailablePosInInfluencedRoad_Set(move.index1());
			hashSet.addAll(getAvailablePosInInfluencedRoad_Set(move.index2()));
			ArrayList<S1> result=new ArrayList<>();
			for(Integer pos:hashSet){
				result.add(new S1(pos, 0));
			}
			return result;
		}
		public ArrayList<SRD> findInfluencedRoads(Move move){
			if(move==null){
				HashSet<SRD> hashSet=findInfluencedRoads_Set(180);
				ArrayList<SRD>result=new ArrayList<>();
				for(SRD road:hashSet){
					result.add(road);
				}
				return result;
			}else{
				HashSet<SRD> hashSet=findInfluencedRoads_Set(move.index1());
				hashSet.addAll(findInfluencedRoads_Set(move.index2()));
				ArrayList<SRD>result=new ArrayList<>();
				for(SRD road:hashSet){
					result.add(road);
				}
				return result;
			}
		}
		public int getBlackValueSumInInfluencedRoads(Move move){
			int val=0;
			ArrayList<SRD> roads=findInfluencedRoads(move);
			for(SRD road:roads){
				val+=road.getVal(this, PieceColor.BLACK,1);
			}
			return val;
		}
		public int getWhiteValueSumInInfluencedRoads(Move move){
			int val=0;
			ArrayList<SRD> roads=findInfluencedRoads(move);
			for(SRD road:roads){
				val+=road.getVal(this, PieceColor.WHITE,1);
			}
			return val;
		}
		public int getBlackValueSumInInfluencedRoads(int pos){
			int val=0;
			ArrayList<SRD> roads=findInfluencedRoads(pos);
			for(SRD road:roads){
				val+=road.getVal(this, PieceColor.BLACK,1);
			}
			return val;
		}
		public int getWhiteValueSumInInfluencedRoads(int pos){
			int val=0;
			ArrayList<SRD> roads=findInfluencedRoads(pos);
			for(SRD road:roads){
				val+=road.getVal(this, PieceColor.WHITE,1);
			}
			return val;
		}

	    public static boolean validSquare(int pos, int rowOffset, int colOffset){
			//给定一个位置，加上行和列的偏移得到另一个位置，判断得到的位置在棋盘上是否为有效位置
			int row=pos/19;
			int col=pos%19;
			row+=rowOffset;
			col+=colOffset;
			return (row>=0&&row<SIDE&&col>=0&&col<SIDE);
		}
	    
		public HashSet<SRD> findInfluencedRoads_Set(int pos){
	    	HashSet<SRD> result=new HashSet<>();
			for(int i=0;i<6;i++){
				int row=Move.row(pos-i*SIDE)-'A',col=Move.col(pos-i*SIDE)-'A';
				if(row>=0&&row<SIDE&&col>=0&&col<SIDE){//此点是有效位置
					if(validSquare(pos-i*SIDE, 5, 0)){
						result.add(new SRD(3, this._board, pos-i*SIDE));
					}
				}
			}
			for(int i=0;i<6;i++){
				int row=Move.row(pos-i*SIDE-i)-'A',col=Move.col(pos-i*SIDE-i)-'A';
				if(row>=0&&row<SIDE&&col>=0&&col<SIDE){//此点是有效位置
					if(validSquare(pos-i*SIDE-i, 5, 5)){
						result.add(new SRD(2, this._board, pos-i*SIDE-i));
					}
				}
			}
			for(int i=0;i<6;i++){
				int row=Move.row(pos-i)-'A',col=Move.col(pos-i)-'A';
				if(row>=0&&row<SIDE&&col>=0&&col<SIDE){//此点是有效位置
					if(validSquare(pos-i, 0, 5)){
						result.add(new SRD(1, this._board, pos-i));
					}
				}
			}
			for(int i=0;i<6;i++){
				int row=Move.row(pos+i*SIDE-i)-'A',col=Move.col(pos+i*SIDE-i)-'A';
				if(row>=0&&row<SIDE&&col>=0&&col<SIDE){//此点是有效位置
					if(validSquare(pos+i*SIDE-i, -5, 5)){
						result.add(new SRD(0, this._board, pos+i*SIDE-i));
					}
				}
			}
			return result;
	    }
	    public ArrayList<SRD> findInfluencedRoads(int pos){
	    	ArrayList<SRD> result=new ArrayList<>();
			for(int i=0;i<6;i++){
				int row=Move.row(pos-i*SIDE)-'A',col=Move.col(pos-i*SIDE)-'A';
				if(row>=0&&row<SIDE&&col>=0&&col<SIDE){//此点是有效位置
					if(validSquare(pos-i*SIDE, 5, 0)){
						result.add(new SRD(3, this._board, pos-i*SIDE));
					}
				}
			}
			for(int i=0;i<6;i++){
				int row=Move.row(pos-i*SIDE-i)-'A',col=Move.col(pos-i*SIDE-i)-'A';
				if(row>=0&&row<SIDE&&col>=0&&col<SIDE){//此点是有效位置
					if(validSquare(pos-i*SIDE-i, 5, 5)){
						result.add(new SRD(2, this._board, pos-i*SIDE-i));
					}
				}
			}
			for(int i=0;i<6;i++){
				int row=Move.row(pos-i)-'A',col=Move.col(pos-i)-'A';
				if(row>=0&&row<SIDE&&col>=0&&col<SIDE){//此点是有效位置
					if(validSquare(pos-i, 0, 5)){
						result.add(new SRD(1, this._board, pos-i));
					}
				}
			}
			for(int i=0;i<6;i++){
				int row=Move.row(pos+i*SIDE-i)-'A',col=Move.col(pos+i*SIDE-i)-'A';
				if(row>=0&&row<SIDE&&col>=0&&col<SIDE){//此点是有效位置
					if(validSquare(pos+i*SIDE-i, -5, 5)){
						result.add(new SRD(0, this._board, pos+i*SIDE-i));
					}
				}
			}
			return result;
	    }
	    public BB() {
	        _board = new PieceColor[SIDE * SIDE];
	        for (int i=0;i<361;i++) {
				_board[i]=PieceColor.EMPTY;
			}
	        _board[180]=PieceColor.BLACK;
	        roads = new SRD[361][];
	        for(int i=0;i<361;i++){
	        	roads[i]=new SRD[4];
	        	for(int j=0;j<4;j++){
	        		roads[i][j]=new SRD(j, _board, i);
	        	}
	        }
	    }

	    
	    public boolean gameOver() {
	        return _gameOver;
	    }

	    
	    public PieceColor get(char c, char r) {
	        assert Move.validSquare(c, r);
	        return _board[index(c, r)];
	    }

	    
	    public PieceColor get(int k) {
	        assert Move.validSquare(k);
	        return _board[k];
	    }

	    
	    public void set(char c, char r, PieceColor v) {
	        assert Move.validSquare(c, r);
	        set(index(c, r), v);
	    }

	    
	    public void set(int k, PieceColor v) {
	        assert Move.validSquare(k);
	        _board[k] = v;
	    }

	    
	    public boolean legalMove(Move mov) {
	        return true; // FIXME
	    }
	    
	public boolean isWin(char c, char r, PieceColor pieceColor) {
	        int count = 1;      
	        int posX = 0;    
	        int posY = 0;
	        
	        for(posX = c - 1; posX >='A'; posX--) {
	            if (_board[Move.index((char)posX, r)] == pieceColor) {
	                count++;
	                if (count >= 6) {
	                    return true;
	                }
	            }else {
	                break;
	            }
	        }   
	        for(posX = c + 1; posX <='S'; posX++) {
	            if (_board[Move.index((char)posX, r)] == pieceColor) {
	                count++;
	                if (count >= 6) {
	                    return true;
	                }
	            }else {
	                break;
	            }
	        }
	        
	        count=1;
	        for(posY = r - 1; posY >='A'; posY--) {
	            if (_board[Move.index(c, (char)posY)] == pieceColor) {
	                count++;
	                if (count >= 6) {
	                    return true;
	                }
	            }else {
	                break;
	            }
	        }
	        for(posY = r + 1; posY <= 'S'; posY++) {
	            if (_board[index(c, (char)posY)] == pieceColor) {
	                count++;
	                if (count >= 6) {
	                    return true;
	                }
	            }else {
	                break;
	            }
	        }
	        
	        count=1;
	        for(posX = c - 1, posY = r - 1; posX >='A' && posY >='A'; posX--, posY--) {
	            if (_board[Move.index((char)posX, (char)posY)] == pieceColor) {
	                count++;
	                if (count >= 6) {
	                    return true;
	                }
	            }else {
	                break;
	            }
	        }
	        for(posX = c + 1, posY = r + 1; posX <= 'S' && posY <= 'S'; posX++, posY++) {
	            if (_board[Move.index((char)posX, (char)posY)] == pieceColor) {
	                count++;
	                if (count >= 6) {
	                    //count = 1;
	                    return true;
	                }
	            }else {
	                break;
	            }
	        }
	        
	        count=1;
	        for(posX = c + 1, posY = r - 1; posX <= 'S' && posY >='A'; posX++, posY--) {
	            if (_board[Move.index((char)posX, (char)posY)] == pieceColor) {
	                count++;
	                if (count >= 6) {
	                    return true;
	                }
	            }else {
	                break;
	            }
	        }
	        for(posX = c - 1, posY = r + 1; posX >='A' && posY <= 'S'; posX--, posY++) {
	            if (_board[Move.index((char)posX, (char)posY)] == pieceColor) {
	                count++;
	                if (count >= 6) {
	                    return true;
	                }
	            }else {
	                break;
	            }
	        }
	        return false;
	    }


	    @Override
	    public String toString() {
	        return toString(false);
	    }

	   
	    public String toString(boolean legend) {
	    	StringBuffer strBuff = new StringBuffer();
	    	
	    	strBuff.append("  ");
	    	for (int i = 0; i < SIDE; i++)
	    		strBuff.append((char)('A' + i)+" ");
	    	strBuff.append("\n");
	    	
	    	for (int i = 0; i < SIDE * SIDE; i++) {
	    		if (i % SIDE == 0) 
	    			strBuff.append((char)('A' + i / SIDE) + " ");
	    		if (_board[i] == EMPTY) {
	    			strBuff.append("- ");
	    		}
	    		else if (_board[i] == BLACK) {
	    			strBuff.append("x ");
	    		}
	    		else {
	    			strBuff.append("o ");
	    		}
	    		if ((i+1) % SIDE == 0)
	    			strBuff.append("\n");
	    	}
	        return strBuff.toString();  // FIXME
	    }
	    
	    public void draw() {
	    	System.out.print(this.toString(true));
	    }
	    
//	    /** Recording the movelist into a file*/
//	    public void record(File record) {
//	    	
//	    }

	    private PieceColor[] _board;

	    public PieceColor[] getPieces(){
	    	return _board;
	    }
	    
	    private boolean _gameOver;

	    private SRD[][] roads;
	    public SRD[][] getRoads() {
			return roads;
		}
}
