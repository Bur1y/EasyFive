package com.bur1y.session1.Databases.Hibernate;

import com.bur1y.session1.Databases.Assistant;

import java.util.List;

public class Interface {

    public static Assistant getAssistant(String login, String password) {
        return (Assistant) Hibernate
                .getSessionFactory()
                .openSession()
                .createQuery("FROM Assistant A WHERE A.login = '" + login +"' AND A.password = '" + password + "'")
                .uniqueResult();
    }
}
