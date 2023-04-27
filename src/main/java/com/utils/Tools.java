package com.utils;

public class Tools {
    public static boolean isEmpty(Object obj){
        if(obj==null){
            return true;
        }else if("".equals(obj)){
            return true;
        }
        return false;
    }

    public static boolean isMobile(String os){
        if(Tools.isEmpty(os)){
            return false;
        }else if(os.indexOf("Android")>-1){
            return true;
        }else if(os.indexOf("iOS")>-1){
            return true;
        }else if(os.indexOf("iPhone")>-1){
            return true;
        }else{
            return false;
        }
    }
}
