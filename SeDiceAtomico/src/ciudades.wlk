import centrales.*

object springfield {
	
	var property produccionNecesaria = 0
	var centrales = [centralAtomicaBurns, centralCarbonExBosque, centralEolicaSuspiro]
	var property riquezaSuelo = 0.9
	var property velocidadViento = 10
	
	method todasContaminantes() {
		return centrales.all({unaCentral => unaCentral.esCentralContaminante()})
	}
	
	method produccionTotal(unasCentrales) {
		return unasCentrales.sum({unaCentral => unaCentral.produccionEnergetica()})
	}
	
	method cubrioSusNecesidades() {
		return self.produccionTotal(centrales) > produccionNecesaria
	}
	
	method centralesContaminantes() {
		return centrales.filter({unaCentral => unaCentral.esCentralContaminante()})
	}
	
	method contaminantesAportanMasDe(unaCantidad) {
		return self.produccionTotal(self.centralesContaminantes()) > 0.5 * produccionNecesaria
		
	}
	
	method estaEnElHorno() {
		return self.todasContaminantes() || self.contaminantesAportanMasDe(0.5)
	}
	
	method centralMasProductora() {
		return centrales.max({unaCentral => unaCentral.produccionEnergetica()})
	}
}

object albuquerque {
	var centrales = [centralHidroelectrica]
	var property caudalRio = 150
	
	method produccionTotal(unasCentrales) {
		return unasCentrales.sum({unaCentral => unaCentral.produccionEnergetica()})
	}
	
	method centralMasProductora() {
		return centrales.max({unaCentral => unaCentral.produccionEnergetica()})
	}
}