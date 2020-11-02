import Pelotas.*

class Posicion {
	
	var property tieneQuaffle = false
}

class Cazador inherits Posicion {
	
	method calculoDeHabilidadDe(unJugador) {
		return unJugador.velocidad() + unJugador.skills() + unJugador.punteria() * unJugador.fuerza()
		
	}
	
	method agarrarQuaffle() {
		self.tieneQuaffle(true)
	}

	method jugarPara(unJugador, unEquipo) {
		
		if(!tieneQuaffle) {
			throw new Exception(message = "El cazador no tiene la quaffle!")
		}

		if(unEquipo.alguienPuedeBloquearA(unJugador)) {
			const bloqueador = unEquipo.bloqueadorDe(unJugador)
			bloqueador.aumentarSkillsEn(10)
			unJugador.perderSkills(2)
		}
		else {
			unJugador.aumentarSkillsEn(5)
			unJugador.anotar()
		}
		
		unJugador.perderQuaffleContra(unEquipo)
	}
	
	method puedeBloquearTiro(unJugador, otroJugador) {
		return unJugador.lePasaElTrapoA(otroJugador)
	}
	
	method blancoUtil(unJugador) {
		return unJugador.tieneLaQuaffle()
	}
	
	method recibirGolpeDeBludger() {
		if(tieneQuaffle) tieneQuaffle = false
	}
	
}

class Guardian inherits Posicion {
	
	method calculoDeHabilidadDe(unJugador) {
		return unJugador.velocidad() + unJugador.skills() + unJugador.reflejos() + unJugador.fuerza()
	}
	
	method jugarPara(unJugador, unEquipo) {
		
	}
	
	method puedeBloquearTiro(unJugador, otroJugador) {
		return (1..3).anyOne().equals(3)
	}
	
	method blancoUtil(unJugador) {
		return unJugador.equipoSinQuaffle()
	}
	
	method recibirGolpeDeBludger() {
		
	}
	
}

class Golpeador inherits Posicion {
	
	method calculoDeHabilidadDe(unJugador) {
		return unJugador.velocidad() + unJugador.skills() + unJugador.punteria() + unJugador.fuerza()
	}
	
	method jugarPara(unJugador, unEquipo) {
		const blancoUtil = unEquipo.algunJugador()
		if(unJugador.puedeGolpearA(blancoUtil)) {
			blancoUtil.serGolepeadoPorUnaBludger()
			unJugador.aumentarSkillsEn(1)
		}
	}
	
	method puedeBloquearTiro(unJugador, otroJugador) {
		return unJugador.esGroso()
	}
	
	method blancoUtil(unJugador) {
		return false
	}
	
	method recibirGolpeDeBludger() {
		
	}
	
}

class Buscador inherits Posicion {
	
	var snitchEncontrada = false
	var turnos = 0
	var kmRecorridos = 0
	
	method calculoDeHabilidadDe(unJugador) {
		return unJugador.velocidad() + unJugador.skills() + unJugador.reflejos() * unJugador.vision() 
	}
	
	method jugarPara(unJugador, unEquipo) {
		if(!snitchEncontrada) self.buscarSnitch(unJugador)
		else self.perseguirSnitch(unJugador)
	}
	
	method buscarSnitch(unJugador) {
		const random = (1..1000).anyOne()
		if(random < unJugador.habilidad() + turnos) snitchEncontrada = true
	}
	
	method pasarTurnoDe(unJugador) {
		turnos ++
		kmRecorridos += unJugador.velocidad() / 1.6
	}
	
	method perseguirSnitch(unJugador) {
		if(kmRecorridos >= 5000) {
			unJugador.aumentarSkillsEn(10)
			unJugador.aumentarPuntosDeEquipoEn(150)
		}
	}
	
	method puedeBloquearTiro(unJugador, otroJugador) {
		return false
	}
	
	method blancoUtil(unJugador) {
		return !snitchEncontrada || kmRecorridos >= 4000
	}
	
	method recibirGolpeDeBludger() {
		kmRecorridos = 0
	}
}























