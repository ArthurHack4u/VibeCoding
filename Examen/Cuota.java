import java.util.Random;

// Clase que representa la cuota que se cobra para cubrir costos de operación y mantenimiento.
class Cuota {
    private double baseFee;
    private Random random;

    public Cuota(double baseFee) {
        this.baseFee = baseFee;
        this.random = new Random();
    }

    // Calcula la cuota con una variación aleatoria del 10% (puede ser -10% o +10%).
    public double getFee() {
        double variation = 1 + (random.nextDouble() * 0.2 - 0.1); // Valor entre 0.9 y 1.1
        return baseFee * variation;
    }
}
