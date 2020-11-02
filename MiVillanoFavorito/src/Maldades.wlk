class Maldad {
	
	const ciudad
	var property minionsParticipantes = []
	
	method agregarMinions(unosMinions) {
		minionsParticipantes.addAll(unosMinions)
	}
	
	method puedeRealizarse() {
		return !minionsParticipantes.isEmpty()
	}
	
	method realizarse() {
		if(!self.puedeRealizarse()) {
			throw new Exception(message = "La maldad no puede realizarse")
		}
	}
	
	method premiarMinions() {
		minionsParticipantes.forEach({unMinion => unMinion.serPremiado()})
	}
	
	method abastecerMinionsCon(unaArma) {
		minionsParticipantes.forEach({unMinion => unMinion.agregarArma(unaArma)})
	}
	
	method darSueroAMinions() {
		minionsParticipantes.forEach({unMinion => unMinion.absorberSueroMutante()})
	}
	
}

class Congelar inherits Maldad {
	
	var nivelDeConcentracion = 500
	
	method requisitoMinion(unMinion) {
		return unMinion.tiene("Rayo Congelante") && unMinion.nivelDeConcentracion() >= nivelDeConcentracion
	}
	
	override method realizarse() {
		super()
		ciudad.reducirTemperaturaEn(30)
		self.premiarMinions()
	}
	
}

class Robar inherits Maldad {
	
	var objetivo
	
	method requisitoMinion(unMinion) {
		return objetivo.requerimientoPara(unMinion)
	}
	
	override method realizarse() {
		super()
		objetivo.realizarMaldadPara(self)
		ciudad.perderObjeto(objetivo)
	}
	
}