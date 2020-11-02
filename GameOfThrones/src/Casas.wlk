class Casa {
	
	var property patrimonio
	const property ciudadDeOrigen
	var property miembros = []
	
	method esRica() {
		return patrimonio > 1000
	}
	
	method cantidadDeMiembros() {
		return miembros.size()
	}
	
	method perder(unaCantidad) {
		patrimonio -= patrimonio * unaCantidad
	}
	
}

class CasaLannister inherits Casa {
	
	method restriccionCasamientoPara(unPersonaje, otroPersonaje) {
		return unPersonaje.noTienePareja()
	}
	
}

class CasaStark inherits Casa {
	
	method restriccionCasamientoPara(unPersonaje, otroPersonaje) {
		return !unPersonaje.esDeLaMismaCasaQue(otroPersonaje)
	}
	
}

class CasaGuardiaDeLaNoche inherits Casa {
	
	method restriccionCasamientoPara(unPersonaje, otroPersonaje) {
		return false
	}
	
}