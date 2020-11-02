class Pocion {
	
	var ingredientes = []
	
	method serTomadaPor(unaPersona) {
		ingredientes.forEach({unIngrediente => unIngrediente.hacerEfectoSobre(unaPersona)})
	}
	
}

object dulceDeLeche {
	
	method hacerEfectoSobre(unaPersona) {
		unaPersona.aumentarFuerzaEn(10)
		if(unaPersona.fueraDeCombate()) unaPersona.revivirCon(2)
	}
	
}

class PuniadoDeHongosSilvestres {
	
	const cantidadDeHongos
	
	method hacerEfectoSobre(unaPersona) {
		unaPersona.aumentarFuerzaEn(cantidadDeHongos)
		if(cantidadDeHongos > 5) unaPersona.multiplicarResistenciaPor(0.5)
	}
	
}

class Grog {
	const cantidadIngredientesPocion // DUDA sobre como hacer para que sepa la cantidad
	
	method hacerEfectoSobre(unaPersona) {
		unaPersona.multiplicarFuerzaPor(cantidadIngredientesPocion)
	}
}

class GrogXD inherits Grog {
	
	override method hacerEfectoSobre(unaPersona) {
		super(unaPersona)
		unaPersona.multiplicarResistenciaPor(2)
	}
}