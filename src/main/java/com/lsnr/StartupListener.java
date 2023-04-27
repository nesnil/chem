package com.lsnr;


import com.dao.ChemDao;
import com.dao.DictDao;
import com.pojo.Dict;
import com.pojo.DictLite;
import com.pojo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.*;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.*;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class StartupListener implements ApplicationContextAware, ServletContextAware,
        InitializingBean, ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    private DictDao dictDao;

    protected Logger logger = LoggerFactory.getLogger(StartupListener.class);

    @Override
    public void setApplicationContext(ApplicationContext ctx) throws BeansException {
        logger.info("1 => StartupListener.setApplicationContext");
    }

    @Override
    public void setServletContext(ServletContext context) {

        logger.info("2 => StartupListener.setServletContext");
        List<DictLite> types= dictDao.qryCrTypes("1");
//      types.forEach(type->{ logger.info(type.getDicValue()); });
        context.setAttribute("crTypes",types);
        logger.info("Set crTypes to ServletContext");

    }

    @Override
    public void afterPropertiesSet() throws Exception {
        logger.info("3 => StartupListener.afterPropertiesSet");
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent evt) {
        logger.info("4.1 => MyApplicationListener.onApplicationEvent");
        if (evt.getApplicationContext().getParent() == null) {
            logger.info("4.2 => MyApplicationListener.onApplicationEvent");
        }
    }

}