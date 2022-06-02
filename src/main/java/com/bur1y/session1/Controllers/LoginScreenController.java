package com.bur1y.session1.Controllers;

import com.bur1y.session1.Databases.Hibernate.Interface;
import com.bur1y.session1.JavaFX;
import com.bur1y.session1.ModalCheck.Alerts;
import com.bur1y.session1.ModalCheck.Captcha;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.value.ChangeListener;
import javafx.fxml.FXML;
import javafx.geometry.Point2D;
import javafx.scene.control.CheckBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.control.Tooltip;

import java.io.IOException;

public class LoginScreenController {

    public TextField loginField;
    public PasswordField passwordField;
    public Tooltip toolTip;
    public CheckBox chBox;
    public SimpleBooleanProperty showPassword;

    @FXML
    public void initialize(){
        showPassword = new SimpleBooleanProperty();
        showPassword.bind(chBox.selectedProperty());


        for (int i = 0; i < 5; i++) {
            System.out.println(Captcha.createCaptchaValue());
        }
    }

    @FXML
    public void toLaborant() throws IOException {
        if(Interface.getAssistant(loginField.getText(),passwordField.getText()) != null){
            JavaFX.setRoot("laborantScreen");
        } else {
            Alerts.errorAlert("Проверьте введённые данные","Ошибка входа","Неверный логин или пароль");
        }
    }

    @FXML
    private void checkPass(){
        showPassword.addListener((ChangeListener<Boolean>) (observable, oldValue, newValue) -> {
            if(newValue){
                showPassword();
            }else{
                hidePassword();
            }
        });
    }

    private void showPassword(){
        Point2D p = passwordField.localToScene(passwordField.getBoundsInLocal().getMaxX(), passwordField.getBoundsInLocal().getMaxY());
        toolTip.setText(passwordField.getText());
        toolTip.show(passwordField,
                p.getX() + JavaFX.s.getX() + 50,
                p.getY() + JavaFX.s.getY());
    }

    private void hidePassword(){
        toolTip.setText("");
        toolTip.hide();
    }

}
