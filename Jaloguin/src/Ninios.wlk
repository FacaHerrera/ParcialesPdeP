import Legiones.*

class Ninio {
	
	var property elementos = []
	var property caramelos
	var property estado = sano
	var property actitudInicial
	
	method capacidadDeSusto() {
		return elementos.sum({unElemento => unElemento.susto()}) * self.actitud()
	}
	
	method actitud() {
		return estado.actitudDe(self)
	}
	
	method asustarA(unAdulto) {
		unAdulto.serAsustadoPor(self)
	}
	
	method tieneMasCaramelosQue(unaCantidad) {
		return caramelos > unaCantidad
	}
	
	method recibirCaramelos(unaCantidad) {
		caramelos += unaCantidad
	}
	
	method crearLegionCon(unosNinios) { // Se pide como paramentro una lista de niños
		if(unosNinios.size() < 2) {
			throw new Exception(message = "ERROR! - Se requieren 2 o mas niños para formar una legion!")
		}
		
		return new Legion(miembros = unosNinios)
	}
	
	method comer(unosCaramelos) {
		if(unosCaramelos > caramelos) {
			throw new Exception(message = "El niño no tiene suficientes caramelos!!")
		}
		
		estado.comer(unosCaramelos, self)
		caramelos -= unosCaramelos
	}
	
}

class Estado {
	
	method comer(unosCaramelos, unNinio) {
		if(unosCaramelos > 10) self.cambiarEstadoPara(unNinio)
	}
	
	method actitudDe(unNinio) {
		return unNinio.actitudInicial()
	}
	
	method cambiarEstadoPara(unNinio) {
		
	}
}

object sano inherits Estado {
	
	override method cambiarEstadoPara(unNinio) {
		unNinio.estado(empachado)
	}
	
}

object empachado inherits Estado {
	
	override method cambiarEstadoPara(unNinio) {
		unNinio.estado(enCama)
	}
	
	override method actitudDe(unNinio) {
		return super(unNinio) / 2
	}
	
}

object enCama inherits Estado {
	
	override method actitudDe(unNinio) {
		return 0
	}
	
}
