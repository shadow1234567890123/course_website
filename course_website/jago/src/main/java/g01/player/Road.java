package g01.player;

import core.board.PieceColor;

import java.util.ArrayList;

//import static core.game.Move.SIDE;

public class Road {
	
	private PieceColor[] state;
	private int type;
	private int startIndex;
	private int endIndex;
	
	private int whiteNum;
	private int blackNum;
	
	public Road(int startIndex, int endIndex, PieceColor[] state) {
		this.startIndex = startIndex;
		this.endIndex = endIndex;
		this.state = state;
	}

	public static ArrayList<Road> findRoads(PieceColor[] b, int pos) {
		ArrayList<Road> roads = new ArrayList<Road>();
		int row = Road.getRow(pos);
		int col = Road.getCol(pos);
		//����
		for(int j=col-5; j<=col; j++) {
			if(j < 0)
				continue;
			if(j+5 > 18)
				break;
			//j��ͷ��j+5��β��·
			PieceColor[] state = new PieceColor[6];
			int bnum = 0;
			int wnum = 0;
			for(int k=0; k<6; k++) {
				state[k] = b[Road.getPos(row, j+k)];
				if(state[k] == PieceColor.BLACK)
					bnum++;
				else if(state[k] == PieceColor.WHITE)
					wnum++;
				else {
					//do nothing
				}
			}
			Road r = new Road(Road.getPos(row, j),
					Road.getPos(row, j+5),
					state);
			r.setBlackNum(bnum);
			r.setWhiteNum(wnum);
			r.setType(1);
			roads.add(r);
		}

		//б����
		for(int d=5; d>=0; d--) {
			if(row-d < 0 || col-d < 0)
				continue;
			if(row-d+5 > 18 || col-d+5 > 18)
				break;
			//row-d,col-d��ͷ��row-d+5,col-d+5��β��·
			PieceColor[] state = new PieceColor[6];
			int bnum = 0;
			int wnum = 0;
			for(int k=0; k<6; k++) {
				state[k] = b[Road.getPos(row-d+k, col-d+k)];
				if(state[k] == PieceColor.BLACK)
					bnum++;
				else if(state[k] == PieceColor.WHITE)
					wnum++;
				else {
					//do nothing
				}
			}
			Road r = new Road(Road.getPos(row-d, col-d),
					Road.getPos(row-d+5, col-d+5),
					state);
			r.setBlackNum(bnum);
			r.setWhiteNum(wnum);
			r.setType(4);
			roads.add(r);
		}

		//����
		for(int i=row-5; i<=row; i++) {
			if(i < 0)
				continue;
			if(i+5 > 18)
				break;
			//j��ͷ��j+5��β��·
			PieceColor[] state = new PieceColor[6];
			int bnum = 0;
			int wnum = 0;
			for(int k=0; k<6; k++) {
				state[k] = b[Road.getPos(i+k, col)];
				if(state[k] == PieceColor.BLACK)
					bnum++;
				else if(state[k] == PieceColor.WHITE)
					wnum++;
				else {
					//do nothing
				}
			}
			Road r = new Road(Road.getPos(i, col),
					Road.getPos(i+5, col),
					state);
			r.setBlackNum(bnum);
			r.setWhiteNum(wnum);
			r.setType(2);
			roads.add(r);
		}

		//б����
		for(int d=5; d>=0; d--) {
			if(row+d > 18 || col-d < 0)
				continue;
			if(row+d-5 < 0 || col-d+5 > 18)
				break;
			//row+d,col-d��ͷ��row+d-5,col-d+5��β��·
			PieceColor[] state = new PieceColor[6];
			int bnum = 0;
			int wnum = 0;
			for(int k=0; k<6; k++) {
				state[k] = b[Road.getPos(row+d-k, col-d+k)];
				if(state[k] == PieceColor.BLACK)
					bnum++;
				else if(state[k] == PieceColor.WHITE)
					wnum++;
				else {
					//do nothing
				}
			}
			Road r = new Road(Road.getPos(row+d, col-d),
					Road.getPos(row+d-5, col-d+5),
					state);
			r.setBlackNum(bnum);
			r.setWhiteNum(wnum);
			r.setType(3);
			roads.add(r);
		}

		return roads;
	}


