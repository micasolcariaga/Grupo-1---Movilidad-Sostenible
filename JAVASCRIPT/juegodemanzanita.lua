


juegodemanzanita.js

let cuadrilla = document.querySelector(".cuadrilla") 
let popup = document.querySelector(".popup"); 
let juegaDeNuevo = document.querySelector(".juegaDeNuevo"); 
let muestraPuntaje = document.querySelector(".muestraPuntaje") 
let izquierda = document.querySelector(".izquierda") 
let fondo = document.querySelector(".fondo") 
let derecha = document.querySelector(".derecha") 
let arriba = document.querySelector(".superior") 
let ancho = 10; 
let indiceActual = 0 
let indiceManzana = 0 
let serpienteActual = [2,1,0] 
let direccion = 1 
let puntaje = 0 
let velocidad = 0.8 
let tiempoInterval = 0 
let interval = 0

document.addEventListener("DOMContentLoaded",function(){ 
    document.addEventListener("keyup",control) 
    crearTablero() 
    comiezaJuego() 
    juegaDeNuevo.addEventListener("click", repeticion); 
})


function crearTablero(){ 
    popup.style.display = "none"; 
    for(let i=0;i<100;i++){
        let div = document.createElement("div") 
        cuadrilla.appendChild(div) 
    }
} 

function comenzaJuego(){ 
    let cuadrados = document.querySelectorAll(".cuadrilla div") 
    manzanaAlAzar(cuadrados) 
    // manzana al azar
    direccion = 1 
    mostrarPuntaje.innerHTML = puntaje 
    tiempoInterval = 1000 
    serpienteActual = [2,1,0] 
    indiceActual = 0 
    serpienteActual.forEach(index => cuadrados[index].classList.add("serpiente")) 
    interval = setInterval(moverResultado,tiempoInterval) 
    } 


    function moverResultado() { 
        let cuadrados = document.querySelectorAll(".cuadrilla div") 
        if(compruebaPorGolpes(squares)) {
        alert("golpeaste algo") 
        popup.style.display="flex" 
        return clearInterval(interval) 
        } else { 
        mueveSerpiente(cuadrados) 
        }
        } 

        function mueveSerpiente(cuadrados){
            let cola = serpienteActual.pop()  
            cuadrados[cola].classList.remove("serpiente") 
            serpienteActual.unshift(serpienteActual[0]+direccion)  
            // movimiento termina aquí
            comeManzanas(cuadrados,cola)  
            cuadrados[serpienteActual[0]].classList.add("serpiente")  
            } 
            function compruebaPorGolpes(cuadrados) {  
                if (  
                (serpienteActual[0] + ancho >=(ancho * ancho) && direccion === ancho) ||
                (serpienteActual[0] % ancho === ancho -1 && direccion ===1) ||   
                (serpienteActual[0] % ancho === 0 && direccion === -1) ||   
                (serpienteActual[0] - ancho <= 0 && direccion === -ancho) ||
                cuadrados[serpienteActual[0] + direccion].classList.contains("serpiente") 
                ) { 
                    return true  
                } else {  
                    return false 
                }
            }   

            function comeManzanas(cuadrados,cola){ 
                if(cuadrados[serpienteActual[0]].classList.contains("manzanas")){ 
                    cuadrados[serpienteActual[0]].classList.remove("manzanas") 
                    cuadrados[cola].classList.add("serpiente") 
                    serpienteActual.push(cola)
                    manzanaAlAzar(cuadrados) 
                    puntaje++ 
                    muestraPuntaje.textContent = puntaje 
                    clearInterval(interval) 
                    tiempoInterval = tiempoInterval * velocidad 
                    interval = setInterval(moverResultado, tiempoInterval) 
                }
            } 
            function manzanaAlAzar(cuadrados){ 
                do { 
                    appleIndex = Math.floor(Math.random() * cuadrados.length) 
                } while(cuadrados[appleIndex].classList.contains("serpiente")) 
                    cuadrados[appleIndex].classList.add("manzana") 
                } 

                function control(e){ 
                    if (e.keycode === 39){
                        direccion = 1 // derecha 
                    } else if (e.keycode === 38){ 
                        direccion = -ancho // si presionamos la flecha de arriba, la serpiente irá 10 divs hacia arriba
                    }else if (e.keycode === 37){ 
                        direccion = -1 // izquierda, la serpiente irá un div a la izquierda
                    }else if (e.keycode === 40){
                        direccion = +ancho // la serpiente irá 10 divs hacia abajo desde el div actual
                    } 
                } 

arriba.addEventListener("click",() => direccion = -ancho ) 
fondo.addEventListener("click",() => direccion = +ancho ) 
izquierda.addEventListener("click",() => direccion = -1 ) 
derecha.addEventListener("click",() => direccion = 1 )

function repetición() { 
    cuadrilla.innerHTML="" 
    crearTablero()   
    comiezaJuego()  
    popup.style.display = "none"; 
    }  







