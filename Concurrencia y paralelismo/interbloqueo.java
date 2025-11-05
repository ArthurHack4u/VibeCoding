import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class interbloqueo {
    private static final Lock mutex1 = new ReentrantLock();
    private static final Lock mutex2 = new ReentrantLock();

    public static void main(String[] args) {
        Thread hilo1 = new Thread(() -> {
            mutex1.lock();
            try {
                System.out.println("Hilo 1 seleccionando el bloque 1");
                try { Thread.sleep(200); 
                } catch (Exception e) 
                {
                    //handle
                }
                System.out.println("Hilo 1 esperando el bloque 2");
                mutex2.lock();
                try {
                    System.out.println("Hilo 1 adquiriendo el bloque 2");
                } finally {
                    mutex2.unlock();
                }
            } finally {
                mutex1.unlock();
            }
        });

        Thread hilo2 = new Thread(() -> {
            mutex2.lock();
            try {
                System.out.println("Hilo 2 seleccionando el bloque 2");
                try { Thread.sleep(200); 
                } catch (Exception e) {
                    //handle
                }
                System.out.println("Hilo 2 esperando el bloque 1");
                mutex1.lock();
                try {
                    System.out.println("Hilo 2 adquiriendo el bloque 1");
                } finally {
                    mutex1.unlock();
                }
            } finally {
                mutex2.unlock();
            }
        });

        hilo1.start();
        hilo2.start();
    }
}