	public static ArrayList<Road> findRoads2(PieceColor[] b, int pos) {
		int SIDE = 19;
		ArrayList<Road> roads = new ArrayList<>();
		int directions[] = {1,	SIDE, SIDE-1, SIDE+1};
		int times[] = {-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5};

		int nowR = pos / SIDE;
		int nowC = pos % SIDE;
		for (int i = 0; i < 4; i++) {
			int direction = directions[i];
			for (int j = 0; j < 6; j++) {
				ArrayList<PieceColor> colors = new ArrayList<>();
				ArrayList<Integer> positions = new ArrayList<>();
				for (int k = j; k < j + 6; k++) {
					int currentPos = pos + times[k] * direction;
					if (currentPos < 0 || currentPos >= SIDE * SIDE) {
						colors.clear();
						positions.clear();
						break;
					}
					int r = currentPos / SIDE;
					int c = currentPos % SIDE;


                    if (direction == 1 && r != nowR || direction == SIDE && c != nowC ||
                        direction == SIDE-1 && nowC - c != r - nowR ||
                        direction == SIDE+1 && nowC - r != nowR) {
                        colors.clear();
                        positions.clear();
                        break;
                    }

					colors.add(b[currentPos]);
					positions.add(currentPos);

				}
				if (colors.size() == 6) {
					PieceColor roadArr[] = new PieceColor[6];
					for (int num = 0; num < 6; num++) {
						roadArr[num] = colors.get(num);
					}
					Road newRoad = new Road(positions.get(0), positions.get(5), roadArr);
					newRoad.setType(i);
					roads.add(newRoad);
					positions.clear();
					colors.clear();
				}
			}

		}
		return roads;
	}
	
	public static int getRow(int pos) {
		return pos/19;
	}
	public static int getCol(int pos) {
		return pos-(pos/19)*19;
	}
	public static int getPos(int row, int col) {
		return 19*row+col;
	}

	public PieceColor[] getState() {
		return state;
	}
	
	//״̬������set֮ǰҪ����Ϊ֮����һ���ռ䡣
	public void setState(PieceColor[] state) {
		this.state = state;
	}

	public int getWhiteNum() {
		return whiteNum;
	}

	public void setWhiteNum(int whiteNum) {
		this.whiteNum = whiteNum;
	}

	public int getBlackNum() {
		return blackNum;
	}

	public void setBlackNum(int blackNum) {
		this.blackNum = blackNum;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	public int getColorNum(PieceColor color) {
		return PieceColor.BLACK == color ?
				this.getBlackNum() : this.getWhiteNum();
	}

	public void printState() {
		for (int i = 0; i < 6; i++) {
			System.out.print(state[i]);
		}
		System.out.println('\n');
	}
	//�������շ�
	public boolean hasTowSpace() {
		int space = 0;
		for(int i=0; i<6; i++) {
			if(this.state[i] == PieceColor.EMPTY)
				space++;
		}
		if(space >= 2)
			return true;
		else
			return false;
	}


	public int countPiece(PieceColor color) {
		int count = 0;
		for (int i = 0; i < 6; i++) {
			if (state[i] == color) {
				count++;
			}
		}
		return count;
	}

	//����λ��ȷ������λ�ã�����pos
	public int getPosOnBoard(int i) {
		int row = Road.getRow(this.startIndex);
		int col = Road.getCol(this.startIndex);
		if(this.type == 1) 
			return this.startIndex+i;
		else if(this.type == 2) 
			return Road.getPos(row+i, col);
		else if(this.type == 3) 
			return Road.getPos(row-i, col+i);
		else if(this.type == 4)
			return Road.getPos(row+i, col+i);
		else 
			return 0;
	}
	
}
