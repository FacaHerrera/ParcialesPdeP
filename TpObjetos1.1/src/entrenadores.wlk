import jugadores.*
import equipo.*
import TiposEntrenador.*

class Entrenador {
	const nombre
	const apellido
	const edad
	const tipo
	
	method entrenarA(unJugador) {
		unJugador.entrenarse()
	}
	
	method dirigirA(unEquipo) {
		unEquipo.entrenador(self)
	}
	
	method entrenamientoDe(unEquipo) {
		unEquipo.entrenarse()
		tipo.entrenarA(unEquipo)
	}
	
	method bonificacionDe(unEquipo) {
		return tipo.bonificacionPara(unEquipo)
	}
}

//const pipeScarpa = new Entrenador(nombre = "Felipe", apellido = "Scarpa", edad = 25, multiplicadorHabilidad = 1.2, equipo = pdepTeam, tipo = motivador)
