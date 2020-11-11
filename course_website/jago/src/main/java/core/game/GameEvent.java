package core.game;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import core.player.Player;

public class GameEvent {

	public GameEvent() {
		// TODO Auto-generated constructor stub
	}
	
	public void addPlayer(Player player) {
		players.add(player);
		playerScore.put(player.name(), 0);
	}
	
	ArrayList<Player> players = new ArrayList<>();
	
	Map<String, Integer> playerScore=new LinkedHashMap();
	
	public void arrangeMatches(int gameNumber) {
		
		int gameNumbers = gameNumber;	//每对棋手下几盘
		//单循环
		int size = players.size();		
		for (int i = 0; i < size - 1; i++) {
			for (int j = i + 1; j < size; j++) {
				matches.add(new Match(gameNumbers, players.get(i), players.get(j)));
			}
		}
	}
	
	ArrayList<Match> matches = new ArrayList<>();
	
	public void run(Thread th) {
		Iterator<Match> itr = matches.iterator();
		while (itr.hasNext()) {
			Match match = itr.next();
			Map<String, Integer> result = match.process();
			playerScore.replace(match.getOne().name(),playerScore.get(match.getOne().name())+result.get(match.getOne().name())*2+result.get("tie")*1);
			playerScore.replace(match.getAnother().name(),playerScore.get(match.getAnother().name())+result.get(match.getAnother().name())*2+result.get("tie")*1);
		}
		try {
			int i=0;
			BufferedWriter bw=new BufferedWriter(new FileWriter("score.txt",true));
			for(String name:playerScore.keySet()) {
				
				Integer score=playerScore.get(name);
				//System.out.println("-------------------");
				if(i==0) {
					System.out.println(name+"(后手)得分:"+score);
					bw.write("-----------------------");
					bw.newLine();
					bw.write(name+"(后手)得分:"+score);
					bw.newLine();
				}else {
					System.out.println(name+"(先手)得分:"+score);
					bw.write(name+"(先手)得分:"+score);
					bw.newLine();
					bw.write("-----------------------");
				}
				//System.out.println("-------------------");
				i++;
			}
			bw.close();
			th.interrupt();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void run() {
		Iterator<Match> itr = matches.iterator();
		while (itr.hasNext()) {
			Match match = itr.next();
			Map<String, Integer> result = match.process();
			playerScore.replace(match.getOne().name(),playerScore.get(match.getOne().name())+result.get(match.getOne().name())*2+result.get("tie")*1);
			playerScore.replace(match.getAnother().name(),playerScore.get(match.getAnother().name())+result.get(match.getAnother().name())*2+result.get("tie")*1);
		}
		try {
			int i=0;
			BufferedWriter bw=new BufferedWriter(new FileWriter("score.txt",true));
			for(String name:playerScore.keySet()) {

				Integer score=playerScore.get(name);
				//System.out.println("-------------------");
				if(i==0) {
					System.out.println(name+"(后手)得分:"+score);
					bw.write("-----------------------");
					bw.newLine();
					bw.write(name+"(后手)得分:"+score);
					bw.newLine();
				}else {
					System.out.println(name+"(先手)得分:"+score);
					bw.write(name+"(先手)得分:"+score);
					bw.newLine();
					bw.write("-----------------------");
				}
				//System.out.println("-------------------");
				i++;
			}
			bw.flush();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
