class Barco {
	var property misionAsignada
	const capacidad
	var cantidadTripulantes
	var tripulantes = []
	
	var elementos
	
	method cantidadTripulantes() {
		return tripulantes.size()
	}
	
	method esTemible() {
		return misionAsignada.requisitoTripulacion(self) && misionAsignada.requisitoParticular(self)
	}
	
	method aceptaTripulante(unCandidato) {
		return self.hayLugar() && self.esDeAyuda(unCandidato)
	}
	
	method hayLugar() {
		return self.cantidadTripulantes() < capacidad
	}
	
	method esDeAyuda(unCandidato) {
		return unCandidato.esUtilPara(misionAsignada)
	}
	
	method incorporar(unTripulante){
		if(self.aceptaTripulante(unTripulante)) tripulantes.add(unTripulante)
	}
	
	method cambiarMisionA(unaMision) {
		self.misionAsignada(unaMision)
		tripulantes.filter({unTripulante => unTripulante.esUtilPara(unaMision)})
	}
	
	method algunoTiene(unElemento) {
		return tripulantes.any({unTripulante => unTripulante.tiene(unElemento)})
	}
	
	method esVulnerableA(otroBarco) {
		return self.cantidadTripulantes() <= 0.5 * otroBarco.cantidadTripulantes()
	}
	
	method ebriedadMinima() {
		return 90
	}
	
	method pirataMasEbrio() {
		return tripulantes.max({unTripulante => unTripulante.nivelEbriedad()})
	}
	
	method anclarEnCostaDe(unaCiudadCostera) {
		tripulantes.forEach({unTripulante => unTripulante.tomarseUnTrago()}) //Duda, los tripulantes toman y despues pierden la moneda? O necesitan la moneda para pagar el trago
		tripulantes.remove(self.pirataMasEbrio())
		unaCiudadCostera.agregarHabitante()
	}
	
	method cantidadDeBorrachos() {
		return tripulantes.count({unTripulante => unTripulante.estaPasadoDeGrogXd()})
	}
	
	method itemsSinRepetirTripulantes() {
		elementos = tripulantes.map({unTripulante => unTripulante.items()})
		return elementos.asSet()
	}
	
	method cantidadDeTiposDeItems() {
		return self.itemsSinRepetirTripulantes().size()
	}
	
	method tripulantesBorrachos() {
		return tripulantes.filter({unTripulante => unTripulante.estaPasadoDeGrogXd()})
	}
	
	method borrachoMasMillo() {
		return self.tripulantesBorrachos().max({unTripulante => unTripulante.dinero()})
	}
}