class Minion {
	
	var property stamina
	var property rol
	var property tareasRealizadas = []
	
	method tieneMasStaminaQue(unaStamina) {
		return stamina >= unaStamina
	}
	
	method tieneHerramientas(unasHerramientas) {
		return rol.tiene(unasHerramientas)
	}
	
	method defiende() {
		return rol.disponibleParaDefensa()
	}
	
	method fuerza() {
		return stamina / 2 + 2 + rol.adicionalFuerza()
	}
	
	method tieneMasFuerzaQue(unaFuerza) {
		return self.fuerza() >= unaFuerza
	}
	
	method perderStaminaPorDefensa() {
		rol.bajarStaminaPorDefensaDe(self)
	}
	
	method modificarStaminaEn(unPorcentaje) {
		stamina *= unPorcentaje
	}
	
	method perderStaminaEn(unaCantidad) {
		stamina -= unaCantidad
	}
	
//	method dificultadPara(unaTareaDeDefensa) {
//		return unaTareaDeDefensa.gradoDeAmenaza()
//	}
	
	method perderStaminaPorLimpieza(unaStamina) {
		rol.bajarStaminaPorLimpiezaDe(self, unaStamina)
	}
	
	method realizar(unaTarea) {
		if(!unaTarea.requerimientoPara(self)) {
			throw new Exception(message = "El minion no cumple con los requisitos!")
		}
		
		rol.ejecutar(unaTarea, self)
		tareasRealizadas.add(unaTarea)
	}
	
	method comer(unaFruta) {
		stamina += unaFruta.nutrientes()
	}
	
	method experiencia() {
		return tareasRealizadas.sum({unaTarea => unaTarea.dificultadPara(self)})
	}
	
	method esCiclope() {
		return false
	}
}

class Biclopes inherits Minion {
	
	var property eficaciaDisparos = 1
}

class Ciclope inherits Minion {

	var property eficaciaDisparos = 0.5
	
	override method fuerza() {
		return super() / 2
	}
	
	override method esCiclope() {
		return true
	}
	
//	override method dificultadPara(unaTareaDeDefensa) {
//		return 2 * super(unaTareaDeDefensa)
//	}
	
}

class Fruta {
	
	const property nutrientes
	
}

const banana = new Fruta(nutrientes = 10)
const manzana = new Fruta(nutrientes = 5)
const uva = new Fruta(nutrientes = 1)
