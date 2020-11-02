class Mision {
	
	method requisitoTripulacion(unBarco) {
		return unBarco.cantidadTripulantes() >= 0.9 * unBarco.capacidad()
	}
	
	method requisitoPirata(unPirata)
}

object busquedaDelTesoro inherits Mision {
	
	override method requisitoPirata(unPirata) {
		return self.inventarioPirata(unPirata, "Mapa", "Brujula", "GrogXd") && unPirata.estaPobre()
	}
	
	method inventarioPirata(unPirata, unElemento, otroElemento, unTercerElemento) {
		return unPirata.tiene(unElemento) || unPirata.tiene(otroElemento) || unPirata.tiene(unTercerElemento)
	}
	
	method requisitoParticular(unBarco) {
		return unBarco.algunoTiene("Llave de Cofre")
	}
}

object convertirseEnLeyenda inherits Mision {
	
	var itemEspecial
	
	override method requisitoPirata(unPirata) {
		return unPirata.cantidadItems() >= 10 && unPirata.tiene(itemEspecial)
	}
}

object saqueo inherits Mision {
	
	var victima
	var cantidadDinero
	
	override method requisitoPirata(unPirata) {
		return unPirata.dinero() < cantidadDinero && unPirata.seAnimaASaquearA(victima)
	}
	
	method requisitoParticular(unBarco) {
		return victima.esVulnerableA(unBarco)
	}
}


