module Tips {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.graphics;
    requires javafx.base;

    opens tips to javafx.fxml, javafx.graphics, javafx.controls;
}