import java.util.concurrent.locks.ReentrantLock;

public class practica_hilos {

    private static int contador = 0;
    private static ReentrantLock lock = new ReentrantLock();

    public static void main(String[] args) {

        Thread HiloUNO = new Thread(() -> {
            System.out.println("Inicia hilo uno");
            for (int i = 0; i < 10; i++) {
                lock.lock();
                try {
                    int currValue = contador;
                    try {
                        Thread.sleep(100); // 100 ms
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    currValue++;
                    contador = currValue;
                } finally {
                    lock.unlock();
                }
            }
            System.out.println("Finaliza hilo uno");
        });

        Thread HiloDOS = new Thread(() -> {
            System.out.println("Inicia hilo dos");
            for (int i = 0; i < 8; i++) {
                lock.lock();
                try {
                    int currValue = contador;
                    currValue++;
                    contador = currValue;
                } finally {
                    lock.unlock();
                }
            }
            System.out.println("Finaliza hilo dos");
        });

        HiloUNO.start();
        HiloDOS.start();

        try {
            HiloUNO.join();
            HiloDOS.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("El valor actual es: " + contador);
    }
}