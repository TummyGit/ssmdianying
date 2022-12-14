package util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Request {
    static public HttpServletRequest getRequest()
    {
        return ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
    }

    static public HttpServletResponse getResponse()
    {
        return ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getResponse();
    }

    static public String get(String name)
    {
        String[] value = getRequest().getParameterValues(name);
        return value == null || value.length==0 ? "" : StringUtil.join(",",value);
    }

    static public int getInt(String name)
    {
        String value = get(name , "0");
        return value.equals("") ? 0 : Integer.valueOf(value).intValue();
    }

    static public double getDouble(String name)
    {
        String value = get(name , "0");
        return value.equals("") ? 0.0f : Double.valueOf(value).doubleValue();
    }

    static public String get(String name, String def)
    {
        if(def == null)
        {
            def = "";
        }
        String[] value = getRequest().getParameterValues(name);
        return value == null || value.length==0 ? def : StringUtil.join(",",value);
    }
}
