import Armas.*

class Piramide {
	
	const altura
	
	method requerimientoPara(unMinion) {
		return unMinion.nivelDeConcentracion() >= (altura / 2)
	}
	
	method realizarMaldadPara(unaMaldad) {
		unaMaldad.premiarMinions()
	}
	
}

class SueroMutante {
	
	method requerimientoPara(unMinion) {
		return unMinion.estaBienAlimentado() && unMinion.nivelDeConcentracion() > 23
	}
	
	method realizarMaldadPara(unaMaldad) {
		unaMaldad.darSueroAMinions()
	}
	
}

class LaLuna {
	
	method requerimientoPara(unMinion) {
		return unMinion.tiene("Rayo para encojer")
	}
	
	method realizarMaldadPara(unaMaldad) {
		unaMaldad.abastecerMinionsCon(new Arma(nombre = "Rayo Congelante", potencia = 10))
	}
}
