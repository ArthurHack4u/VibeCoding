#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int contador = 0;

pthread_mutex_t mutexCompatidor;

void *rutina_hilo(void *arg) {
    printf("Inicia el primer hilo\n");
    for (int i = 0; i < 10; i++) {
        pthread_mutex_lock(&mutexCompatidor);
        int curr_value = contador;
        usleep(100000);
        curr_value++;
        contador = curr_value;
        pthread_mutex_unlock(&mutexCompatidor);
    }
    printf("Termina el primer hilo\n");
    return NULL;
}

void *rutina_hilo2(void *arg) {
    printf("Inicia el segundo hilo\n");
    for (int i = 0; i < 8; i++) {
        pthread_mutex_lock(&mutexCompatidor);
        int curr_value = contador;
        curr_value++;
        contador = curr_value;
        pthread_mutex_unlock(&mutexCompatidor);
    }
    printf("Termina el segundo hilo\n");
    return NULL;
}

int main(int argc, char *argv[]) {
    pthread_t hilo_uno, hilo_dos;

    pthread_mutex_init(&mutexCompatidor, NULL);

    if (0 != pthread_create(&hilo_uno, NULL, rutina_hilo, NULL)) 
       return -1;



    if (0 != pthread_create(&hilo_dos, NULL, rutina_hilo2, NULL)) 
       return -1;
    

    pthread_join(hilo_uno, NULL);
    pthread_join(hilo_dos, NULL);

    printf("Valor final del contador: %d\n", contador);

    pthread_mutex_destroy(&mutexCompatidor);

    return 0;
}