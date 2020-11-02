class Persona {
	var property nivelDeFelicidad
	var property pensamientosCentrales = #{}
	var emocionDominante
	var recuerdosDelDia = []
	var procesosMentales = []
	
	method vivirUnEvento(recuerdoAsociado) {
		recuerdosDelDia.add(recuerdoAsociado)
	}
	
	method agregarAPensamientosCentrales(unRecuerdo){
		pensamientosCentrales.add(unRecuerdo)
	}
	
	method disminuirFelicidad(unPorcentaje) {
		nivelDeFelicidad -= nivelDeFelicidad * (unPorcentaje / 100)
	}
	
	method recuerdosRecientes() {
		return recuerdosDelDia.reverse().take(5)
	}
	
	method pensamientosCentralesDificiles() {
		return pensamientosCentrales.filter({unRecuerdo => unRecuerdo.esDificil()})
	}
	
	method irADormir(){
		procesosMentales.forEach({unProceso => unProceso.aplicar()})
	}
	
	method asentarTodosLosRecuerdosDelDia() {
		recuerdosDelDia.forEach({unRecuerdo => unRecuerdo.asentarse()})
	}
	
	method asentarSegun(unaPalabra) {
		recuerdosDelDia.filter({unRecuerdo => unRecuerdo.descripcion().contains(unaPalabra)})
					   .forEach({unRecuerdo => unRecuerdo.asentarse()})
	}
	
}