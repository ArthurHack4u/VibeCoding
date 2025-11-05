
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class impresora {

    /**
     * Representa el recurso compartido (la impresora).
     * Usa un ReentrantLock, que es el equivalente directo de un std::mutex en C++,
     * para controlar el acceso concurrente de manera explícita.
     */
    static class Impresora {
        // El 'Lock' es el mecanismo de bloqueo. ReentrantLock es una implementación concreta.
        private final Lock printerLock = new ReentrantLock();

        public void usarImpresora(int documentoId) {
            // 1. Adquirir el lock (operación 'wait')
            // El hilo actual se bloqueará aquí si otro hilo ya tiene el lock.
            printerLock.lock();
            
            try {
                // 2. Sección Crítica
                // Este bloque de código ahora tiene acceso exclusivo al recurso.
                System.out.println("Imprimiendo documento #" + documentoId + "...");
                Thread.sleep(500); // Simular tiempo de impresión
                System.out.println("Documento #" + documentoId + " completado.");
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                System.err.println("El hilo para el documento #" + documentoId + " fue interrumpido.");
            } finally {
                // 3. Liberar el lock (operación 'signal')
                // Se coloca en el bloque 'finally' para GARANTIZAR que el lock se libere,
                // incluso si ocurre una excepción dentro del 'try'. Esto es crucial
                // para evitar bloqueos permanentes (deadlocks).
                printerLock.unlock();
            }
        }
    }

    /**
     * Una tarea (Runnable) que representa un trabajo de impresión individual.
     * Cada instancia se ejecutará en su propio hilo.
     */
    static class TrabajoDeImpresion implements Runnable {
        private final int documentoId;
        private final Impresora impresora;

        public TrabajoDeImpresion(int documentoId, Impresora impresora) {
            this.documentId = documentoId;
            this.impresora = impresora;
        }

        @Override
        public void run() {
            impresora.usarImpresora(documentoId);
        }
    }

    /**
     * El método principal que inicia y coordina la simulación.
     */
    public static void main(String[] args) {
        final int numDocumentos = 5;
        // Se crea una ÚNICA instancia de la impresora para ser compartida por todos los hilos.
        Impresora impresoraCompartida = new Impresora();
        List<Thread> hilos = new ArrayList<>();

        System.out.println("=== SIMULACIÓN DE IMPRESIÓN CON REENTRANTLOCK ===");
        System.out.println("Iniciando " + numDocumentos + " trabajos de impresión...\n");

        // Crear e iniciar un hilo para cada trabajo de impresión.
        for (int i = 1; i <= numDocumentos; i++) {
            Thread hilo = new Thread(new TrabajoDeImpresion(i, impresoraCompartida));
            hilos.add(hilo);
            hilo.start();
        }

        // Esperar a que todos los hilos terminen su ejecución antes de continuar.
        for (Thread hilo : hilos) {
            try {
                hilo.join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                System.err.println("El hilo principal fue interrumpido.");
            }
        }

        System.out.println("\nTodos los documentos han sido impresos.");
    }
}