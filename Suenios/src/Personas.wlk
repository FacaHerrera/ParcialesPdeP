class Persona {
	
	var property edad
	var property sueniosACumplir = []
	var property sueniosCumplidos = []
	var property carrerasASeguir = []
	var property gananciaEsperada
	var property lugaresAVisitar = []
	var property hijos
	var felicidadPersona
	
	method cumplir(unSuenio) {
		if(!unSuenio.puedeCumplirsePara(self)) {
			throw new Exception(message = "El sueño no puede ser cumplido por la persona en cuestion")
		}
		
		unSuenio.cumplirsePara(self)
		self.hacerFeliz(unSuenio.felicidonios())
		sueniosCumplidos.add(unSuenio)
		sueniosACumplir.delete(unSuenio)
	}
	
	method recibirseDe(unaCarrera) {
		carrerasASeguir.delete(unaCarrera)
	}
	
	method agregarHijos(unaCantidad) {
		hijos += unaCantidad
	}
	
	method tieneHijos() {
		return hijos > 0
	}
	
	method viajarA(destino) {
		lugaresAVisitar.delete(destino)
	}
	
	method hacerFeliz(unosFelicidonios) {
		felicidadPersona += unosFelicidonios
	}
	
	method suenioMasImportante() {
		return sueniosACumplir.max({unSuenio => unSuenio.felicidonios()})
	}
	
	method primerSuenio() {
		return sueniosACumplir.head()
	}
	
	method randomSuenio() {
		return sueniosACumplir.anyOne()
	}
	
	method felicidoniosDeSueniosPendientes() {
		return sueniosACumplir.sum({unSuenio => unSuenio.felicidonios()})
	}
	
	method esFeliz() {
		return felicidadPersona > self.felicidoniosDeSueniosPendientes()
	}
	
	method sueniosAmbiciosos(unaLista) {
		return unaLista.filter({unSuenio => unSuenio.tieneMasDe100Felicidonios()})
	}
	
	method cantidadDeSueniosAmbiciosos() {
		return self.sueniosAmbiciosos(sueniosACumplir) + self.sueniosAmbiciosos(sueniosCumplidos)
	}
	
	method esAmbiciosa() {
		return self.cantidadDeSueniosAmbiciosos() > 3
	}
}

class Realista inherits Persona {
	method cumplirSuenio() {
		self.cumplir(self.suenioMasImportante())
	}
}

class Alocados inherits Persona {
	method cumplirSuenio() {
		self.cumplir(self.primerSuenio())
	}
}

class Obsesivos inherits Persona {
	method cumplirSuenio() {
		self.cumplir(self.randomSuenio())
	}
}
