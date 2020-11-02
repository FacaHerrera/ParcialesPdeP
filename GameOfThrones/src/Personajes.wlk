import Conspiraciones.*

class Personaje {
	
	var property casa
	var property conyugues = []
	var property estaVivo = true
	var property acompanantes = []
	var personalidad
	
	method noTienePareja() {
		return conyugues.isEmpty()
	}
	
	method estaAptoParaCasamiento() {
		return self.noTienePareja() && self.estaVivo()
	}
	
	method restriccionCasamiento(unPersonaje) {
		return casa.restriccionCasamientoPara(self, unPersonaje)
	}
	
	method puedeCasarseCon(otroPersonaje) {
		return self.restriccionCasamiento(otroPersonaje) && otroPersonaje.restriccionCasamiento(self)
	}
	
	method casarseCon(unPersonaje) {
		if(!self.puedeCasarseCon(unPersonaje)) {
			throw new Exception(message = "Estos personajes no pueden casarse!")
		}
		
		conyugues.add(unPersonaje)
	}
	
	method esDeLaMismaCasaQue(unPersonaje) {
		return casa.equals(unPersonaje.casa())
	}
	
	method patrimonioPersonal() {
		return casa.patrimonio() / casa.cantidadDeMiembros()
	}
	
	method morir() {
		self.estaVivo(false)
	}
	
	method agregarAcompanante(unAcompanante) {
		acompanantes.add(unAcompanante)
	}
	
	method estaSolo() {
		return acompanantes.isEmpty()
	}
	
	method aliados() {
		return conyugues + acompanantes + casa.miembros()
	}
	
	method patrimonioAliados() {
		return self.aliados().sum({unAliado => unAliado.patrimonioPersonal()})
	}
	
	method alianzaRica() {
		 return self.patrimonioAliados() > 10000
	}
	
	method esDeCasaRica() {
		return casa.esRica()
	}
	
	method conyuguesRicos() {
		return conyugues.all({unConyugue => unConyugue.esDeCasaRica()})
	}
	
	method tieneAlianzaPeligrosa() {
		return self.aliados().any({unAliado => unAliado.esPeligroso()})
	}
	
	method esPeligroso() {
		return self.estaVivo() && (self.alianzaRica() || self.conyuguesRicos() || self.tieneAlianzaPeligrosa())
	}
	
	method accionPersonalizadaCon(unaVictima) {
		personalidad.actuarContra(unaVictima)
	}
	
	method derrochar(unaCantidad) {
		casa.perder(unaCantidad)
	}
	
	method crearConspiracionCon(unaVictima, unosComplotados) {
		if(!unaVictima.esPeligroso()) {
			throw new Exception(message = "La victima no es peligrosa")
		}
		const conspiracion = new Conspiracion(victima = unaVictima, complotados = unosComplotados)
	}
}