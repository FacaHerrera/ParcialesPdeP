class Conspiracion {
	
	const victima
	var property complotados = []
	var property ejecutada = false
	
	method traidores() {
		return complotados.filter({unComplotado => victima.aliados().contains(unComplotado)})
	}
	
	method cantidadTraidores() {
		return self.traidores().size()
	}

	method ejecutarse() {
		complotados.forEach({unComplotado => unComplotado.accionPersonalizadaCon(victima)})
		self.ejecutada(true)
	}
	
	method objetivoCumplido() {
		return self.ejecutada() && !victima.esPeligroso()
	}
}
