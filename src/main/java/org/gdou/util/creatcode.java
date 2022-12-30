package org.gdou.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class creatcode {
    public static String getsalarycode() {
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss", java.util.Locale.CHINA);
        String str = sdf.format(now);
        String code = str + (int) (Math.random() * 1000);
        return code;
    }

}
