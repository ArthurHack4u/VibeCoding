package tips;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.Slider;
import javafx.scene.control.TextField;

import java.math.BigDecimal;

public class tipsController {
    private BigDecimal  tipPercentaje = new BigDecimal(0.15);

    @FXML
    Slider slider;
    @FXML
    private TextField amountTextField;

    @FXML
    private Label tipPercentajeLabel;

    @FXML
    private Slider tipPercentajeSlider;

    @FXML
    private TextField tipTextField;

    @FXML
    private TextField totalTextField;

    @FXML
    void CalcularButtonPresed(ActionEvent event) {
        BigDecimal cantidad = new BigDecimal(amountTextField.getText());
        BigDecimal porcentaje = cantidad.multiply(tipPercentaje);
        BigDecimal total = cantidad.add(porcentaje);
        tipTextField.setText(porcentaje.toString());
        totalTextField.setText(total.toString());
    }

    public void initialize(){
        tipPercentajeSlider.valueProperty().addListener(
                new ChangeListener<Number>() {
                    @Override
                    public void changed(ObservableValue<? extends Number> observableValue, Number oldValue, Number newValue) {
                        tipPercentaje = BigDecimal.valueOf(newValue.intValue()/100.0);
                        double diseño = Double.parseDouble(tipPercentaje.toString())*100;
                        tipPercentajeLabel.setText(diseño + "%");
                    }
                }
        );
    }



}