import estilos.*

class Jugador {
	const property altura
	var property eficaciaTriples
	var property inteligencia
	var property talento
	var property esSucio
	var property estilo
	var property stamina = 100
	
	method esCrack() {
		return self.esCrackSegun(estilo)
	}
	
	method esCrackSegun(unEstilo) {
		return self.habilidadSegun(unEstilo) > 90
	}
	
	method habilidadSegun(unEstilo) {
		return unEstilo.habilidad(self) - self.cansancio()
	}
	
	method habilidad() {
		return self.habilidadSegun(estilo)
	}
	
	method esLeyenda() {
		const estilos = #{tirador, pasador, rebotador}
		return estilos.all({unEstilo => self.esCrackSegun(unEstilo)})
	}

	method modificarEficacia(unaCantidad) {
		eficaciaTriples *= unaCantidad
	}
	
	method modificarTalento(unaCantidad) {
		talento *= unaCantidad
	}
	
	method cansancio() {
		return 100 - stamina
	}
	
	method cansarse() {
		stamina = (stamina - estilo.staminaReduccion()).max(0)
	}
	
	method esDeAltoRendimiento() {
		return estilo.staminaReduccion() <= 4
	}
	
	method recuperarStaminaEn(unosPuntos) {
		stamina = (stamina + unosPuntos).min(100)
	}
	
	method entrenarse() {
		self.modificarEficacia(1.1)
		self.modificarTalento(1.1)
		self.cansarse()
	}
}



//const juan = new Jugador(altura = 180, eficaciaTriples = 0.60, inteligencia = 30, talento = 60, esSucio = true, estilo = tirador)
//const franco = new Jugador(altura = 200, eficaciaTriples = 0.10, inteligencia = 70, talento = 70, esSucio = true, estilo = rebotador)
//const aye = new Jugador(altura = 167, eficaciaTriples = 0.35, inteligencia = 80, talento = 85, esSucio = false, estilo = pasador)


