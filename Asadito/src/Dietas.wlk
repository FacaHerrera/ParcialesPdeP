class Dietas {
	method criterioAlimentacion(unaComida)
}

class DietaVegetariana inherits Dietas {
	override method criterioAlimentacion(unaComida) {
		return unaComida.esCarne()
	}
}

class DietaDietetica inherits Dietas {
	override method criterioAlimentacion(unaComida) {
		return unaComida.esDietetica()
	}
}

class DietaAlternada inherits Dietas {
	override method criterioAlimentacion(unaComida) {
		
	}
}

class DietaCombinada inherits Dietas {
	
	const property condiciones = []
	
	override method criterioAlimentacion(unaComida) {
	
	}
}

// DUDA - Como hacer la dieta alternada y la combinada