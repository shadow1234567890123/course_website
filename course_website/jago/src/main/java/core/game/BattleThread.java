package core.game;

import core.player.Player;

public class BattleThread extends Thread{

    private String player1;
    private String player2;
    private String matchCount;

    public BattleThread(String player1, String player2, String matchCount) {
        this.player1=player1;
        this.player2=player2;
        this.matchCount=matchCount;
    }

    public void run() {
        GameEvent oucChampion = new GameEvent();
        try {
            Class clazz1=Class.forName(player1);
            //己方棋手
            oucChampion.addPlayer((Player) clazz1.newInstance());
            //对方棋手
            Class clazz2=Class.forName(player2);
            oucChampion.addPlayer((Player) clazz2.newInstance());
            oucChampion.arrangeMatches(Integer.parseInt(matchCount));
            oucChampion.run(this);
            System.out.println(clazz1.getName());
            System.out.println(clazz2.getName());
            System.out.println("====================");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //存储对战信息
    public void saveChallengeResult(){

    }
}
