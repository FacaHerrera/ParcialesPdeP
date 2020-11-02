class Comensal {
	
	var property elementosCercanos = []
	var property posicionEnMesa
	var property criterio
	var property registroComidas = []
	var property dieta
	
	method pasarElementoA(otroComensal, unElemento) {
		if(!elementosCercanos.contains(unElemento)){
			throw new Exception (message = "ERROR! - El elemento no esta cerca del comensal")
		}
		criterio.movimientoDeElemento(self, otroComensal, unElemento)
		elementosCercanos.remove(unElemento)
	}
	
	method recibir(unElemento) {
		elementosCercanos.add(unElemento)
	}
	
	method recibirVarios(unosElementos) {
		elementosCercanos.addAll(unosElementos)
	}
	
	method elementoMasAMano() {
		return elementosCercanos.head()
	}
	
	method cambiarPosicionCon(otroComensal) {
		const posicion = posicionEnMesa
		posicionEnMesa = otroComensal.posicionEnMesa()
		otroComensal.posicionEnMesa(posicion)
	}
	
	method comer(unaComida) {
		if(!dieta.criterioAlimentacion(unaComida)){
			throw new Exception (message = "La comida no cumple con la dieta del comensal")
		}
		
		registroComidas.add(unaComida)
	}
	
	method estaPipon() {
		return registroComidas.any({unaComida => unaComida.esPesada()})
	}
	
	method laEstaPasandoBien() {
		return false
	}
	
}

object oksy inherits Comensal {
	override method laEstaPasandoBien() {
		return true
	}
}

object moni inherits Comensal {
	override method laEstaPasandoBien() {
		return self.posicionEnMesa() == "1@1"
	}
}

object facu inherits Comensal {
	override method laEstaPasandoBien() {
		return registroComidas.any({unaComida => unaComida.esCarne()})
	}
}

object vero inherits Comensal {
	override method laEstaPasandoBien() {
		return elementosCercanos.size() <= 3
	}
}

// Se utilizo herencia para que los objetos que hacen referencia a cada comensal hereden
// de la clase comensal comun para todos, pero cada uno pueda tener su proprio criterio
// de disfrute. Tambien se la utilizo en los criterios de dieta, y de pasaje de elementos
// para hacer un "factor comun" entre las cosas que tenian en comun cada uno de ellos.

// Se utilizo polimorfismo en metodos como laEstaPasandoBien, movimientoDeElemento o
// criterioDeAlimentacion

//No se utilizo composicion, probablemente sea de utilidad para los 2 puntos que faltan.