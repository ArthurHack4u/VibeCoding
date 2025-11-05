import java.awt.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import javax.swing.*;

public class VisualHanoi extends JFrame {
    private static final int ANCHO_TORRE = 10;
    private static final int ALTO_TORRE = 150;
    private static final int ANCHO_BASE = 200;
    private static final int ALTO_BASE = 20;
    private static final int ALTO_DISCO = 20;
    private static final int ANCHO_MIN_DISCO = 40;

    private final PanelHanoi panelHanoi;
    private final JButton botonResolver;
    private final JButton botonReiniciar;
    private final JLabel etiquetaMovimientos;

    private final Timer temporizador;
    private boolean enEjecucion = false;
    private final int numeroDiscos = 3;
    private final List<Movimiento> movimientos = new ArrayList<>();
    private int indiceMovimientoActual = 0;
    
    @SuppressWarnings("unused")
    public VisualHanoi() {
        setTitle("Torre de Hanoi");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(600, 400);
        setLocationRelativeTo(null);

        JPanel panelPrincipal = new JPanel(new BorderLayout(10, 10));
        panelPrincipal.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        JLabel etiquetaTitulo = new JLabel("Torre de Hanoi", JLabel.CENTER);
        etiquetaTitulo.setFont(new Font("Arial", Font.BOLD, 20));
        panelPrincipal.add(etiquetaTitulo, BorderLayout.NORTH);

        panelHanoi = new PanelHanoi();
        panelPrincipal.add(panelHanoi, BorderLayout.CENTER);

        JPanel panelControles = new JPanel();
        panelControles.setLayout(new FlowLayout(FlowLayout.CENTER, 10, 10));

        botonResolver = new JButton("Resolver");
        botonResolver.addActionListener(e -> iniciarResolucion());
        
        botonReiniciar = new JButton("Reiniciar");
        botonReiniciar.addActionListener(e -> reiniciarTorres());
        
        etiquetaMovimientos = new JLabel("Movimientos: 0 / 0");
        
        panelControles.add(botonResolver);
        panelControles.add(botonReiniciar);
        panelControles.add(etiquetaMovimientos);
        panelPrincipal.add(panelControles, BorderLayout.SOUTH);

        temporizador = new Timer(500, e -> ejecutarSiguienteMovimiento());
        setContentPane(panelPrincipal);
        reiniciarTorres();
        setVisible(true);
    }
    
    private void iniciarResolucion() {
        if (enEjecucion) {
            temporizador.stop();
            enEjecucion = false;
            botonResolver.setText("Resolver");
        } else {
            if (indiceMovimientoActual >= movimientos.size()) {
                reiniciarTorres();
            }
            
            temporizador.start();
            enEjecucion = true;
            botonResolver.setText("Pausar");
        }
    }
    
    private void reiniciarTorres() {
        if (enEjecucion) {
            temporizador.stop();
            enEjecucion = false;
            botonResolver.setText("Resolver");
        }
        panelHanoi.reiniciarTorres(numeroDiscos);
        
        // sintaxis movimientos
        movimientos.clear();
        indiceMovimientoActual = 0;
        resolverTorreHanoi(numeroDiscos, 0, 2, 1);
        //
        actualizarEtiquetaMovimientos();
        panelHanoi.repaint();
    }
    
    // Algoritmo recursivo
    private void resolverTorreHanoi(int n, int origen, int destino, int auxiliar) {
        if (n == 1) {
            // Caso base: mover un disco directamente
            movimientos.add(new Movimiento(origen, destino));
            return;
        }
        
        // Paso 1: Mover n-1 discos de origen a auxiliar usando destino
        resolverTorreHanoi(n - 1, origen, auxiliar, destino);
        
        // Paso 2: Mover el disco n de origen a destino
        movimientos.add(new Movimiento(origen, destino));
        
        // Paso 3: Mover n-1 discos de auxiliar a destino usando origen
        resolverTorreHanoi(n - 1, auxiliar, destino, origen);
    }
    
