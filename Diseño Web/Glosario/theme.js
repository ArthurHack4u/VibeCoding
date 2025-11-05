const darkMode = document.querySelector(".dark-mode");
const body = document.body;
const header = document.querySelector("header");
const footer = document.querySelector("footer");

// Función para alternar entre modo oscuro y claro
darkMode.addEventListener("click", () => {
    body.classList.toggle("active");
    header.classList.toggle("active");
    footer.classList.toggle("active");

    // Guardamos el tema en el localStorage
    if (body.classList.contains("active")) {
        localStorage.setItem("theme", "dark");
    } else {
        localStorage.setItem("theme", "light");
    }
});

// Comprobamos si el usuario ya tiene un tema guardado y aplicamos el tema al cargar la página
document.addEventListener("DOMContentLoaded", () => {
    const currentTheme = localStorage.getItem("theme");

    if (currentTheme === "dark") {
        body.classList.add("active");
        header.classList.add("active");
        footer.classList.add("active");
    } else {
        body.classList.remove("active");
        header.classList.remove("active");
        footer.classList.remove("active");
    }
});
