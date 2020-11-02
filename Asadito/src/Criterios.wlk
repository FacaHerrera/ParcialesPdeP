class Criterio {
	method movimientoDeElemento(unComensal, otroComensal, unElemento)
}

object criterioSordera inherits Criterio {
	override method movimientoDeElemento(unComensal, otroComensal, unElemento) {
		otroComensal.recibir(unComensal.elementoMasAMano())
	}
}

object criterioMolesto inherits Criterio {
	override method movimientoDeElemento(unComensal, otroComensal, unElemento) {
		otroComensal.recibirVarios(unComensal.elementosCercanos())
	}
}

object criterioSociabilizacion inherits Criterio {
	override method movimientoDeElemento(unComensal, otroComensal, unElemento) {
		unComensal.cambiarPosicionCon(otroComensal)
	}
}

object criterioComun inherits Criterio {
	override method movimientoDeElemento(unComensal, otroComensal, unElemento) {
		otroComensal.recibir(unElemento)
	}
}
