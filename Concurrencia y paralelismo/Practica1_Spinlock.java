import java.util.concurrent.atomic.AtomicBoolean;

public class Practica1_Spinlock {
    private final AtomicBoolean locked = new AtomicBoolean(false);
    // (Opcional) recurso compartido para visualizar la exclusión mutua
    private int contadorCompartido = 0;

    /**
     * Método para adquirir el spinlock
     * Implementa espera activa con CAS.
     */
    public void adquirirSpinlock() {
        // Intenta pasar de false -> true. Si falla, otro hilo posee el lock.
        while (!locked.compareAndSet(false, true)) {
            // Sugerencia al CPU de que estamos en espera activa (Java 9+).
            // En JDKs antiguos puedes cambiar por Thread.yield();
            Thread.onSpinWait();
        }
        // En este punto el hilo actual posee el lock.
    }

    /**
     * Método para liberar el spinlock
     * Permite que otros hilos puedan adquirir el lock.
     */
    public void liberarSpinlock() {
        // Pasar el estado a false libera el lock.
        locked.set(false);
    }

    /**
     * Método que representa una sección crítica protegida por el spinlock.
     * Aquí van operaciones que requieren exclusión mutua.
     */
    public void seccionCritica() {
        // Ejemplo: modificar un recurso compartido de forma segura
        int previo = contadorCompartido;
        contadorCompartido = previo + 1;

        System.out.println(
            "Ejecutando sección crítica - Hilo: " + Thread.currentThread().getName() +
            " | contador: " + previo + " -> " + contadorCompartido
        );

        // (Opcional) simular trabajo dentro de la sección crítica
        try {
            Thread.sleep((long) (Math.random() * 50));
        } catch (InterruptedException ignored) {}
    }

    /**
     * Clase que representa un hilo que utiliza el spinlock
     */
    class HiloConcurrente extends Thread {
        private final Practica1_Spinlock spinlock;
        private final int id;

        public HiloConcurrente(int id, Practica1_Spinlock spinlock) {
            this.id = id;
            this.spinlock = spinlock;
            setName("Hilo-" + id);
        }

        @Override
        public void run() {
            try {
                // Trabajo fuera de la sección crítica (simulación)
                Thread.sleep((long) (Math.random() * 100));

                System.out.println("Hilo " + id + " intentando adquirir spinlock");
                spinlock.adquirirSpinlock();
                System.out.println("Hilo " + id + " adquirió el spinlock");

                try {
                    // Sección crítica protegida
                    spinlock.seccionCritica();
                } finally {
                    // Asegura liberar el lock incluso si hay excepciones
                    spinlock.liberarSpinlock();
                    System.out.println("Hilo " + id + " liberó el spinlock");
                }

                // Trabajo fuera de la sección crítica (simulación)
                Thread.sleep((long) (Math.random() * 100));

            } catch (InterruptedException e) {
                // Restablecer el estado de interrupción si fuese necesario
                Thread.currentThread().interrupt();
                e.printStackTrace();
            }
        }
    }

    /**
     * Método principal para probar la implementación
     */
    public void ejecutarPractica() {
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
                Thread.currentThread().interrupt();
                e.printStackTrace();
            }
        }

        System.out.println("Todos los hilos han terminado. Valor final del contador: " + contadorCompartido);
    }

    public static void main(String[] args) {
        Practica1_Spinlock practica = new Practica1_Spinlock();
        practica.ejecutarPractica();
    }
}
