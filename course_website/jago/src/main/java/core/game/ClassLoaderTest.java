package core.game;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ClassLoaderTest {

    public static void main(String[] args) {

        //创建自定义classloader对象。
        CustomClassLoader diskLoader = new CustomClassLoader("E:\\学习\\项目\\course_website\\jago\\target\\classes\\");
        try {
            //加载class文件
            Class c = diskLoader.loadClass("g15.AI");

            if(c != null){
                try {
                    Object obj = c.newInstance();
                    System.out.println(c.newInstance().getClass());
                    Method method = c.getDeclaredMethod("name");
                    //通过反射调用Test类的say方法
                    method.invoke(obj);
                } catch (InstantiationException | IllegalAccessException
                        | NoSuchMethodException
                        | SecurityException |
                        IllegalArgumentException |
                        InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
