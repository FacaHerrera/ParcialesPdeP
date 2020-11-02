class Equipo {
	
	var property jugadores = []
	var property puntos
	
	method habilidadPromedio() {
		return jugadores.sum({unJugador => unJugador.habilidad()}) / jugadores.size()
	}
	
	method tieneJugadorEstrellaParaJugarContra(otroEquipo) {
		return jugadores.any({unJugador => unJugador.esEstrellaContra(otroEquipo)})
	}
	
	method esTrapeadoPor(otroJugador) {
		return jugadores.all({unJugador => otroJugador.lePasaElTrapoA(unJugador)})
	}
	
	method nadiePuedeBloquearA(otroJugador) {
		return jugadores.all({unJugador => !unJugador.puedeBloquearA(otroJugador)})
	}
	
	method bloqueadorDe(otroJugador) {
		return jugadores.find({unJugador => unJugador.puedeBloquearA(otroJugador)})
	}
	
	method ganarPuntos(unaCantidad) {
		puntos += unaCantidad
	}
	
	method alguienPuedeBloquearA(otroJugador) {
		return jugadores.any({unJugador => unJugador.puedeBloquearA(otroJugador)})
	}
	
	method darQuaffleAlMasRapido() {
		const speedster = jugadores.max({unJugador => unJugador.velocidad()})
		speedster.agarrarQuaffle()
	}
	
	method algunJugador() {
		return jugadores.anyOne()
	}
	
	method noTieneQuaffle() {
		return jugadores.all({unJugador => !unJugador.tieneLaQuaffle()})
	}
}
