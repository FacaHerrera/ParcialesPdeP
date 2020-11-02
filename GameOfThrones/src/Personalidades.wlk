import Casas.*

object sutil {
	
	const casas = [new CasaLannister(patrimonio = 1000, ciudadDeOrigen = "Sm"), new CasaStark(patrimonio = 2000, ciudadDeOrigen = "Bv"), new CasaGuardiaDeLaNoche(patrimonio = 500, ciudadDeOrigen = "Jcp")]
	
	method casaMasPobre() {
		return casas.min({unaCasa => unaCasa.patrimonio()})
	}
	
	method actuarContra(unaVictima) {
		const casa = self.casaMasPobre()
		const randomCasaPobre = casa.miembros().anyOne()
		unaVictima.casarseCon(randomCasaPobre)
	}
	
}

object asesino {

	method actuarContra(unaVictima) {
		unaVictima.morir()
	}
}

object asesinoPrecavido {
	
	method actuarContra(unaVictima) {
		if(unaVictima.estaSolo()) unaVictima.morir()
	}
}

object disipados {
	
	var porcentajeDeDerroche

	method actuarContra(unaVictima) {
		unaVictima.derrochar(porcentajeDeDerroche)
	}	
	
}

object miedosos {

	method actuarContra(unaVictima) {
		
	}
}

//object asesinoPrecavido inherits Asesino {
//	
//	override method actuarContra(unaVictima) {
//		if(!unaVictima.estaSolo()) {
//			throw new Exception(message = "La victima no esta sola!")
//		}
//		
//		super(unaVictima)
//	}
//}