import Recuerdos.*

class Emocion {
	
	method asentara(unRecuerdo) {}
	
	method negar(unRecuerdo) {
		return false
	}
	
	method esAlegre() {
		return false
	}
}

object alegre {
	method asentarA(unRecuerdo) {
		if(unRecuerdo.portadorFeliz()) {
			unRecuerdo.centralizarse()
		}
	}
	
	method negar(unRecuerdo) {
		return unRecuerdo.esAlegre().negate()
	}
}

object triste {
	method asentarA(unRecuerdo) {
		unRecuerdo.centralizarse()
		unRecuerdo.entristecerPortador(10)
	}
	
	method negar(unRecuerdo) {
		return unRecuerdo.esAlegre()
	}
}

object temeroso inherits Emocion {}
object disgusto inherits Emocion {}
object furioso inherits Emocion {}