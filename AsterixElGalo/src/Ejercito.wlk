class Ejercito {
	
	var integrantes = []
	var property cantidadAdelante
	
	method integrantesEnPie() {
		return integrantes.filter({unIntegrante => !unIntegrante.fueraDeCombate()})
	}
	
	method poder() {
		const aptos = self.integrantesEnPie()
		return aptos.sum({unIntegrante => unIntegrante.poder()})
	}
	
	method recibirDanio(unaCantidad) {
		const poderosos = integrantes.sortedBy({unIntegrante, otroIntegrante => unIntegrante.poder() > otroIntegrante.poder()})
		const losDeAdelante = poderosos.take(cantidadAdelante)
		const danio = unaCantidad / 10
		losDeAdelante.forEach({unIntegrante => unIntegrante.recibirDanio(danio)})
	}
	
	method todosFueraDeCombate() {
		return integrantes.all({unIntegrante => unIntegrante.fueraDeCombate()})
	}
	
	method esMasPoderosoQue(unEnemigo) {
		return self.poder() > unEnemigo.poder()
	}
	
	method pelearContra(unEnemigo) {
		
		const danio = (self.poder() - unEnemigo.poder()).abs()
		
		if(self.todosFueraDeCombate()) {
			throw new Exception(message = "Los integrantes estan todos fuera de combate")
		}
		
		if(self.esMasPoderosoQue(unEnemigo)) unEnemigo.recibirDanio(danio)
		else self.recibirDanio(danio)
	}
}

class Legion inherits Ejercito {
	
	const formacion
	
	override method poder() {
		return formacion.poderPara(self)
	}
	
	override method recibirDanio(unaCantidad) {
		formacion.recibirDanioPara(self, unaCantidad)
	}
	
	override method cantidadAdelante() {
		return formacion.integrantesAlFrenteDe(self)
	}
	
}

class Formacion {
	
	method poderPara(unEjercito) {
		return unEjercito.poder()
	}
	
	method recibirDanioPara(unEjercito, unaCantidad) {
		unEjercito.recibirDanio(unaCantidad)
	}
	
	method integrantesAlFrenteDe(unEjercito) {
		unEjercito.cantidadAdelante(10)
	}
	
}

class Tortuga inherits Formacion {
	
	override method poderPara(unEjercito) {
		return 0
	}
	
	override method recibirDanioPara(unEjercito, unaCantidad) {
		
	}
	
}

class EnCuadro inherits Formacion {
	
	var property integrantesAlFrente
		
	override method integrantesAlFrenteDe(unEjercito) {
		unEjercito.cantidadAdelante(integrantesAlFrente)
	}
}

class FrontemAllargate inherits Formacion {
	
	override method integrantesAlFrenteDe(unEjercito) {
		unEjercito.cantidadAdelante(5)
	}
	
	override method poderPara(unEjercito) {
		return unEjercito.poder() * 1.1
	}
	
	override method recibirDanioPara(unEjercito, unaCantidad) {
		unEjercito.recibirDanio(2 * unaCantidad)
	}
	
}














