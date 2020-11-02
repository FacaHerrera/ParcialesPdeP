object alegre {
	
	method esSexy(unaPersona) {
		return false
	}
	
}

object taciturna {
	
	method esSexy(unaPersona) {
		return unaPersona.esMenor()
	}
	
}

object multiple {
	
	const personalidadesPosibles = [alegre, taciturna]
	
	method esSexy(unaPersona) {
		const personalidadActual = personalidadesPosibles.anyOne()
		return personalidadActual.esSexy(unaPersona)
	}
	
}