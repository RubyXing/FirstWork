package com.xing.core;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class HandlerAdapter {

    private HandlerMapping handlerMapping;
    private HashMap<String, Object> controllerMapping;
    private HashMap<String, Method> methodMapping;

    public HandlerAdapter(HandlerMapping handlerMapping) {
        this.handlerMapping = handlerMapping;
        controllerMapping = handlerMapping.getControllerMapping();
        methodMapping = handlerMapping.getMethodMapping();
    }

    public Object adaptive(HttpServletRequest req, HttpServletResponse resp) {
        //获取请求servlet路径
        String servletPath = req.getServletPath();
        //获取对象
        Object controller = controllerMapping.get(servletPath);
        //获取方法
        Method method = methodMapping.get(servletPath);
        //获得方法形参数
        //使用getName时参数名会被替换，
        //1.File->Settings->Build,Execution,Deployment->Compiler->Java Compiler
        //2在 Additional command line parameters: 后面填上 -parameters
        Parameter[] parameters = method.getParameters();
        //声明方法实参
        Object[] realParameter = new Object[parameters.length];
        //获取请求参数
        Map<String, String[]> parameterMap = req.getParameterMap();

        //找不到类或方法
        if (controller == null) {
            try {
                resp.sendError(333, "请求映射找不到controller或method");
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
            return null;
        }

        //传参判断方法
        for (int i = 0; i < parameters.length; i++) {
            //获取参数类型
            Class<?> parmetType = parameters[i].getType();
            //判断填入参数是否需要传参request，response。
            if (parmetType.isAssignableFrom(HttpServletRequest.class)) {
                realParameter[i] = req;
            } else if (parmetType.isAssignableFrom(HttpServletResponse.class)) {
                realParameter[i] = resp;
            }
            //判断是否为基本数据类型,数组,字符串
            else if (parmetType.isPrimitive()
                    || parmetType.isArray()
                    || parmetType.isAssignableFrom(String.class)) {
                //获取参数名称
                String parameterName = parameters[i].getName();
                //通过参数名获取请求参数
                String[] parameterString = parameterMap.get(parameterName);
                //将string转为对应数据类型放入实参
                realParameter[i] = conversionType(parameterString, parmetType);
            }
            //判断自定义类型
            else if (parmetType.getClassLoader() != null) {
                String beanName = parameters[i].getName();
                Object beanInstance = null;
                try {
                    beanInstance = parmetType.newInstance();
                } catch (Exception e) {
                    System.out.println("bean实例化异常");
                    e.printStackTrace();
                }
                //
                Field[] DeclaredFields = parmetType.getDeclaredFields();
                for (Field declaredField : DeclaredFields) {

                    String fieldName = declaredField.getName();
                    String keyName = beanName + "." + fieldName;
                    //值字符串
                    String[] strings = parameterMap.get(keyName);
                    if (strings == null) {
                        continue;
                    }
                    //参数类型转换
                    Object trueParameter = conversionType(strings, declaredField.getType());
                    try {
                        //找到对应的set方法
                        char[] cs = fieldName.toCharArray();
                        cs[0] -= 32;
                        String setMethodName = "set" + String.valueOf(cs);
                        //获取方法用的方法的参数类型
                        // 因为类型转换写的不完善，所以要通过方法的参数来找方法，部分参数可以自动类型转换
                        Method declaredMethod = parmetType.getDeclaredMethod(setMethodName, declaredField.getType());
                        declaredMethod.invoke(beanInstance, trueParameter);
                    } catch (Exception e) {
                        System.out.println("获取bean方法异常");
                        e.printStackTrace();
                    }
                }
                realParameter[i] = beanInstance;
            }

        }


        //获取方法返回值
        Object obj = null;
        try {
            obj = method.invoke(controller, realParameter);
        } catch (Exception e) {
            System.out.println("HandlerAdapter，方法执行错误");
            e.printStackTrace();
        }
        return obj;
    }

    //数据类型转换,只处理了int，boolean，double，string和这些数组
    private Object conversionType(String[] parameterString, Class<?> parmetType) {
        Object result = null;
        if (parameterString.length > 1) {
            parmetType = parmetType.getComponentType();
        }

        if (parmetType.isAssignableFrom(int.class) || parmetType.isAssignableFrom(Integer.class)) {
            if (parameterString.length > 1) {
                result = Arrays.stream(parameterString).mapToInt(Integer::parseInt).toArray();
            } else {
                result = Integer.parseInt(parameterString[0]);
            }
        } else if (parmetType.isAssignableFrom(boolean.class) || parmetType.isAssignableFrom(Boolean.class)) {
            result = Boolean.parseBoolean(parameterString[0]);
        } else if (parmetType.isAssignableFrom(double.class) || parmetType.isAssignableFrom(Double.class)) {
            if (parameterString.length > 1) {
                result = Arrays.stream(parameterString).mapToDouble(Double::parseDouble).toArray();
            } else {
                result = Double.parseDouble(parameterString[0]);
            }
        } else if (parmetType.isAssignableFrom(String.class)) {
            if (parameterString.length > 1) {
                result = parameterString;
            } else {
                result = parameterString[0];
            }
        }

        return result;
    }


}
