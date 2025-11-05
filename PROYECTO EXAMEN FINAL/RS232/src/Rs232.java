import giovynet.serial.Baud;
import giovynet.serial.Com;
import giovynet.serial.Parameters;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import java.io.*;
import java.net.*;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

/**
 *
 * @author Arturo
 */
public class Rs232 extends javax.swing.JFrame {

    Com port;
    Parameters configuracion;
    String cadena="";
    boolean escuchar = false;
    
    private ServerSocket servidor;
    private Socket socketCliente;
    private DataInputStream in;
    private DataOutputStream out;

    public Rs232() {
        initComponents();
    }
    
    public abstract class EscucharCliente extends Thread {
        public abstract void escucharCliente();

        public void run() {
            while (true) {
                escucharCliente();
            }
        }
    }

    //acepta conexiones y maneja la comunicación con el cliente
private void configurarServidor() {
    try {
        int puerto = Integer.parseInt(textPuerto.getText().trim());
        servidor = new ServerSocket(puerto);
        JOptionPane.showMessageDialog(this, "Servidor escuchando en el puerto " + puerto);

        socketCliente = servidor.accept();
        String ipCliente = socketCliente.getInetAddress().getHostAddress();
        JOptionPane.showMessageDialog(this, "Cliente conectado.");
        
        textRecibidos.append("Cliente conectado desde IP: " + ipCliente + "\n");
        
        in = new DataInputStream(socketCliente.getInputStream());
        out = new DataOutputStream(socketCliente.getOutputStream());
        
        

        EscucharCliente recibirHilo = new EscucharCliente() {
            @Override
            public void escucharCliente() {
                try {
                    String datoRecibido = in.readUTF();
                    textRecibidos.append("Datos recibidos: " + datoRecibido + "\n");
                    
                    if (port != null) {
                        port.sendString(datoRecibido);
                        textSalida.append("Enviado a RS232: " + datoRecibido + "\n");
                    } else {
                        textSalida.append("Puerto RS232 no configurado\n");
                    }

                    out.writeUTF("ENVIADO y RECIBIDO");

                } catch (IOException e) {
                    e.printStackTrace();
                    textSalida.append("Error: " + e.getMessage() + "\n");
                } catch (Exception ex) {
                    ex.printStackTrace();
                    textSalida.append("Error RS232: " + ex.getMessage() + "\n");
                }
            }
        };

        recibirHilo.start();

    } catch (IOException ex) {
        JOptionPane.showMessageDialog(this, "Error al configurar el servidor: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        Logger.getLogger(Rs232.class.getName()).log(Level.SEVERE, null, ex);
    }
}


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        ComboBox = new javax.swing.JComboBox<>();
        Configurar = new javax.swing.JButton();
        Ingresar = new javax.swing.JTextField();
        Enviar = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        textSalida = new javax.swing.JTextArea();
        jLabel2 = new javax.swing.JLabel();
        textPuerto = new javax.swing.JTextField();
        btnConectar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        textRecibidos = new javax.swing.JTextArea();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 244, Short.MAX_VALUE)
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Servidor");
        setBackground(new java.awt.Color(204, 0, 204));
        setLocation(new java.awt.Point(520, 180));

        ComboBox.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "COM1", "COM2", "COM3", "COM4", "COM5", "COM6", "COM7" }));
        ComboBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ComboBoxActionPerformed(evt);
            }
        });

        Configurar.setText("Conectar");
        Configurar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ConfigurarActionPerformed(evt);
            }
        });

        Enviar.setText("OK");
        Enviar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                EnviarActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 16)); // NOI18N
        jLabel1.setText("Puerto RS232:");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 16)); // NOI18N
        jLabel3.setText("Ingresar dato:");

        textSalida.setColumns(20);
        textSalida.setRows(5);
        jScrollPane1.setViewportView(textSalida);

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 16)); // NOI18N
        jLabel2.setText("Puerto:");

        btnConectar.setText("Configurar");
        btnConectar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnConectarActionPerformed(evt);
            }
        });

        textRecibidos.setColumns(20);
        textRecibidos.setRows(5);
        jScrollPane2.setViewportView(textRecibidos);

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel4.setText("Datos RS232:");

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel5.setText("Datos ETHERNET:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(14, 14, 14)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(18, 18, 18)
                        .addComponent(textPuerto)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnConectar)
                        .addGap(46, 46, 46))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel1))
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addComponent(Ingresar, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(Enviar, javax.swing.GroupLayout.PREFERRED_SIZE, 78, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addComponent(ComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(36, 36, 36)
                                        .addComponent(Configurar))))
                            .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel5, javax.swing.GroupLayout.Alignment.LEADING))
                        .addGap(74, 74, 74))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 373, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 373, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 39, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(70, 70, 70)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel1)
                            .addComponent(ComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Configurar)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(textPuerto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnConectar))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(Ingresar, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Enviar))
                .addGap(22, 22, 22)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(17, 17, 17))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void ConfigurarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ConfigurarActionPerformed
        // TODO add your handling code here:
    try {
        configuracion = new Parameters();
        configuracion.setPort(ComboBox.getSelectedItem().toString());
        configuracion.setBaudRate(Baud._9600);
        configuracion.setMinDelayWrite(10);
        
        port = new Com(configuracion);
        JOptionPane.showMessageDialog(null, "PUERTO DISPONIBLE Y CONECTADO");
        
        if (!escuchar){
            escuchar = true;
            Thread hilo = new Thread(() -> {
                while(true){
                    leer();
                }
            });
            hilo.start();
        }
    } catch (Exception ex) {
        JOptionPane.showMessageDialog(null, "Error al conectar\nError en el puerto: " 
            + ComboBox.getSelectedItem() + "\n" + ex.getMessage());
        Logger.getLogger(Rs232.class.getName()).log(Level.SEVERE, null, ex);
    }

    }//GEN-LAST:event_ConfigurarActionPerformed

    private void EnviarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_EnviarActionPerformed
        // TODO add your handling code here:
        try {
           String dato = Ingresar.getText().trim();
           port.sendString(dato);
            JOptionPane.showMessageDialog(null, "Dato enviado: " + dato);
    } catch (Exception ex) {
        Logger.getLogger(Rs232.class.getName()).log(Level.SEVERE, null, ex);
    }
        
    }//GEN-LAST:event_EnviarActionPerformed
    
    public abstract class Recibir extends Thread{
        public void run(){
            while(true){
                leer();
            }
        }
    }
    public void leer(){
        try{
            char caracter;
            boolean bandera = false;
            Thread.sleep(1000);
            while((caracter=port.receiveSingleChar())!='\0'){
                cadena+=caracter;
                bandera=true;
            }
            if (bandera==true){
                bandera=false;
                textSalida.setText(cadena);
                cadena="";
            }
        } catch(Exception ex){
            Logger.getLogger(Rs232.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    private void ComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ComboBoxActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_ComboBoxActionPerformed

    private void btnConectarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnConectarActionPerformed
        // TODO add your handling code here:
       configurarServidor();
    }//GEN-LAST:event_btnConectarActionPerformed

    /** 
     * @param args the command line arguments
     */
    
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Rs232.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Rs232.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Rs232.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Rs232.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Rs232().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> ComboBox;
    private javax.swing.JButton Configurar;
    private javax.swing.JButton Enviar;
    private javax.swing.JTextField Ingresar;
    private javax.swing.JButton btnConectar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextField textPuerto;
    private javax.swing.JTextArea textRecibidos;
    private javax.swing.JTextArea textSalida;
    // End of variables declaration//GEN-END:variables
}
