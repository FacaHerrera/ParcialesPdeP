class Tripulante {
	var property items = []
	var property nivelEbriedad
	var property dinero
	
	method esUtilPara(unaMision) {
		return unaMision.requisitoPirata(self)
	}
	
	method puedeFormarParteDe(unBarco) {
		return unBarco.aceptaTripulante(self)
	}
	
	method tiene(unElemento) {
		return items.contains(unElemento)
	}
	
	method estaPobre() {
		return dinero <= 5
	}
	
	method cantidadItems() {
		return items.size()
	}
	
	method seAnimaASaquearA(unaVictima)
	method estaPasadoDeGrogXd()
	
	method tomarseUnTrago() {
		if(dinero < 1) throw new Exception(message = "El pirata no tiene suficiente dinero para comprar el trago")
		nivelEbriedad += 5
		dinero -= 1
	}
}

class Pirata inherits Tripulante {
	
	override method seAnimaASaquearA(unaVictima) {
		return nivelEbriedad >= unaVictima.ebriedadMinima()
	}
	
	override method estaPasadoDeGrogXd() {
		return nivelEbriedad >= 90
	}
	
}

class EspiaDeLaCorona inherits Tripulante {
	
	override method seAnimaASaquearA(unaVictima) {
		return items.contains("Permiso de la corona") && nivelEbriedad >= unaVictima.ebriedadMinima()
	}
	
	override method estaPasadoDeGrogXd() {
		return false
	}
	
}
