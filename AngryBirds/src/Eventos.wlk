import Isla.*

object sesionDeManejoDeIraConMatilda {
	
	method realizarse() {
		islaPajaro.tranquilizarPajaros()
	}
	
}

class InvasionDeCerditos {
	
	const unosCerditos
	
	method realizarse() {
		islaPajaro.serInvadidaPor(unosCerditos)
	}
	
}

class FiestaSorpresa {
	
	method realizarse() {
		if(islaPajaro.noHayHomenajeados()) {
			throw new Exception(message = "No hay pajaros para homenajear!")
		}
		
		islaPajaro.enojarHomenajeados()
	}
}

class SerieDeEventos {
	const eventos = []
	
	method realizarse() {
		eventos.forEach({unEvento => unEvento.realizarse()})
	}
}
