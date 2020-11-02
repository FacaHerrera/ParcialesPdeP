import Pajaros.*

object islaPajaro {
	
	var pajaros = []
	
	method agregarPajaro(unPajaro) {
		pajaros.add(unPajaro)
	}
	
	method pajarosFuertes() {
		return pajaros.filter({unPajaro => unPajaro.esFuerte()})
	}
	
	method fuerza() {
		const fuertes = self.pajarosFuertes()
		return fuertes.sum({unPajaro => unPajaro.fuerza()})
	}
	
	method tranquilizarPajaros() {
		pajaros.forEach({unPajaro => unPajaro.tranquilizarse()})
	}
	
	method enojarATodos() {
		pajaros.forEach({unPajaro => unPajaro.enojarse()})
	}
	
	method serInvadidaPor(unosCerditos) {
		
		const cerditos = unosCerditos.div(100)
		cerditos.times({_ => self.enojarATodos()})
	}
	
	method atacarAIslaCerdito() {
		pajaros.forEach({unPajaro => unPajaro.atacar()})
	}
	
	method seRecuperaronLosHuevos() {
		return islaCerdito.libreDeObstaculos()
	}
	
	method homenajeados() {
		return pajaros.filter({unPajaro => unPajaro.homenajeado()})
	}
	
	method noHayHomenajeados() {
		return self.homenajeados().isEmpty()
	}
	
	method enojarHomenajeados() {
		const homenajeados = self.homenajeados()
		homenajeados.forEach({unHomenajeado => unHomenajeado.enojarse()})
	}
	
}

object islaCerdito {
	
	var property obstaculos = []
	
	method primerObstaculo() {
		return obstaculos.first()
	}
	
	method resistenciaPrimerObstaculo() {
		return self.primerObstaculo()
					.resistencia()
	}
	
	method derribarPrimerObstaculo() {
		obstaculos.remove(self.primerObstaculo())
	}
	
	method libreDeObstaculos() {
		return obstaculos.isEmpty()
	}
	
}

class Obstaculo {
	
	const anchoDePared

	method resistencia() {
		return anchoDePared
	}
	
}

class ParedDeVidrio inherits Obstaculo {

	override method resistencia() {
		return super() * 10
	}
	
}

class ParedDeMadera inherits Obstaculo {

	override method resistencia() {
		return super() * 25
	}
	
}

class ParedDePiedra inherits Obstaculo {
	
	override method resistencia() {
		return super() * 50
	}
	
}

class CerditosObreros {
	
	method resistencia() {
		return 50
	}
	
}

class CerditosArmados {
	
	const unaDefensa
	
	method resistencia() {
		return 10 * unaDefensa.resistencia()
	}	
}

class Casco {
	const property resistencia
}

class Escudo {
	const property resistencia
}
