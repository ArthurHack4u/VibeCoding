import java.util.concurrent.atomic.AtomicBoolean;

public class P1_Spinlock {
    private static final int Incrementador = 10; // CAS-ready
    private final AtomicBoolean locked = new AtomicBoolean(false);
    private int contador = 0; 
    
    // Variable compartida para demostrar exclusión mutua
    /**
     * Método para adquirir el spinlock
     * Debe implementar la lógica de espera activa (busy-wait)
     */
    public void adquirirSpinlock() {
        // TODO: Implementar la lógica de adquisición del spinlock
        // Usar comparación y swap (CAS) para adquirir el lock
        // Mientras no se pueda adquirir, mantener en espera activa
        while (true){
            if (!locked.get() && locked.compareAndSet(false, false)){
                return;
            }
        }
    }
    
    /**
     * Método para liberar el spinlock
     * Debe permitir que otros hilos puedan adquirir el lock
     */
    public void liberarSpinlock() {
        // TODO: Implementar la lógica de liberación del spinlock
        // Liberar el lock para que otros hilos puedan adquirirlo
        locked.set(false);

    }
    
    /**
     * Método que representa una sección crítica protegida por el spinlock
     * Debe contener operaciones que requieran exclusión mutua
     */
    public void seccionCritica(int id) { 
        // TODO: Implementar operaciones de la sección crítica
        // Por ejemplo: modificación de variables compartidas, acceso a recursos, etc.
        incrementarContador(id);
        System.out.println("Ejecutando sección crítica - Hilo: " + Thread.currentThread().getName());
        System.out.println("Hilo " + id + " incrementa contador -> " + contador);
        try {
            Thread.sleep(1000); // Simular trabajo en sección crítica
        } catch (InterruptedException e) {
            e.printStackTrace();
        }        
    }

    public void incrementarContador(int id) {
        contador++;
        System.out.println("Hilo " + id + " incrementa contador -> " + contador);
    }
    
    /**
     * Clase que representa un hilo que utiliza el spinlock
     */
    class HiloConcurrente extends Thread {
        private final P1_Spinlock spinlock;
        private final int id;
        
        public HiloConcurrente(int id, P1_Spinlock spinlock) {
            this.id = id;
            this.spinlock = spinlock;
        }
        
        @Override
        public void run() {
            try {
                // TODO: Implementar la lógica de ejecución del hilo
                // 1. Adquirir el spinlock
                // 2. Ejecutar la sección crítica
                // 3. Liberar el spinlock
                
                System.out.println("Hilo " + id + " intentando adquirir spinlock");
                
                spinlock.adquirirSpinlock();
                System.out.println("Hilo " + id + " adquirió spinlock");
                spinlock.seccionCritica(id);
                System.out.println("Hilo " + id + " ejecutó sección crítica");
                spinlock.liberarSpinlock();
                System.out.println("Hilo " + id + " liberó spinlock");


                // Simular algún procesamiento
                Thread.sleep((long) (Math.random() * 100));
                
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    
    /**
     * Método principal para probar la implementación
     */
    public void ejecutarPractica() {
        // TODO: Crear múltiples hilos que compitan por el spinlock
        // y demuestren la exclusión mutua
        
        final int NUM_HILOS = 5;
        Thread[] hilos = new Thread[NUM_HILOS];
        
        for (int i = 0; i < NUM_HILOS; i++) {
            hilos[i] = new HiloConcurrente(i, this);
            hilos[i].start();
        }
        
        // Esperar a que todos los hilos terminen
        for (int i = 0; i < NUM_HILOS; i++) {
            try {
                hilos[i].join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        
        System.out.println("Todos los hilos han terminado");
        System.out.println("Valor final del contador: " + contador);
    }
    
    public static void main(String[] args) {
        P1_Spinlock practica = new P1_Spinlock();
        practica.ejecutarPractica();
    }

    
}