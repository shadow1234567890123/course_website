package ouc.zhx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ouc.zhx.dao.IChallengeDao;
import ouc.zhx.domain.Game;
import ouc.zhx.domain.PlayerInfo;
import ouc.zhx.service.IChallengeService;

import java.util.List;

@Service
public class ChallengeService implements IChallengeService {
    @Autowired
    IChallengeDao challengeDao;

    public boolean updatePlayer(PlayerInfo playerInfo) {
        boolean flag=false;
        try{
            challengeDao.updatePlayer(playerInfo);
            flag=true;
        }catch(Exception ex){

            flag=false;
        }
        return flag;
    }

    public List<Game> queryAllGame() {
        List<Game> allGame=challengeDao.findAllGame();
        return allGame;
    }

    public List<PlayerInfo> queryAllPlayer(int groupId) {
        List<PlayerInfo> allPlayer=challengeDao.findAllPlayer(groupId);
        return allPlayer;
    }

    public PlayerInfo queryPlayer(int groupId, int gameId) {
        PlayerInfo playerInfo=challengeDao.findPlayer(groupId,gameId);
        return playerInfo;
    }
}
