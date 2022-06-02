package com.bur1y.session1.Controllers;


import com.bur1y.session1.JavaFX;
import com.bur1y.session1.ModalCheck.Alerts;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.util.Duration;

import java.io.IOException;

public class LaborantScreenController {

    public Label timer;
    public ImageView imageProfile;
    public Label fioField;

    private static final int TIME_SESSION = 60 * 10;
    private static final int WARNING_MESSAGE = 60 * 5;
    public static final int BLOCK_LOGIN = 60 * 1;

    Timeline timeline = new Timeline ();

    @FXML
    public void toLogin(ActionEvent actionEvent) throws IOException {
        timeline.stop();
        JavaFX.setRoot("loginScreen");
    }

    @FXML
    public void initialize(){
        timerStart();
    }

    public void timerStart(){

        int[] time = {TIME_SESSION}; //Чтобы внутри события был доступен, делаем в виде массива.
        timer.setText(convert(TIME_SESSION));

        timeline = new Timeline (
        new KeyFrame(
                Duration.millis(1000 * 60), //1000 мс * 60 сек = 1 мин
                ae -> {
                    time[0]--;
                    timer.setText("" + convert(time[0]));
                    if(time[0] == WARNING_MESSAGE){
                        Alerts.infoAlert("До конца сессии осталось : 5 минут.","Предупреждение","Сеанс автоматически завершится");
                    }
                    if(time[0] == 0){
                        try {
                            JavaFX.setRoot("loginScreen");
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        Alerts.infoAlert("Время активной сессии завершилось","Внимание","Сеанс автоматически завершился");
                    }
                }
            )
        );

        timeline.setCycleCount(TIME_SESSION); //Ограничим число повторений
        timeline.play(); //Запускаем
    }

    public String convert(int sessionTime){
        long hour = sessionTime / 3600,
                min = sessionTime / 60 % 60;
        return String.format("%02d:%02d", hour, min);
    }


    public void getBio(ActionEvent actionEvent) {
    }

    public void generateReport(ActionEvent actionEvent) {
    }
}
