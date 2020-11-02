class Empleado {
	
	var property operacionesRealizadas = []
	var property operacionesCerradas = []
	var property reservas = []
	
	method agregarOperacion(unaOperacion) {
		operacionesRealizadas.add(unaOperacion)
	}
	
	method totalComisiones() {
		return operacionesRealizadas.sum({unaOperacion => unaOperacion.calcularComision()})
	}
	
	method reservasRealizadas() {
		return operacionesRealizadas.filter({unaOperacion => unaOperacion.esReserva()})
	}
	
	method vaATenerProblemasCon(otroEmpleado) {
		return self.cerroEnLaMismaZonaQue(otroEmpleado) && 
			  (self.concretoOperacionReservadaPor(otroEmpleado) || otroEmpleado.concretoOperacionReservadaPor(self))
	}
	
	method zonasDeTrabajo() {
		return operacionesCerradas.filter({unaOperacion => unaOperacion.zona()})
	}
	
	method cerroEnLaMismaZonaQue(otroEmpleado) {
		return self.zonasDeTrabajo().any({unaZona => otroEmpleado.zonasDeTrabajo(unaZona)})
	}
	
	method concretoOperacionReservadaPor(otroEmpleado) {
		return operacionesCerradas.any({operacion => otroEmpleado.reservo(operacion)})
	}
	
	method cerrar(unaOperacion) {
		operacionesCerradas.add(unaOperacion)
	}
}
