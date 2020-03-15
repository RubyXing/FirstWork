package com.xing.core;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;

public class HandlerMapping {
    //ioc容器 全限定名-controller对象
    private HashMap<String, Object> IocVessel = new HashMap<>();
    //URL-controller对象
    private HashMap<String, Object> controllerMapping = new HashMap<>();
    //URL-method
    private HashMap<String, Method> methodMapping = new HashMap<>();

    //初始化ioc容器
    public void initIoc(List<String> clazzNames) {
        clazzNames.forEach(name -> {
            try {
                Class<?> cl1=Class.forName(name);
                if (cl1.isAnnotationPresent(MyController.class)) {
                    IocVessel.put(name, cl1.getDeclaredConstructor().newInstance());
                }
            } catch (Exception e) {
                System.out.println(e);
                System.out.println("IOC初始化失败");
            }
        });

        //初始化urlMapping
        initMapping();
    }

    //初始化urlMapping
    public void initMapping() {
        IocVessel.forEach((key,value)->{
            Class<?> aClazz = value.getClass();
            RequestMapping annotation = aClazz.getAnnotation(RequestMapping.class);

            //遍历每个方法对应url
            Method[] methods = value.getClass().getMethods();
            for (Method method : methods) {
                if (method.isAnnotationPresent(RequestMapping.class)) {
                    methodMapping.put(annotation.value()+method.getAnnotation(RequestMapping.class).value(),method);
                    //存在意义？
                    controllerMapping.put(annotation.value()+method.getAnnotation(RequestMapping.class).value(),value);
                }

            }
        });
    }

    public HashMap<String, Object> getControllerMapping() {
        return controllerMapping;
    }

    public HashMap<String, Method> getMethodMapping() {
        return methodMapping;
    }
}
