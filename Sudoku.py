import tkinter as tk
from tkinter import messagebox
import random

def is_valid(board, row, col, num):
    for i in range(9):
        if board[row][i] == num or board[i][col] == num:
            return False
    start_row, start_col = 3 * (row // 3), 3 * (col // 3)
    for i in range(3):
        for j in range(3):
            if board[start_row + i][start_col + j] == num:
                return False
    return True

def solve_sudoku(board):
    for row in range(9):
        for col in range(9):
            if board[row][col] == 0:
                for num in random.sample(range(1, 10), 9):  # ← Aquí se aleatoriza el orden
                    if is_valid(board, row, col, num):
                        board[row][col] = num
                        if solve_sudoku(board):
                            return True
                        board[row][col] = 0
                return False
    return True

class SudokuApp:
    def __init__(self, root):
        self.root = root
        self.root.title("🧩 Solucionador de Sudoku")

        titulo = tk.Label(root, text="🧩 Solucionador de Sudoku", font=('Arial', 20, 'bold'), pady=10)
        titulo.grid(row=0, column=0, columnspan=9)

        self.entries = [[None for _ in range(9)] for _ in range(9)]
        self.fijos = [[False for _ in range(9)] for _ in range(9)]

        for i in range(9):
            for j in range(9):
                border = {
                    'top': 2 if i % 3 == 0 else 1,
                    'left': 2 if j % 3 == 0 else 1
                }

                frame = tk.Frame(self.root, highlightbackground="black", highlightthickness=0)
                frame.grid(row=i + 1, column=j, padx=(border['left'], 0), pady=(border['top'], 0))

                entry = tk.Entry(frame, width=2, font=('Arial', 20), justify='center', relief='flat')
                entry.pack(ipadx=10, ipady=10)

                self.entries[i][j] = entry

        botones_frame = tk.Frame(root)
        botones_frame.grid(row=10, column=0, columnspan=9, pady=15)

        btn_resolver = tk.Button(botones_frame, text="Resolver", command=self.solve,
                                 bg="#4CAF50", fg="white", font=('Arial', 12, 'bold'), width=15)
        btn_resolver.grid(row=0, column=0, padx=5)

        btn_generar = tk.Button(botones_frame, text="Generar Aleatorio", command=self.generar_aleatorio,
                                bg="#2196F3", fg="white", font=('Arial', 12, 'bold'), width=20)
        btn_generar.grid(row=0, column=1, padx=5)

        btn_limpiar = tk.Button(botones_frame, text="Limpiar Todo", command=self.limpiar_tablero,
                                bg="#f44336", fg="white", font=('Arial', 12, 'bold'), width=15)
        btn_limpiar.grid(row=0, column=2, padx=5)

    def solve(self):
        board = []
        try:
            for i in range(9):
                row = []
                for j in range(9):
                    val = self.entries[i][j].get()
                    row.append(int(val) if val else 0)
                board.append(row)
        except ValueError:
            messagebox.showerror("Error", "Solo se permiten números del 1 al 9")
            return

        if all(cell == 0 for row in board for cell in row):
            messagebox.showinfo("Vacío", "Por favor, llena al menos una celda para resolver.")
            return

        self.fijos = [[bool(self.entries[i][j].get()) for j in range(9)] for i in range(9)]

        if solve_sudoku(board):
            for i in range(9):
                for j in range(9):
                    self.entries[i][j].config(state='normal')
                    self.entries[i][j].delete(0, tk.END)
                    self.entries[i][j].insert(0, str(board[i][j]))
                    if self.fijos[i][j]:
                        self.entries[i][j].config(state='readonly', fg='blue', readonlybackground='white')
                    else:
                        self.entries[i][j].config(state='normal', fg='black')
        else:
            messagebox.showinfo("Sin solución", "No se pudo encontrar una solución válida.")

    def generar_aleatorio(self):
        board = [[0 for _ in range(9)] for _ in range(9)]
        solve_sudoku(board)

        tablero = [row.copy() for row in board]
        vaciar = random.randint(40, 60)
        self.fijos = [[False for _ in range(9)] for _ in range(9)]

        while vaciar > 0:
            i, j = random.randint(0, 8), random.randint(0, 8)
            if tablero[i][j] != 0:
                tablero[i][j] = 0
                vaciar -= 1

        for i in range(9):
            for j in range(9):
                self.entries[i][j].config(state='normal')
                self.entries[i][j].delete(0, tk.END)
                if tablero[i][j] != 0:
                    self.entries[i][j].insert(0, str(tablero[i][j]))
                    self.entries[i][j].config(state='readonly', fg='blue', readonlybackground='white')
                    self.fijos[i][j] = True
                else:
                    self.entries[i][j].config(state='normal', fg='black')

    def limpiar_tablero(self):
        for i in range(9):
            for j in range(9):
                self.entries[i][j].config(state='normal')
                self.entries[i][j].delete(0, tk.END)
                self.entries[i][j].config(fg='black')
                self.fijos[i][j] = False

# Ejecutar aplicación
if __name__ == "__main__":
    root = tk.Tk()
    app = SudokuApp(root)
    root.mainloop()