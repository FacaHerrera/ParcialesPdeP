class Disfraz {
	
	const nombre
	const property fechaConfeccion
	var property caracteristicas = []
	var fiesta
	const property fechaDeCompra
	
	method compradoConAnticipacion() {
		return fiesta.fecha() - fechaDeCompra > 2
	}
	
	method puntuacionSegunCaracteristicasPara(unPortador) {
		return caracteristicas.sum({unaCaracteristica => unaCaracteristica.puntuacionPara(self, unPortador)})
	}
	
	method cantidadParDeLetrasEnElNombre() {
		return nombre.length().even()
	}
	
	method hechoRecientemente() {
		return new Date() - fechaConfeccion < 30
	}
	
}

class Gracioso {
	
	const nivelDeGracia
	
	method puntuacionDe(unDisfraz, unPortador) {
		if(unPortador.esMayor()) return 3 * nivelDeGracia
		else return nivelDeGracia
	}
	
}

class Tobara {
	
	method puntuacionDe(unDisfraz, unPortador) {
		if(unDisfraz.compradoConAnticipacion()) return 5
		else return 3
	}
}

class Careta {
	
	const personaje
	
	method puntuacionDe(unDisfraz, unPortador) {
		return personaje.valor()
	}
}

class Sexy {
	
	method puntuacionDe(unDisfraz, unPortador) {
		if(unPortador.esSexy()) return 15
		else return 2
	}
	
}

object mickyMouse {
	
	method valor() {
		return 8
	}
	
}

object osoCarolina {
	
	method valor() {
		return 6
	}
	
}