class Ciudad {
	
	var temperatura
	var objetos = []
	
	method reducirTemperaturaEn(unosGrados) {
		temperatura -= unosGrados
	}
	
	method perderObjeto(unObjeto) {
		objetos.remove(unObjeto)
	}
}
