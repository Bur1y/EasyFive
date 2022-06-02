package com.bur1y.session1.Databases.Hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class Hibernate {

    private static SessionFactory factory;

    private Hibernate() {
    }

    public static SessionFactory getSessionFactory() {
        if (factory == null) {
            StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                    .configure()
                    .build();

            factory = new MetadataSources(registry)
                    .buildMetadata()
                    .buildSessionFactory();
        }
        return factory;
    }

}