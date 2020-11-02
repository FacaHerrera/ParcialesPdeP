object ciudadCostera {
	
	var property cantidadHabitantes
	
	method ebriedadMinima() {
		return 50
	}
	
	method esVulnerableA(unBarco) {
		return unBarco.cantidadTripulantes() >= 0.4 * cantidadHabitantes || unBarco.todosPasadosDeGrogXd()
	}
	
	method agregarHabitante() {
		cantidadHabitantes ++
	}
	
}
