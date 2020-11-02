class Fiesta {
	
	const property lugar
	var property fecha
	var property invitados = []
	
	method esUnBodrio() {
		return invitados.all({unInvitado => !unInvitado.estaConformeConSuDisfraz()})
	}
	
	method mejorDisfrazDeLaFiesta() {
		return invitados.max({unInvitado => unInvitado.puntajeDisfraz()})
	}
	
	method puedenIntercambiarseLosDisfracesDe(unaPersona, otraPersona) {
		return self.estanEnLaFiesta(unaPersona, otraPersona) && self.algunoDisconforme(unaPersona, otraPersona) && self.seConformanCambiandoDisfraces(unaPersona, otraPersona)
	}
	
	method estanEnLaFiesta(unaPersona, otraPersona) {
		return invitados.contains(unaPersona) && invitados.contains(otraPersona) // invitados.contains([unaPersona, otraPersona]) vale ??
	}
	
	method algunoDisconforme(unaPersona, otraPersona) {
		return !unaPersona.estaConformeConSuDisfraz() || !otraPersona.estaConformeConSuDisfraz() // [unaPersona, otraPersona].any({unaPersona => !unaPersona.estaConformeConSuDisfraz() vale ??
	}
	
	method seConformanCambiandoDisfraces(unaPersona, otraPersona) {
		const disfraz1 = unaPersona.disfraz()
		const disfraz2 = otraPersona.disfraz()
		return unaPersona.estaConformeCon(disfraz2) && otraPersona.estaConformeCon(disfraz1)
	}
	
	method puedeAgregarA(unAsistente) {
		return unAsistente.tieneDisfraz() && !invitados.contains(unAsistente)
	}
	
	method agregarAsistente(unAsistente) {
		if(self.puedeAgregarA(unAsistente)) {
			throw new Exception(message = "El asistente no cumple con las condiciones!")
		}
		
		invitados.add(unAsistente)
	}
}

object fiestaInolvidable inherits Fiesta {
	
	override method puedeAgregarA(unAsistente) {
		return super(unAsistente) && unAsistente.esSexy() && unAsistente.estaConformeConSuDisfraz()
	}
	
}