    private void ejecutarSiguienteMovimiento() {
        if (indiceMovimientoActual >= movimientos.size()) {
            temporizador.stop();
            enEjecucion = false;
            botonResolver.setText("Resolver");
            return;
        }
        
        Movimiento movimiento = movimientos.get(indiceMovimientoActual);
        panelHanoi.moverDisco(movimiento.desde, movimiento.hacia);
        indiceMovimientoActual++;
        actualizarEtiquetaMovimientos();
    }
    
    private void actualizarEtiquetaMovimientos() {
        etiquetaMovimientos.setText("Movimientos: " + indiceMovimientoActual + " / " + movimientos.size());
    }
    //representar un movimiento
    private static class Movimiento {
        int desde;
        int hacia;
        
        public Movimiento(int desde, int hacia) {
            this.desde = desde;
            this.hacia = hacia;
        }
    }

    private class PanelHanoi extends JPanel {
        private final Stack<Disco>[] torres;
        
        @SuppressWarnings("unchecked")
        public PanelHanoi() {
            torres = new Stack[3];
            for (int i = 0; i < 3; i++) {
                torres[i] = new Stack<>();
            }
        }
        
        public void reiniciarTorres(int cantidadDiscos) {
            for (int i = 0; i < 3; i++) {
                torres[i].clear();
            }
            
            for (int i = cantidadDiscos; i > 0; i--) {
                torres[0].push(new Disco(i, cantidadDiscos));
            }
        }
        
        public void moverDisco(int desdeTorre, int haciaTorre) {
            if (!torres[desdeTorre].isEmpty()) {
                Disco disco = torres[desdeTorre].pop();
                torres[haciaTorre].push(disco);
                repaint();
            }
        }
        
        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            Graphics2D g2d = (Graphics2D) g;
            
            int ancho = getWidth();
            int alto = getHeight();

            int espacioTorre = ancho / 4;
            int[] posXTorre = new int[3];
            for (int i = 0; i < 3; i++) {
                posXTorre[i] = espacioTorre * (i + 1);
            }

            int posYBase = alto - 50;
            for (int i = 0; i < 3; i++) {
                g2d.setColor(Color.DARK_GRAY);
                g2d.fillRect(posXTorre[i] - ANCHO_TORRE/2, posYBase - ALTO_TORRE, 
                             ANCHO_TORRE, ALTO_TORRE);

                g2d.setColor(Color.GRAY);
                g2d.fillRect(posXTorre[i] - ANCHO_BASE/2, posYBase, ANCHO_BASE, ALTO_BASE);

                g2d.setColor(Color.BLACK);
                g2d.setFont(new Font("Arial", Font.BOLD, 14));
                String etiqueta = "Torre " + (char)('A' + i);
                g2d.drawString(etiqueta, posXTorre[i] - 25, posYBase + ALTO_BASE + 15);
            }

            for (int i = 0; i < 3; i++) {
                int posYDisco = posYBase;
                for (int j = 0; j < torres[i].size(); j++) {
                    Disco disco = torres[i].get(j);
                    posYDisco -= ALTO_DISCO;
                    disco.dibujar(g2d, posXTorre[i], posYDisco);
                }
            }
        }
    }
    
    private class Disco {
        private final int tamaño;
        private final Color color;
        private final int ancho;
        
        public Disco(int tamaño, int tamañoMaximo) {
            this.tamaño = tamaño;
            
            int rangoAnchoDisco = ANCHO_BASE - ANCHO_MIN_DISCO;
            this.ancho = ANCHO_MIN_DISCO + (rangoAnchoDisco * tamaño / tamañoMaximo);
            
            float tono = (float) tamaño / tamañoMaximo;
            this.color = Color.getHSBColor(tono, 0.7f, 0.9f);
        }
        
        public void dibujar(Graphics2D g2d, int x, int y) {
            g2d.setColor(color);
            g2d.fillRect(x - ancho/2, y, ancho, ALTO_DISCO);
            g2d.setColor(Color.BLACK);
            g2d.drawRect(x - ancho/2, y, ancho, ALTO_DISCO);
            
            g2d.setColor(Color.BLACK);
            g2d.drawString(String.valueOf(tamaño), x - 4, y + 15);
        }
    }
    
    public static void main(String[] args) {
        //ejecutar y ya
        SwingUtilities.invokeLater(() -> new VisualHanoi());
    }
}