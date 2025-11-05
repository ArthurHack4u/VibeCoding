package tips;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class Main extends Application {
    public void start(Stage scenario) throws IOException {
        Parent root = FXMLLoader.load(getClass().getResource("/Tips.fxml"));
        Scene escena = new Scene(root);
        scenario.setScene(escena);
        scenario.show();
    }


    public static void main(String[] args) {
        launch(args);
    }

}
