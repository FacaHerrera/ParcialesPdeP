import Expediciones.*
import Locaciones.*

class Vikingo {
	
	var property castaSocial
	var property dinero
	
	method esProductivo()
	
	method puedeSubirAExpedicion() {
		return castaSocial.criterioExpedicion(self)
	}
	
	method ascender() {
		castaSocial.ascenderA(self)
	}
	
	method esSoldado() {
		return false
	}
	
	method subirA(unaExpedicion) {
		if(!self.puedeSubirAExpedicion()) {
			throw new Exception(message = "El vikingo no puede subir a una expedicion")
		}
		unaExpedicion.agregarA(self)
	}
	
	method cobrar(unaCantidad) {
		dinero += unaCantidad
	}
	
}

class Soldado inherits Vikingo {
	
	var property victimas
	var property armas
	
	method tieneArmas() {
		return armas > 0
	}
	
	override method esProductivo() {
		return self.matoAMasDe(20) && self.tieneArmas()
	}
	
	method matoAMasDe(unaCantidad) {
		return victimas > unaCantidad
	}
	
	method agregarArmas(unaCantidad) {
		armas += unaCantidad
	}
	
	override method esSoldado() {
		return true
	}
	
}

class Granjero inherits Vikingo {
	
	var property hectareas
	var property hijos
	
	override method esProductivo() {
		return hectareas >= 2 * hijos
	}
	
	method agregarHectareas(unaCantidad) {
		hectareas += unaCantidad
	}
	
	method agregarHijos(unaCantidad) {
		hijos += unaCantidad
	}
	
}

class CastaSocial {
	method criterioExpedicion(unVikingo) {
		return unVikingo.esProductivo()
	}
	
	method ascenderA(unVikingo)
}

object jarl inherits CastaSocial {
	
	override method criterioExpedicion(unVikingo) {
		return unVikingo.esProductivo() && !unVikingo.tieneArmas()
	}
	
	override method ascenderA(unVikingo) {
		unVikingo.castaSocial(karl)
		if(unVikingo.esSoldado()) {
			unVikingo.agregarArmas(10)
		}
		else{
			unVikingo.agregarHectareas(2)
			unVikingo.agregarHijos(2)
		}
	}
	
}

object karl inherits CastaSocial {
	
	override method ascenderA(unVikingo) {
		unVikingo.castaSocial(thrall)
	}
}
object thrall inherits CastaSocial {
	
	override method ascenderA(unVikingo) {
	
	}
}
