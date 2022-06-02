package com.bur1y.session1;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class JavaFX extends Application {

    private static Scene scene;
    public static Stage s;

    @Override
    public void start(Stage stage) throws IOException {
        scene = new Scene(loadFXML("loginScreen"), 800, 500); // создаём сцену, указываем слой, задаём размеры
        stage.setTitle("kek"); // имя окна
//        stage.getIcons().add(new Image("file:iconEmpty.png")); // ставим иконку
        s = stage;
        stage.setScene(scene); // устанавливаем сцену
        stage.setResizable(true); // параметр отвечающий за изменяемость размара окна(пользователем)
        stage.show(); // показываем
    }


    public static Parent getRoot() {
        return scene.getRoot();
    }

    // установить нужный слой
    public static void setRoot(String fxml) throws IOException {
        scene.setRoot(loadFXML(fxml));
    }

    //метод который добавляет к пути расширение, тем самы создается полная path ссылка
    private static Parent loadFXML(String fxml) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(JavaFX.class.getResource(
                fxml + ".fxml"

        ));
        return fxmlLoader.load(); // загружаем слой
    }

    public static void main(String[] args) {
        launch();
    } // запускаем приложение

}
