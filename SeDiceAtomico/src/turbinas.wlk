import centrales.*

object turbina1 {
	
	var central = centralEolicaSuspiro
	
	method produccion(){
		return 0.2 * central.velocidadViento()
	}
}

object turbina2 {
	
	var central
	
	method produccion(){
		return 0.7 * central.velocidadViento()
	}
}