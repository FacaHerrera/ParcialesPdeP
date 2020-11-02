import Colores.*

class Minion {
	
	var property armas = []
	var property color = amarillo
	var property bananas
	var property maldades = []
	
	method esPeligroso() {
		return color.esCriaturaPeligrosa(self)
	}
	
	method tieneMasDe2Armas() {
		return armas.size() > 2
	}
	
	method absorberSueroMutante() {
		color.transformarA(self)
	}
	
	method cambiarColorA(unColor) {
		self.color(unColor)
	}
	
	method perderArmas() {
		armas.clear()
	}
	
	method perderBananas(unaCantidad) {
		bananas -= unaCantidad
	}
	
	method nivelDeConcentracion() {
		return color.concentracionDe(self)
	}
	
	method armaMasPotente() {
		return armas.max({unArma => unArma.potencia()})
	}
	
	method agregarArma(unArma) {
		armas.add(unArma)
	}
	
	method alimentarseCon(unasBananas) {
		bananas += unasBananas
	}
	
	method tiene(nombreDeUnArma) {
		return armas.any({unArma => unArma.nombre().equals(nombreDeUnArma)})
	}
	
	method estaBienAlimentado() {
		return bananas > 100
	}
	
	method participarEn(unaMaldad) {
		if(unaMaldad.requisitoMinion(self)) maldades.add(self)
	}
	
	method cantidadDeMaldades() {
		return maldades.size()
	}
	
	method esInutil() {
		return maldades.isEmpty()
	}
	
	method serPremiado() {
		self.alimentarseCon(10)
	}
}


