import Isla.*

class PajaroComun {
	
	var ira
	var property homenajeado = false
	
	method fuerza() {
		return 2 * ira
	}
	
	method enojarse() {
		ira *= 2
	}
	
	method esFuerte() {
		return self.fuerza() > 50
	}
	
	method tranquilizarse() {
		ira -= 5
	}
	
	method atacar() {
		if(self.fuerza() > islaCerdito.resistenciaPrimerObstaculo()) islaCerdito.derribarPrimerObstaculo()
	}
	
}

class Red inherits PajaroComun {
	
	var cantEnojos
	
	override method fuerza() {
		return 10 * ira * cantEnojos
	}
	
	override method enojarse() {
		super()
		cantEnojos++
	}
	
}
class Bomb inherits PajaroComun {
	
	var topeFuerza = 9000
	
	override method fuerza() {
		return super().min(topeFuerza)
	}
	
}

class Chuck inherits PajaroComun {
	
	// Puede que no haga falta heredar de PajaroComun ya que no comparte nada, solo la ira como parametro que no usa para nada.
	
	var velocidad
	
	override method fuerza() {
		
		if(velocidad <= 80) return 150
		else return 150 + (velocidad - 80) * 5
	}
	
	override method enojarse() {
		velocidad *= 2
	}
	
	override method tranquilizarse() {
		
	}
	
}

class Terence inherits Red {
	
	var multiplicador
	
	override method fuerza() {
		return ira * cantEnojos * multiplicador
	}
	
}

class Matilda inherits PajaroComun {
	
	var huevos
	
	override method fuerza() {
		return super() + self.fuerzaDeHuevos()
	}
	
	method fuerzaDeHuevos() {
		return huevos.sum({unHuevo => unHuevo.fuerza()})
	}
	
	override method enojarse() {
		huevos.add(new Huevo(peso = 2))
	}
	
}

class Huevo {
	
	const peso
	
	method fuerza() {
		return peso
	}
}