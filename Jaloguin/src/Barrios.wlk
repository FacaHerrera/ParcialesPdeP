class Barrio {
	
	var habitantes = []
	
	method los3niniosMasEndulzados() {
		const ninios = habitantes.sortedBy({unNinio, otroNinio => unNinio.caramelos() > otroNinio.caramelos()})
		return ninios.take(3)
	}
	
	method elementosPopulares() {
		const ninios = habitantes.filter({unNinio => unNinio.tieneMasCaramelosQue(10)})
		const elementos = ninios.map({unNinio => unNinio.elementos()})
		return elementos.flatten().asSet() // Probar flatMap
		
	}
	
}
