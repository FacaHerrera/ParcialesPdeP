object tirador {
	
	const property staminaReduccion = 3
	
	method habilidad(unJugador){
		const habilidad = (unJugador.eficaciaTriples() * 2 + (unJugador.inteligencia() + unJugador.talento()) / 2 + unJugador.altura() / 2) / 2
		if (unJugador.esSucio()){
			return habilidad * 0.85
		}
		else{
			return habilidad
		}
	}
}

object rebotador {
	
	const property staminaReduccion = 8
	
	method habilidad(unJugador){
		const habilidad = (unJugador.altura() * 2 + (unJugador.inteligencia() - unJugador.talento()) / 3) / 5
		if (unJugador.esSucio()){
			return habilidad * 1.2
		}
		else{
			return habilidad
		}
	}
}

object pasador {
	
	const property staminaReduccion = 5
	
	method habilidad(unJugador){
		return ((unJugador.inteligencia() + unJugador.talento()) / 2 + unJugador.altura() * 0.80 + unJugador.eficaciaTriples() * 0.30) / 5
	}
}

//const juan = new Jugador(altura = 180, eficaciaTriples = 0.60, inteligencia = 30, talento = 60, esSucio = true, estilo = tirador)
//const franco = new Jugador(altura = 200, eficaciaTriples = 0.10, inteligencia = 70, talento = 70, esSucio = true, estilo = rebotador)
//const aye = new Jugador(altura = 167, eficaciaTriples = 0.35, inteligencia = 80, talento = 85, esSucio = false, estilo = pasador)