class Operacion {
	const inmueble
	
	method calcularComision()
	
	method esReserva() {
		return false
	}
}

class Alquiler inherits Operacion {
	const cantidadMeses
	
	override method calcularComision() {
		return inmueble.precio() * cantidadMeses / 50000
	}
	
	override method esReserva() {
		return false
	}
}

class Venta inherits Operacion {
	var porcentajePorInmueble
	
	override method calcularComision() {
		return inmueble.precio() * porcentajePorInmueble
	}
	
	override method esReserva() {
		return false
	}
}

class Reserva inherits Operacion {
	
	method reservarPara(unCliente) {
		inmueble.reservado(true)
		unCliente.agregarReserva(inmueble)
	}
	
	override method esReserva() {
		return true
	}
	
}