import java.awt.*;
import java.awt.event.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.swing.*;


public class Eventos extends JFrame {
	private JTextArea output;
    private JTextField input;
    private JButton boton;
    //private JCheckBox casilla;
    //private JProgressBar barra;

	public Eventos(){
		this.init();
	}

	private void init(){
        
        this.setVisible(true);
		this.setSize(800, 600);
        this.setTitle("Wasap");
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


        input = new JTextField();
        output = new JTextArea("");
        boton = new JButton("Enviar");
        //casilla = new JCheckBox("Acepto los terminos");
        //barra = new JProgressBar( 0, 100 );

        output.setForeground(Color.RED);
        output.setFont(new Font("Helvetica", Font.BOLD, 36));

        input.addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent keyEvent) {
                if (keyEvent.getKeyChar() == KeyEvent.VK_ENTER) {
                    /*String mensaje = input.getText();
                    output.setText("Fulano dice: " + mensaje);
                    input.setText("");*/
                    enviarMensaje();
                }

                //output.setText("Estamos escribiendo");
        }

            @Override
            public void keyPressed(KeyEvent e) {

            }

            @Override
            public void keyReleased(KeyEvent e) {
                
            }
        });

        boton.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {
               /*  output.setText("Has presionado el boton");
                String mensaje = input.getText();
                output.setText("Fulano dice: " + mensaje);
                input.setText("");
                */
                enviarMensaje();

            }

            @Override
            public void mousePressed(MouseEvent e) {

            }

            @Override
            public void mouseReleased(MouseEvent e) {
                
            }

            @Override
            public void mouseEntered(MouseEvent e) {
                //output.setText("Entraste al boton");
            }

            @Override
            public void mouseExited(MouseEvent e) {
                //output.setText("Saliste del boton");
            }
        });

        this.add(input, BorderLayout.NORTH);
        this.add(output, BorderLayout.CENTER);
        this.add(boton, BorderLayout.LINE_END);
       // this.add(casilla, BorderLayout.LINE_END);
       // this.add(barra, BorderLayout.LINE_START);

        this.setVisible(true);
	}

    public void enviarMensaje(){
        String mensaje = input.getText();
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalDateTime ahora = LocalDateTime.now();
        String hora = ahora.format(formato);
        String historial = "\n" + output.getText();
        output.setText( hora + " : " + mensaje + historial);
        input.setText("");
    }

	public static void main (String[] args){
		new Eventos();
	}
}