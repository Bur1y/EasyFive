module com.bur1y.session1 {
    requires javafx.controls;
    requires javafx.fxml;

    requires java.persistence;
    requires java.naming;
    requires java.sql;
    requires org.hibernate.orm.core;

    opens com.bur1y.session1 to javafx.fxml;
    opens com.bur1y.session1.Controllers to javafx.fxml;
    opens com.bur1y.session1.ModalCheck to javafx.fxml;
    opens com.bur1y.session1.Databases.Hibernate;
    opens com.bur1y.session1.Databases;

    exports com.bur1y.session1.Databases.Hibernate;
    exports com.bur1y.session1.Databases;
    exports com.bur1y.session1;
    exports com.bur1y.session1.Controllers;
    exports com.bur1y.session1.ModalCheck;

}