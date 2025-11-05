public class AlgoritmoHanoi {
    public void hanoi(int discos, char torre1, char torre2, char torre3){
        if(discos == 1){
            System.out.println("Mover disco de torre " + torre1 + " a torre " + torre3);
        }else{
            hanoi(discos - 1, torre1, torre3, torre2);
            System.out.println("Mover disco de torre " + torre1 + " a torre " + torre3);
            hanoi(discos - 1, torre2, torre1, torre3);
        }
    }

    public static void main(String[] args) {
        AlgoritmoHanoi hanoi = new AlgoritmoHanoi();
        hanoi.hanoi(3, 'A', 'B', 'C');
            }
}