package baseline.player;

import static core.game.Move.SIDE;

import java.util.ArrayList;

import core.board.PieceColor;

public class RoadTable {
	

	public RoadTable() {
		// TODO Auto-generated constructor stub
		for (int i = 0; i < playerRoads.length; i++) {
			for (int j = 0; j < playerRoads[0].length; j++) {
				playerRoads[i][j] = new RoadList();
			}
		}
	}
	
	//��ȡ��startPosΪ���ģ�ǰ�������ϵ�4��·
	public Road[] getRoads(int startPos) {
		return roads[startPos];
	}

	//��ʼ��·��
	public void clear() {
	
	}
	
	public boolean noThreats(PieceColor whoseMove) {
		return true;
	}
	
	private int getPotentialThreats(PieceColor whoseMove) {
		return 0;
	}
	
	//��ȡ��������λ��posʱ���ܵ�Ӱ������е���Ч·
	public ArrayList<Road> getAffectedRoads(int pos){
		ArrayList<Road> affectedRoads = new ArrayList<>();
	
		return affectedRoads;
	}

	
	//��·road���������ڵ�·����ɾ��
	public void removeRoad(Road road)
	{
		
	}
	
	//��·road����ӵ���Ӧ��·����
	public void addRoad(Road road)
	{
		
	}
	
	//����·�� ��ÿ����Ϊ����·
	private Road[][] roads = new Road[SIDE * SIDE][4]; 
	
	//���ڰ��Ӹ������ֵ�·������0����6������, 0����6�����ӵ�·�����Ϊ�ڰ�·��
	//���磺 playerRoads[3][2]��ʾ����3�����ӣ�2�����ӵ�·
	private RoadList[][] playerRoads = new RoadList[7][7];
	
	public static void main(String[] args) {
		RoadTable rt = new RoadTable();
		rt.clear();
		ArrayList<Point> intStus = new ArrayList<>();
		
		intStus.addAll(null);
		
	}
}
