package no.ntnu.smartwork.limesurvey.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class NumberExtractor {
    public static int getInt(String str) {
        int num = -1;
        Pattern p = Pattern.compile("\\d+");
        Matcher m = p.matcher(str);
        if(m.find()) {
            num = Integer.parseInt(m.group());
        }
        return num;
    }

    public static float getFloat(String str) {
        float num = -1;
        Pattern p = Pattern.compile("\\d+\\.+\\d+");
        Matcher m = p.matcher(str);
        if(m.find()) {
            num = Float.parseFloat(m.group());
        } else if (-1 == num){
            int i = getInt(str);
            num = (float)i;
        }

        return num;
    }

    public static void main(String[]args) {
        System.out.println(getInt("string1234more567string890"));
        System.out.println(getInt("   aad  "));
    }
}
