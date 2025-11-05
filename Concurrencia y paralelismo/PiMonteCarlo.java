import java.util.Random;

public class PiMonteCarlo {

    public static void main(String[] args) {
        // Define el número total de "dardos" que vamos a lanzar.
        // Mientras más alto sea este número, más precisa será la aproximación.
        long totalPuntos = 10000000;

        estimarPi(totalPuntos);
    }

    public static void estimarPi(long totalPuntos) {
        if (totalPuntos <= 0) {
            System.out.println("El número de puntos debe ser positivo.");
            return;
        }

        long puntosEnCirculo = 0;
        Random random = new Random();

        System.out.println("Iniciando simulación con " + totalPuntos + " puntos...");

        // Este es el bucle principal de la simulación.
        // Se repite una vez por cada "dardo" que lanzamos.
        for (long i = 0; i < totalPuntos; i++) {
            // Genera coordenadas aleatorias (x, y) entre -1.0 y 1.0.
            // Esto simula lanzar un dardo a un cuadrado de 2x2 centrado en el origen.
            double x = random.nextDouble() * 2.0 - 1.0;
            double y = random.nextDouble() * 2.0 - 1.0;

            // Calcula el cuadrado de la distancia desde el punto (x, y) al origen (0,0).
            // La fórmula de la distancia es sqrt(x^2 + y^2). Para estar dentro de un círculo
            // de radio 1, la distancia debe ser <= 1.
            // Para optimizar, evitamos la raíz cuadrada (sqrt) y comparamos los cuadrados:
            // x^2 + y^2 <= 1^2, que es lo mismo que x^2 + y^2 <= 1.
            double distanciaCuadrada = x * x + y * y;

            // Si el punto cae dentro del círculo (o en su borde), incrementamos el contador.
            if (distanciaCuadrada <= 1.0) {
                puntosEnCirculo++;
            }
        }

        double piEstimado = 4.0 * puntosEnCirculo / totalPuntos;

        System.out.println("---------------------------------------------");
        System.out.println("Total de puntos generados: " + totalPuntos);
        System.out.println("Puntos que cayeron dentro del círculo: " + puntosEnCirculo);
        System.out.printf("Estimación de Pi: %.8f%n", piEstimado);
        System.out.printf("Valor real de Pi: %.8f%n", Math.PI);
        System.out.println("---------------------------------------------");
    }
}