import matplotlib
import matplotlib.pyplot as plt
import matplotlib.patches as patches
matplotlib.use('MacOSX')
import tkinter as tk
from tkinter import ttk
import time

def es_valido(tablero, fila, col, N):
    for i in range(col):
        if tablero[fila][i] == 1:
            return False
        if fila - (col - i) >= 0 and tablero[fila - (col - i)][i] == 1:
            return False
        if fila + (col - i) < N and tablero[fila + (col - i)][i] == 1:
            return False
    return True

def dibujar_tablero(ax, tablero, N, fila_act=None, col_act=None, retrocediendo=False, intentos=0, N_reinas=8):
    ax.clear()
    ax.set_xticks(range(N))
    ax.set_yticks(range(N))
    ax.set_xlim(0, N)
    ax.set_ylim(0, N)
    ax.set_xticklabels([])
    ax.set_yticklabels([])
    ax.grid(False)
    ax.set_facecolor('#f5f5f5')

    for i in range(N):
        for j in range(N):
            color = '#e0e0e0' if (i + j) % 2 == 0 else '#b0b0b0'
            ax.add_patch(patches.Rectangle((j, N - i - 1), 1, 1, color=color))

    for i in range(N):
        for j in range(N):
            if tablero[i][j] == 1:
                dibujar_reina(ax, j, N - i - 1)

    if retrocediendo and fila_act is not None and col_act is not None:
        ax.add_patch(patches.Rectangle((col_act, N - fila_act - 1), 1, 1, color='red', alpha=0.5))

    ax.text(N / 2, N + 0.2, f'Intentos: {intentos}  Reinas: {N_reinas}', fontsize=12, ha='center', va='center', color='black')
    plt.pause(0.05)

def dibujar_reina(ax, x, y):
    reina_body = patches.Circle((x + 0.5, y + 0.5), 0.3, linewidth=2, edgecolor='black', facecolor='yellow')
    ax.add_patch(reina_body)
    
    ax.plot([x + 0.2, x + 0.8], [y + 0.9, y + 0.9], color='black', lw=3)
    ax.plot([x + 0.3, x + 0.7], [y + 1.0, y + 1.0], color='black', lw=3)
    ax.plot([x + 0.4, x + 0.6], [y + 1.1, y + 1.1], color='black', lw=3)

def resolver_n_reinas_visual(N):
    tablero = [[0] * N for _ in range(N)]
    columnas = [-1] * N
    fila = 0
    intentos = 0

    fig, ax = plt.subplots(figsize=(6, 6))
    plt.ion()

    def backtrack(col):
        nonlocal fila, intentos
        if col >= N:
            return True
        for row in range(N):
            if es_valido(tablero, row, col, N):
                tablero[row][col] = 1
                columnas[col] = row
                intentos += 1
                dibujar_tablero(ax, tablero, N, intentos=intentos, N_reinas=N)
                if backtrack(col + 1):
                    return True
                tablero[row][col] = 0
                columnas[col] = -1
                dibujar_tablero(ax, tablero, N, fila_act=row, col_act=col, retrocediendo=True, intentos=intentos, N_reinas=N)
                time.sleep(0.1)
        return False

    start_time = time.time()
    backtrack(0)
    end_time = time.time()

    print(f"Tiempo de ejecución: {end_time - start_time:.2f} segundos")

    plt.ioff()
    plt.show()
    return tablero

def lanzar_interfaz():
    def ejecutar_visualizacion():
        N = int(spinbox.get())
        ventana.destroy()
        resolver_n_reinas_visual(N)

    ventana = tk.Tk()
    ventana.title("Problema de las N Reinas")
    ventana.geometry("300x150")
    ventana.resizable(False, False)

    label = tk.Label(ventana, text="Selecciona la cantidad de reinas:", font=("Arial", 12))
    label.pack(pady=10)

    spinbox = ttk.Spinbox(ventana, from_=4, to=20, width=5, font=("Arial", 12), justify='center')
    spinbox.set(8)
    spinbox.pack()

    boton = tk.Button(ventana, text="Resolver", command=ejecutar_visualizacion, font=("Arial", 12), bg="#3498db", fg="white")
    boton.pack(pady=15)

    ventana.mainloop()

lanzar_interfaz()
