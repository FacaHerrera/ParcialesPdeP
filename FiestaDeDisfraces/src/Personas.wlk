class Persona {
	
	var edad
	var personalidad
	var property disfraz
	
	method esMayor() {
		return edad > 50
	}
	
	method esMenor() {
		return edad < 30
	}
	
	method esSexy() {
		return personalidad.esSexy(self)
	}
	
	method puntajeDisfraz() {
		return disfraz.puntuacionSegunCaracteristicasPara(self)
	}
	
	method estaConformeConSuDisfraz() {
		return self.estaConformeCon(disfraz)
	}
	
	method estaConformeCon(unDisfraz) {
		return unDisfraz.puntuacionSegunCaracteristicasPara(self) > 10
	}
	
	method tieneDisfraz() {
		return disfraz != null
	}

}

class Caprichoso inherits Persona {
	
	override method estaConformeCon(unDisfraz) {
		return super(unDisfraz) && unDisfraz.cantidadParDeLetrasEnElNombre()
	}
	
}

class Pretencioso inherits Persona {
	
	override method estaConformeCon(unDisfraz) {
		return unDisfraz.hechoRecientemente()
	}
	
}

class Numerologo inherits Persona {
	
	var puntajeSolicitado
	
	override method estaConformeCon(unDisfraz) {
		return unDisfraz.puntuacionSegunCaracteristicasPara(self) == puntajeSolicitado
	}
	
}