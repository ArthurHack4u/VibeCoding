// Clase que representa el puente, que contiene la cuota, dos casetas (una para cada entrada)
// y simula el tráfico de vehículos.
class Puente {
    private int vehiculosPorHora;
    private Cuota cuota;
    private Caseta caseta1;
    private Caseta caseta2;

    public Puente(int vehiculosPorHora, double baseFee) {
        this.vehiculosPorHora = vehiculosPorHora;
        this.cuota = new Cuota(baseFee);
        this.caseta1 = new Caseta();
        this.caseta2 = new Caseta();
    }

    // Simula el cobro durante una hora.
    public double simularHora() {
        double feeActual = cuota.getFee();
        double totalHora = 0;
        // Se asume que los vehículos se distribuyen equitativamente entre las dos casetas.
        for (int i = 0; i < vehiculosPorHora; i++) {
            double pago = feeActual;
            if (i % 2 == 0) {
                totalHora += caseta1.registrarPago(pago);
            } else {
                totalHora += caseta2.registrarPago(pago);
            }
        }
        return totalHora;
    }
}