class Suenio {
	
	const property felicidonios
	
	method puedeCumplirsePara(unaPersona) {
		return true
	}
	
	method cumplirsePara(unaPersona)
	
	method tieneMasDe100Felicidonios() {
		return felicidonios > 100
	}
	
}

class Recibirse inherits Suenio {
	
	const carrera
	
	override method puedeCumplirsePara(unaPersona) {
		return unaPersona.deseaRecibirseDe(carrera) && !unaPersona.estaRecibidoDe(carrera)
	}
	
	override method cumplirsePara(unaPersona) {
		unaPersona.recibirseDe(carrera)
	}
	
}

class AdoptarHijos inherits Suenio {
	
	const cantidadHijos
	
	override method puedeCumplirsePara(unaPersona) {
		return !unaPersona.tieneHijos()
	}
	
	override method cumplirsePara(unaPersona) {
		unaPersona.agregarHijos(cantidadHijos)
	}
	
}

class TenerHijo inherits Suenio {
	
	override method cumplirsePara(unaPersona) {
		unaPersona.agregarHijos(1)
	}
	
}

class Viajar inherits Suenio {
	
	const destino
	
	override method cumplirsePara(unaPersona) {
		unaPersona.viajarA(destino)
	}
}

class ConseguirTrabajo inherits Suenio {
	
	const gananciaTrabajo
	
	override method puedeCumplirsePara(unaPersona) {
		return gananciaTrabajo >= unaPersona.gananciaEsperada()
	}
	
	override method cumplirsePara(unaPersona) {
		
	}
}

class SuenioMultiple inherits Suenio {
	
	const property sueniosACumplir = []
	
	override method puedeCumplirsePara(unaPersona) {
		return sueniosACumplir.all({unSuenio => unSuenio.puedeCumplirsePara(unaPersona)})
	}
	
	override method cumplirsePara(unaPersona) {
		sueniosACumplir.forEach({unSuenio => unSuenio.cumplirsePara(unaPersona)})
	}
}