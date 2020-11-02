object criterioTotalComisiones {
	method mejorEmpleado(unosEmpleados) {
		return unosEmpleados.max({unEmpleado => unEmpleado.totalComisiones()})			
	}
}

object criterioCantidadOperacionesCerradas {
	method mejorEmpleado(unosEmpleados) {
		return unosEmpleados.max({unEmpleado => unEmpleado.totalOperacionesCerradas()})
	}
}

object criterioCantidadReservas {
	method mejorEmpleado(unosEmpleados) {
		return unosEmpleados.max({unEmpleado => unEmpleado.cantidadDeReservas()})
	}
}

// Investigar la posible parametrizacion del metodo para calcular el mejor empleado