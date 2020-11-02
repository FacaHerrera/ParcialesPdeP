object inmobiliaria {
	var property empleados = []
	
	method agregarEmpleado(unEmpleado) {
		empleados.add(unEmpleado)
	}
	
	method mejorEmpleadoSegunn(unCriterio) {
		return unCriterio.mejorEmpleado(empleados)
	}
}