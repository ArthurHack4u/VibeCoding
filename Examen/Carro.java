// Clase que representa un vehículo. Se podría extender para simular distintas marcas o comportamientos.
class Carro {
    @SuppressWarnings("unused")
    private String marca;
    private double pagoPorHora; // Base: 50 pesos (puede variar según la cuota)

    public Carro(String marca, double pagoPorHora) {
        this.marca = marca;
        this.pagoPorHora = pagoPorHora;
    }

    // Simula el acto de pagar para poder pasar.
    public double pagar() {
        return pagoPorHora;
    }
}
