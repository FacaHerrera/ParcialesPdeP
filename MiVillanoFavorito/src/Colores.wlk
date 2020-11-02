class Color {
	
	method transformarA(unMinion) {
		unMinion.perderBananas(1)
	}
	
	method concentracionDe(unMinion) {
		return unMinion.bananas()
	}
}

object amarillo inherits Color {
	
	method esCriaturaPeligrosa(unMinion) {
		return unMinion.tieneMasDe2Armas()
	}
	
	override method transformarA(unMinion) {
		super(unMinion)
		unMinion.cambiarColorA(violeta)
		unMinion.perderArmas()
	}
	
	override method concentracionDe(unMinion) {
		const masPotente = unMinion.armaMasPotente()
		return super(unMinion) + masPotente.potencia()
	}
	
}

object violeta inherits Color {
	
	method esCriaturaPeligrosa(unMinion) {
		return true
	}
	
}