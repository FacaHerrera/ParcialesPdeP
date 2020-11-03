class Legion {
	
	var miembros = []
	
	method capacidadDeSusto() {
		return miembros.sum({unMiembro => unMiembro.capacidadDeSusto()})
	}
	
	method caramelos() {
		return miembros.sum({unMiembro => unMiembro.caramelos()})
	}
	
	method lider() {
		return miembros.max({unMiembro => unMiembro.capacidadDeSusto()})
	}
	
	method asustarA(unAdulto) {
		unAdulto.serAsustadoPor(self)
	}
	
	method recibirCaramelos(unaCantidad) {
		self.lider().recibirCaramelos(unaCantidad)
	}
}

// Respecto al punto 3, no es necesario hacer ningun tipo de cambio, ya que
// al tratar polimorficamente a las legiones y a los niños, no supone ningun
// inconveniente que los miembros de una legion puedan ser cualquiera de las 2.