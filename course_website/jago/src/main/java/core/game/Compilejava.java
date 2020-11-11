package core.game;


import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Compilejava {

    public static void main(String[] args) throws IOException {
        String filePath = "E:\\ѧϰ\\��Ŀ\\course_website\\jago\\src\\main\\java\\g001\\player\\";//java�ļ���·��

//      String[] files = {filePath+"AI.java",filePath+"Road.java",filePath+"Main.java",filePath+"Lucker.java"};
        String[] files = {filePath + "AI.java"};
        List<String> list = Arrays.asList(files);
        ArrayList<String> fileList = new ArrayList<String>(list);
        ArrayList<String> classList = new ArrayList<String>();//��Ҫ���¼��ص����ļ�
        classList.add("g001.player.AI");
        executeCmd(fileList, classList);
    }

    public static String executeCmd(ArrayList<String> fileList, ArrayList<String> classList) {
        try {
            //���ļ���������java�ļ�����·���浽files�����У����ÿ������ù�ϵ//��ZGS.java��������LIST��INFO��Ϊ�������ݶ���
            String classPath = "E:\\ѧϰ\\��Ŀ\\course_website\\jago\\target\\classes";//class�ļ����·��

            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            StandardJavaFileManager manager = compiler.getStandardFileManager(null, null, null);
            Iterable<? extends JavaFileObject> javaFileObjects =
                    manager.getJavaFileObjectsFromStrings(fileList);
            //options����ָ����������Ŀ¼��������������дjavac -d C://��һ����
            List<String> options = new ArrayList<String>();
            options.add("-classpath");
            options.add(classPath);
            options.add("-d");
            options.add(classPath);
            JavaCompiler.CompilationTask task = compiler.getTask(null, manager, null, options, null, javaFileObjects);
            boolean compileFlag = task.call();
            manager.close();
//            ����ɹ������¼��ر��������ļ�
//            GameEvent oucChampion = new GameEvent();
//            String player1 = null;
//            if (compileFlag) {
//                System.out.println("compile success!");
//                //�����Զ���classloader����
//                CustomClassLoader diskLoader = new CustomClassLoader("E:\\ѧϰ\\��Ŀ\\course_website\\jago\\target\\classes\\");
//                diskLoader.loadClass("core.player.Player");
//                //����class�ļ�
//                for (String clazz : classList) {
//                    Class c = diskLoader.loadClass(clazz);
//                    System.out.println(c.getClassLoader());
//                    System.out.println("----------------------------");
//                    System.out.println(Player.class.getClassLoader());
//                    if (c != null) {
//                        Object obj = (Object) c.newInstance();
//                        System.out.println(c.newInstance().getClass());
////                        Thread thread=new BattleThread(,"baseline.player.AI",1);
////                        thread.start();
//                    }
//                    if (clazz.contains("AI")) {
////                        player1 = clazz;
////                        Object temp = c.newInstance();
////                        Player playerModel = new Player() {
////                            @Override
////                            public boolean isManual() {
////                                return false;
////                            }
////
////                            @Override
////                            public String name() {
////                                return null;
////                            }
////
////                            @Override
////                            public Move findMove(Move opponentMove) {
////                                return null;
////                            }
////                        };
////                        System.out.println(temp);
////                        if (temp instanceof Player) {
////                            playerModel = (Player) temp;
////                        } else {
////                            String string = JSON.toJSON(temp).toString();
////                            System.out.println(string);
////                            playerModel = JSON.parseObject(string, Player.class);
////                        }
//                        oucChampion.addPlayer((Player) c.newInstance());
////                        System.out.println(playerModel);
//                        System.out.println(oucChampion);
////                        oucChampion.addPlayer(playerModel);
//                    }
//                }
//
////                    Class clazz1=Class.forName(player1);
//                //��������
////                    oucChampion.addPlayer((Player) clazz1.newInstance());
//                //�Է�����
//                Class clazz2 = Class.forName("baseline.player.AI");
//                oucChampion.addPlayer((Player) clazz2.newInstance());
//                oucChampion.arrangeMatches(1);
//                oucChampion.run();
////                    System.out.println(clazz1.getName());
//                System.out.println(clazz2.getName());
//                System.out.println("====================");
//
//                return "�����ύ�ɹ�";
//            }

        } catch (Exception ex) {
//            return ex.toString();
            ex.printStackTrace();
        }
        return "";
    }

}