class ProcesoMental {
	
	var persona
	
	method aplicar()
}

object asentamiento inherits ProcesoMental{
	
	method aplicar() {
		persona.asentarTodosLosRecuerdosDelDia()
	}
}

class asentamientoSelectivo inherits ProcesoMental{
	
	var palabraClave
	
	method aplicar() {
		persona.asentarSegun(palabraClave)
	}
}