import Pelotas.*

class Jugador {
	
	var property peso
	var property skills
	var property escoba
	var property punteria
	var property fuerza
	var property reflejos
	var property vision
	var property posicion
	var property equipo
	
	method nivelDeManejoDeEscoba() {
		return skills / peso
	}
	
	method velocidad() {
		return self.nivelDeManejoDeEscoba() * escoba.velocidad()
	}
	
	method habilidad() {
		return posicion.calculoDeHabilidadDe(self)
	}
	
	method lePasaElTrapoA(otroJugador) {
		return self.habilidad() > 2 * otroJugador.habilidad()
	}
	
	method masHabilidadQueElPromedio() {
		return self.habilidad() > equipo.habilidadPromedio()
	}
	
	method esGroso() {
		return self.masHabilidadQueElPromedio() && self.velocidad() > escoba.valorArbitrarioDeVelocidad()
	}
	
	method esEstrellaContra(otroEquipo) {
		return otroEquipo.esTrapeadoPor(self)
	}
	
	method jugarContra(unEquipo) {
		posicion.jugarPara(self, unEquipo)
	}
	
	method tieneLaQuaffle() {
		return posicion.tieneQuaffle()
	}
	
	method aumentarSkillsEn(unaCantidad) {
		skills += unaCantidad
	}
	
	method perderSkills(unaCantidad) {
		skills -= unaCantidad	
	}
	
	method anotar() {
		self.aumentarPuntosDeEquipoEn(10)
	}
	
	method aumentarPuntosDeEquipoEn(unaCantidad) {
		equipo.ganarPuntos(unaCantidad)
	}
	
	method perderQuaffleContra(unEquipo) {
		posicion.tieneQuaffle(false)
		unEquipo.darQuaffleAlMasRapido()
	}
	
	method puedeBloquearA(otroJugador) {
		return posicion.puedeBloquearTiro(self, otroJugador)
	}
	
	method esquivaTodosLosBloqueosDe(unEquipo) {
		return unEquipo.nadiePuedeBloquearA(self)
	}
	
	method puedeGolpearA(otroJugador) {
		const random = (1..10).anyOne()
		return punteria > otroJugador.reflejos() || random >= 8
	}
	
	method esBlancoUtil() {
		return posicion.blancoUtil(self)
	}
	
	method equipoSinQuaffle() {
		return equipo.noTieneQuaffle()
	}
	
	method serGolepeadoPorUnaBludger() {
		self.perderSkills(2)
		escoba.recibirGolpe()
		posicion.recibirGolpeDeBludger()
	}
	
	method agarrarQuaffle() {
		posicion.agarrarQuaffle()
	}
	
	method agarrarSnitch() {
		snitch.sumarPuntosPara(equipo)
	}
}

class Escoba {
	
	var property valorArbitrarioDeVelocidad
	
}

object nimbus inherits Escoba {
	
	var anioFabricacion
	var porcentajeSalud
	
	method aniosDesdeFabricacion() {
		return new Date().year() - anioFabricacion
	}
	
	method velocidad() {
		return 80 - (self.aniosDesdeFabricacion() * porcentajeSalud)
	}
	
	method recibirGolpe() {
		porcentajeSalud *= 0.9
	}
}

object saetaDeFuego inherits Escoba {
	
	method velocidad() {
		return 100
	}
	
	method recibirGolpe() {
		
	}
	
}