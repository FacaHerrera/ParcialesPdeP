class Persona {
	
	var fuerza
	var resistencia
	
	method aumentarFuerzaEn(unaCantidad) {
		fuerza += unaCantidad
	}
	
	method revivirCon(unaResistencia) {
		resistencia += unaResistencia
	}
	
	method multiplicarResistenciaPor(unaCantidad) {
		resistencia *= unaCantidad
	}
	
	method multiplicarFuerzaPor(unaCantidad) {
		fuerza *= unaCantidad
	}
	
	method poder() {
		return fuerza * resistencia
	}
	
	method recibirDanio(unaCantidad) {
		resistencia = (resistencia - unaCantidad).max(0)
	}
	
	method fueraDeCombate() {
		return resistencia == 0
	}
	
	method tomar(unaPocion) {
		unaPocion.serTomadaPor(self)
	}
	
}
