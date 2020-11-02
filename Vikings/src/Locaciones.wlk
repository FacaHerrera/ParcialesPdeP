import Expediciones.*
import Vikingos.*

class Capital {
	
	const property factorRiqueza
	var property defensores
	
	method valeLaPenaPara(unaExpedicion) {
		return self.botinDe(unaExpedicion) > 3 * unaExpedicion.cantidadDeVikingos()
	}
	
	method botinDe(unaExpedicion) {
		return self.defensoresDerrotadosPor(unaExpedicion) + factorRiqueza
	}
	
	method defensoresDerrotadosPor(unaExpedicion) {
		return unaExpedicion.cantidadDeVikingos()
	}
	
	method sufrirA(unaExpedicion) {
		defensores -= unaExpedicion.cantidadDeVikingos()
	}
}

class Aldea {
	
	var property iglesias = []
	
	method botinDe(unaExpedicion) {
		return self.cantidadCrucifijos()
	}
	
	method valeLaPenaPara(unaExpedicion) {
		return self.botinDe(unaExpedicion) >= 15
	}
	
	method cantidadCrucifijos() {
		return iglesias.sum({unaIglesia => unaIglesia.cantidadCrucifijos()})
	}
	
	method sufrirA(unaExpedicion) {
		iglesias.forEach({unaIglesia => unaIglesia.cantidadCrucifijos(0)})
	}
}

class AldeaAmurallada inherits Aldea {
	
	const cantidadMinimaDeValor
	
	override method valeLaPenaPara(unaExpedicion) {
		return self.botinDe(unaExpedicion) >= 15 && unaExpedicion.cantidadDeVikingos() > cantidadMinimaDeValor
	}
}

class Iglesia {
	var property cantidadCrucifijos
}

// Para agregar los castillos es tan simple como crear una nueva clase con su proprio metodo
// para calcular si vale la pena y para calcular el botin, utilizando polimorfimos para que
// pueda ser utilizado en el codigo con los que ya existen