package com.luo.controller;

import com.luo.domain.SysLog;
import com.luo.service.SysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private HttpServletRequest request;
    private Date visitTime; //开始时间
    private Class clazz; //访问的类
    private Method method; //访问方法

    //前置通知 主要是获取开始时间，执行的是那一个类和方法
    @Before("execution(* com.luo.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        System.out.println("前置通知执行了");
        visitTime = new Date();//当前时间就是开始访问时间
        clazz = jp.getTarget().getClass();//具体要访问的类
        String methodName = jp.getSignature().getName();//获取访问方法名称
        Object[] args = jp.getArgs(); //获取访问的方法的参数

        //获取具体执行的方法的Method对象
        if(args==null||args.length==0){
            method = clazz.getMethod(methodName); //只能获取无参数的方法
        }else{
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i <args.length ; i++) {
                classArgs[i] = args[i].getClass();
            }
            clazz.getMethod(methodName,classArgs);
        }


    }
    //后置通知
    @After("execution(* com.luo.controller.*.*(..))")
    public void doAfter(JoinPoint jp){
        System.out.println("后置通知执行了");
        long time = new Date().getTime()-visitTime.getTime();//获取访问时常
        String url = null;
        //获取url
        if(clazz!=null&&method!=null&&clazz!= LogAop.class){
            //获取类上（"/user"）
            RequestMapping classAnnotation=(RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if(classAnnotation!=null){
                String[] classValue=classAnnotation.value();
                //2.获取方法上的value值
                RequestMapping methodAnnotation=method.getAnnotation(RequestMapping.class);
                if(methodAnnotation!=null){
                    String[] methodValue=methodAnnotation.value();
                    url = classValue[0]+methodValue[0];
                    //获取访问的ip地址
                    String ip = request.getRemoteAddr();
                    //获取当前操作用户
                    SecurityContext context=SecurityContextHolder.getContext();
                    User user=(User) context.getAuthentication().getPrincipal();
                    String username = user.getUsername();

                    //将日志信息封装到SysLog对象
                    SysLog sysLog = new SysLog();
                   // sysLog.setExecutionTime(time);
                    sysLog.setIp(ip);
                    System.out.println("ip:"+ip);
                    sysLog.setMethod("类名:"+clazz.getName()+"方法名:"+method.getName());
                    System.out.println("method:"+method);
                    sysLog.setUrl(url);
                    System.out.println("url:"+url);
                    sysLog.setUsername(username);
                    System.out.println("username:"+username);
                    sysLog.setVisitTime(visitTime);
                    System.out.println("visitTime:"+visitTime);
                    System.out.println("sysLog:"+sysLog);
                    sysLogService.save(sysLog);
                }
            }
        }

        
    }
}
