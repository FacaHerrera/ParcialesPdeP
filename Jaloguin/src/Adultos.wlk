class Adulto {
	
	var previosIntentosDeSustos = []
	
	method serAsustadoPor(unNinio) {
		if(self.tieneMenosToleranciaQueCapacidadDeSustoDe(unNinio)) unNinio.recibirCaramelos(self.tolerancia() / 2)
		previosIntentosDeSustos.add(unNinio)
	}
	
	method endulzadosQueQuisieronAsustarloPreviamente() {
		return previosIntentosDeSustos.count({unNinio => unNinio.tieneMasCaramelosQue(15)})
	}
	
	method tolerancia() {
		return 10 * self.endulzadosQueQuisieronAsustarloPreviamente()
	}
	
	method tieneMenosToleranciaQueCapacidadDeSustoDe(unNinio) {
		return self.tolerancia() < unNinio.capacidadDeSusto()
	}
}

class Abuelo inherits Adulto {
	
	override method serAsustadoPor(unNinio) {
		unNinio.recibirCaramelos(self.tolerancia() / 4)
		previosIntentosDeSustos.add(unNinio)
	}
	
}

class AdultoNecio inherits Adulto {
	
	override method serAsustadoPor(unNinio) {
		previosIntentosDeSustos.add(unNinio)
	}
	
}