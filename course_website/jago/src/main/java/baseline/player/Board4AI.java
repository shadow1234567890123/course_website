package baseline.player;

import core.board.Board;

public class Board4AI extends Board {

	public Board4AI() {
		// TODO Auto-generated constructor stub
		roadTable.clear();
	}

	public Board4AI(Board b) {
		super(b);
		// TODO Auto-generated constructor stub
	}
	
	private RoadTable roadTable = new RoadTable();
}


