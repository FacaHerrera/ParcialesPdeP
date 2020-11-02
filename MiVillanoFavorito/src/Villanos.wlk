import Armas.*
import Minions.*

class Villano {
	
	var property ejercitoDeMinions = []
	
	method crearMinion() {
		ejercitoDeMinions.add(new Minion(bananas = 5, armas = [new Arma(nombre = "Rayo Congelante", potencia = 10)]))
	}
	
	method agregarMinion(unMinion) {
		ejercitoDeMinions.add(unMinion)
	}
	
	method premiarConBananasA(unosMinions) {
		unosMinions.forEach({unMinion => unMinion.serPremiado()})
	}
	
	method premiarASusMinions() {
		self.premiarConBananasA(ejercitoDeMinions)
	}
	
	method minionMasUtil() {
		return ejercitoDeMinions.max({unMinion => unMinion.cantidadDeMaldades()})
	}
	
	method minionsMasInutiles() {
		return ejercitoDeMinions.filter({unMinion => unMinion.esInutil()})
	}
	
	method minionsPara(unaMaldad) {
		return ejercitoDeMinions.filter({unMinion => unaMaldad.requisitoMinion(unMinion)})
	}
	
	method planificar(unaMaldad) {
		const minions = self.minionsPara(unaMaldad)
		unaMaldad.agregarMinions(minions)
	}
	
	method realizar(unaMaldad) {
		unaMaldad.realizarse()
	}
	
}