import Vikingos.*
import Locaciones.*

class Expedicion {
	
	var property aldeasInvolucradas = []
	var property capitalesInvolucradas = []
	var property vikingos = []
	
	method expedicionValeLaPena() {
		return self.todasValenLaPena(aldeasInvolucradas) && self.todasValenLaPena(capitalesInvolucradas)
	}
	
	method todasValenLaPena(unaLista) {
		return unaLista.all({unIntegrante => unIntegrante.valeLaPenaPara(self)})
	}
	
	method cantidadDeVikingos() {
		return vikingos.size()
	}
	
	method agregarA(unVikingo) {
		if(!unVikingo.puedeSubirAExpedicion()){
			throw new Exception(message = "El vikingo no puede subir a la expedicion")
		}
		vikingos.add(unVikingo)
	}
	
	method botinDe(unasLocaciones) {
		return unasLocaciones.sum({unaLocacion => unaLocacion.botinDe(self)})
	}
	
	method botinTotal() {
		return self.botinDe(aldeasInvolucradas) + self.botinDe(capitalesInvolucradas)
	}
	
	method realizarse() {
		const botinExpedicion = self.botinTotal() / self.cantidadDeVikingos()
		vikingos.forEach({unVikingo => unVikingo.cobrar(botinExpedicion)})
		aldeasInvolucradas.forEach({unaAldea => unaAldea.sufrirA(self)})
		capitalesInvolucradas.forEach({unaCapital => unaCapital.sufrirA(self)})
	}
	
}
