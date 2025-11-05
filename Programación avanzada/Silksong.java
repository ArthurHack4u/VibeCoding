import java.awt.FlowLayout;
import javax.swing.*;

public class Silksong extends JFrame{

    public Silksong(){
        this.init();
    }
    private void init() {

        this.setLayout(new FlowLayout());

        ImageIcon fondo = new ImageIcon("fondo.png");
        JLabel imagen = new JLabel(fondo);
        JProgressBar barra = new JProgressBar();
        JLabel loading = new JLabel("Loading...");
        
        barra.setValue(50);

        this.add(barra);
        this.add(loading);
        this.add(imagen);

        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setTitle("Hollow Knight: Silksong");
        this.setSize(800,600);
        this.setVisible(true);

        this.cargaBarra(barra);
    }

public void cargaBarra(JProgressBar barra) {
    int i = 0;
    while (i < 100) {
        
        barra.setValue(i);
        this.repaint();

        System.out.println(i);
        i++;
        try {
            Thread.sleep(30);
        } catch (InterruptedException e) {

        }  
    }
}
    public static void main(String[] args) {
        new Silksong();
    }
}