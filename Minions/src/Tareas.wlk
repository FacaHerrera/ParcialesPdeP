class ArreglarMaquina {
	
	const maquina
	const complejidad = maquina.complejidad()
	const herramientasNecesarias = []
	
	method requerimientoPara(unMinion) {
		return unMinion.tieneMasStaminaQue(complejidad) && unMinion.tieneHerramientas(herramientasNecesarias)
	}
	
	method serEjecutadaPor(unMinion) {
		unMinion.perderStaminaEn(complejidad)
	}
	
	method dificultadPara(unMinion) {
		return 2 * complejidad
	}
	
}

class Maquina {
	
	const property complejidad
	
}

class DefenderUnSector {
	
	const property gradoDeAmenaza
	
	method requerimientoPara(unMinion) {
		return unMinion.defiende() && unMinion.tieneMasFuerzaQue(gradoDeAmenaza)
	}
	
	method serEjecutadaPor(unMinion) {
		unMinion.perderStaminaPorDefensa()
	}
	
//	method dificultadPara(unMinion) {
//		return unMinion.dificultadPara(self)
//	}

	method dificultadPara(unMinion) {
		if(unMinion.esCiclope()) return 2 * gradoDeAmenaza
		else return gradoDeAmenaza
	}
	
}

class LimpiarSector {
	
	var dificultad
	const esSectorGrande
	
	
	method requerimientoPara(unMinion) {
		if(esSectorGrande) return unMinion.tieneMasStaminaQue(4)
		else return unMinion.tieneMasStaminaQue(1)
	}
	
	method serEjecutadaPor(unMinion) {
		if (esSectorGrande) unMinion.perderStaminaPorLimpieza(4)
		else unMinion.perderStaminaPorLimpieza(1)
	}
	
	method dificultadPara(unMinion) {
		return dificultad
	}
	
}