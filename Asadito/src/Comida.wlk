class Comida {
	
	const property calorias
	
	method esCarne() {
		return false
	}
	
	method esDietetica() {
		return calorias < 500
	}
	
	method esPesada() {
		return calorias > 500
	}
}