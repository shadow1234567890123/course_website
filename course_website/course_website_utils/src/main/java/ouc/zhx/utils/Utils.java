package ouc.zhx.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {
    public static String dateFormatTran(Date date){
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }
}
