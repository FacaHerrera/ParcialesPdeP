import estilos.*

class Tipo {
	
	method bonificacionPara(unEquipo)
	
	method entrenarA(unEquipo) {
		
	}
}

object fino inherits Tipo {
	
	override method bonificacionPara(unEquipo) {
		if(unEquipo.esDeAltoRendimiento()) return 1.3
		else return 1
	}
	
	override method entrenarA(unEquipo) {
		unEquipo.convertirTodosA(tirador)
	}
	
}

object motivador inherits Tipo {
	
	override method bonificacionPara(unEquipo) {
		if(unEquipo.esMedioPelo()) return 1.5
		else return 1
	}
}

object vendehumo inherits Tipo {
	
	override method bonificacionPara(unEquipo) {
		if(unEquipo.esDreamTeam()) return 1.25
		else return 0.85
	}
}
