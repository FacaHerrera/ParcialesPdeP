import turbinas.*
import ciudades.*

object centralAtomicaBurns {
	
	const produccionEnergetica = 0.1
	var property cantidadVarillas = 10
	const ciudad = springfield
	
	method esCentralContaminante() {
		return cantidadVarillas > 20
	}
	
	method produccionEnergetica() {
		return produccionEnergetica * cantidadVarillas
	}
	
	method velocidadViento() {
		return ciudad.velocidadViento()
	}
	
}

object centralCarbonExBosque {
	
	var property capacidad = 0
	const ciudad = springfield
	
	method esCentralContaminante() {
		return true
	}
	
	method produccionEnergetica() {
		return 0.5 + capacidad * ciudad.riquezaSuelo()
	}
	
	method velocidadViento() {
		return ciudad.velocidadViento()
	}
}

object centralEolicaSuspiro {
	
	const ciudad = springfield
	var turbinas = [turbina1]
	
	method agregarTurbina(unaTurbina) {
		turbinas.add(unaTurbina)
	}
	
	method esCentralContaminante() {
		return false
	}
	
	method produccionEnergetica() {
		return turbinas.sum({unaTurbina => unaTurbina.produccion()})
	}
	
	method velocidadViento() {
		return ciudad.velocidadViento()
	}
}

object centralHidroelectrica {
	const ciudad = albuquerque
	
	method produccionEnergetica() {
		return 2 * ciudad.caudalRio()
	}
}