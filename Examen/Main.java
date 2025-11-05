// Simulación de un puente con peaje, donde se generan vehículos aleatorios y se calcula el total recaudado.
// Clase principal para ejecutar la simulación.
public class Main {
    public static void main(String[] args) {
        final int totalHoras = 7 * 24;  // 7 días, 24 horas cada uno.
        final int vehiculosPorHora = 100;
        final double baseFee = 50.0;
        double totalRecaudado = 0.0;

        Puente puente = new Puente(vehiculosPorHora, baseFee);

        for (int hora = 0; hora < totalHoras; hora++) {
            totalRecaudado += puente.simularHora();
        }

        System.out.printf("Total recaudado en la semana simulada: %.2f pesos\n", totalRecaudado);
    }
}
