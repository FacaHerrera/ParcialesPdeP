import Emociones.*

class Recuerdos {
	const descripcion
	const fecha = new Date()
	const emocion
	const portador
	
	method asentarse() {
		emocion.asentarA(self)
	}
	
	method portadorFeliz() {
		return portador.nivelDeFelicidad() > 500
	}
	
	method centralizarse() {
		portador.agregarAPensamientosCentrales(self)
	}
	
	method entristecerPortador(unPorcentaje) {
		portador.disminuirFelicidad()
	}
	
	method esDificil() {
		return descripcion.words().size() > 10
	}
	
	method esAlegre(){
		return false
	}
	
	method negar() {
		emocion.negarRecuerdo()
	}
	
}