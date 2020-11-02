class Rol {
	
	var property herramientas = []
	
	method tiene(unasHerramientas) {
		return unasHerramientas.all({unaHerramienta => herramientas.contains(unaHerramienta)})
	}
	
	method adicionalFuerza() {
		return 0
	}
	
	method bajarStaminaPorDefensaDe(unMinion) {
		unMinion.modificarStaminaEn(0.5)
	}
	
	method bajarStaminaPorLimpiezaDe(unMinion, unaStamina) {
		unMinion.perderStaminaEn(unaStamina)
	}
	
	method ejecutar(unaTarea, unMinion) {
		unaTarea.serEjecutadaPor(unMinion)
	}
}

class Soldado inherits Rol {
	
	var property arma
	var danioPorPractica
	
	override method adicionalFuerza() {
		return danioPorPractica
	}
	
	method usarArma() {
		arma.aumentarDanioEn(2)
		danioPorPractica += 2
	}
	
	method resetearArma() {
		arma.resetarse()
	}
	
	method disponibleParaDefensa() {
		return true
	}
	
	override method bajarStaminaPorDefensaDe(unMinion) {
		
	}
	
}

class Obrero inherits Rol {
	
	method disponibleParaDefensa() {
		return true
	}
	
}

class Mucama inherits Rol {
	
	method disponibleParaDefensa() {
		return false
	}
	
	override method bajarStaminaPorLimpiezaDe(unMinion, unaStamina) {
		
	}
}

class Capataz inherits Rol {
	
	var empleados = []
	
	method empleadosAptosPara(unaTarea) {
		return empleados.filter({unEmpleado => unaTarea.requerimientoPara(unEmpleado)})
	}
	
	method masExperimentadoDe(unosEmpleados) {
		return unosEmpleados.max({unEmpleado => unEmpleado.experiencia()})
	}
	
	override method ejecutar(unaTarea, unMinion) {
		const empleadoElegido = self.masExperimentadoDe(self.empleadosAptosPara(unaTarea))
		super(unaTarea, empleadoElegido)
	}
	
}




















