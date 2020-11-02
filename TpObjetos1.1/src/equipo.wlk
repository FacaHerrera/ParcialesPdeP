import jugadores.*
import entrenadores.*

class Equipo {
	
	var property titulares = []
	var property entrenador
	
	method valoracionTotal() {
		var valoracion = self.valoracion()
		if(self.sonTodosSucios() || self.sonTodosLimpios()) valoracion += 10
		return valoracion * entrenador.bonificacionDe(self)
	}
	
	method valoracion() {
		const prevaloracion =  titulares.sum({unJugador => unJugador.habilidad()})
		return prevaloracion / titulares.size()
	}
	
	method sonTodosSucios() {
		return titulares.all({unJugador => unJugador.esSucio()})
	}
	
	method sonTodosLimpios() {
		return titulares.all({unJugador => unJugador.esSucio().negate()})
	}
	
	method esDreamTeam() {
		return titulares.any({unJugador => unJugador.esLeyenda()})
	}
	
	method esDeAltoRendimiento() {
		return titulares.all({unJugador => unJugador.esDeAltoRendimiento()})
	}
	
	method esMedioPelo() {
		return self.valoracion() < 75
	}
	
	method convertirTodosA(unEstilo) {
		titulares.forEach({unJugador => unJugador.estilo(unEstilo)})
	}
	
	method entrenarse() {
		titulares.forEach({unJugador => entrenador.entrenarA(unJugador)})
	}
}

//const pdepTeam = new Equipo(titulares = [juan, franco, aye], entrenador = pipeScarpa)
