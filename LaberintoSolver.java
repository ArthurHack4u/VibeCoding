import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Timer;
import java.util.TimerTask;
import javax.swing.*;

public class LaberintoSolver extends JPanel {
    private final int[][] laberintoOriginal = {
            {0, 0, 0, 0, 0, 0, 0},
            {0, 1, 1, 1, 1, 1, 0},
            {0, 0, 0, 0, 0, 1, 0},
            {0, 1, 1, 1, 0, 1, 0},
            {0, 0, 0, 1, 0, 0, 0},
            {1, 1, 0, 1, 1, 1, 0},
            {0, 0, 0, 0, 0, 3, 0}
    };

    private int[][] laberinto;
    private final int TAM_CASILLA = 50;
    private boolean encontrado = false;
    private Timer timer;

    public static void main(String[] args) {
        JFrame frame = new JFrame("Laberinto");
        LaberintoSolver panel = new LaberintoSolver();
        frame.add(panel, BorderLayout.CENTER);

        JButton reiniciarButton = new JButton("Reiniciar");
        reiniciarButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panel.reiniciar();
            }
        });

        frame.add(reiniciarButton, BorderLayout.SOUTH);
        frame.setSize(400, 450);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);

        panel.iniciarResolucion();
    }

    public LaberintoSolver() {
        this.laberinto = copiarLaberinto(laberintoOriginal);
    }

    private int[][] copiarLaberinto(int[][] original) {
        int[][] copia = new int[original.length][original[0].length];
        for (int i = 0; i < original.length; i++) {
            System.arraycopy(original[i], 0, copia[i], 0, original[0].length);
        }
        return copia;
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        for (int i = 0; i < laberinto.length; i++) {
            for (int j = 0; j < laberinto[0].length; j++) {
                int x = j * TAM_CASILLA;
                int y = i * TAM_CASILLA;

                if (laberinto[i][j] == 1) {
                    g.setColor(Color.BLACK);
                    g.fillRect(x, y, TAM_CASILLA, TAM_CASILLA);
                } else {
                    g.setColor(Color.WHITE);
                    g.fillRect(x, y, TAM_CASILLA, TAM_CASILLA);
                    g.setColor(Color.GRAY);
                    g.drawRect(x, y, TAM_CASILLA, TAM_CASILLA);
                }

                if (laberinto[i][j] == 9) { // Ratón
                    g.setColor(Color.BLUE);
                    g.fillOval(x + 10, y + 10, TAM_CASILLA - 20, TAM_CASILLA - 20);
                }

                if (laberinto[i][j] == 3) { // Queso
                    g.setColor(Color.YELLOW);
                    g.fillOval(x + 10, y + 10, TAM_CASILLA - 20, TAM_CASILLA - 20);
                }
            }
        }
    }

    public void iniciarResolucion() {
        encontrado = false;
        timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                if (!encontrado) {
                    resolver(0, 0);
                }
            }
        }, 1000);
    }

    private boolean resolver(int x, int y) {
        if (x < 0 || y < 0 || x >= laberinto.length || y >= laberinto[0].length) return false;
        if (laberinto[x][y] == 1 || laberinto[x][y] == 9) return false;
        if (laberinto[x][y] == 3) {
            encontrado = true;
            repaint();
            return true;
        }

        laberinto[x][y] = 9;
        repaint();
        sleep(200);

        if (resolver(x - 1, y)) return true; // Norte
        if (resolver(x, y + 1)) return true; // Este
        if (resolver(x + 1, y)) return true; // Sur
        if (resolver(x, y - 1)) return true; // Oeste

        laberinto[x][y] = 0; // Retroceso
        repaint();
        sleep(200);

        return false;
    }

    private void sleep(int ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void reiniciar() {
        if (timer != null) {
            timer.cancel();
        }
        this.laberinto = copiarLaberinto(laberintoOriginal);
        repaint();
        iniciarResolucion();
    }
}
