import Zonas.*

class Inmueble {
	const tamanio
	const cantidadAmbientes
	const operacion
	const reservada
	const zona
	
	method posibilidadVenta() {
		return true
	}
}

class Casa inherits Inmueble {
	
	var precio
	
	method precio() {
		return precio + zona.plus()
	}
	
}

class Ph inherits Inmueble {
	
	method precio() {
		return (14000 * tamanio).min(500000) + zona.plus()
	}
	
}

class Departamento inherits Inmueble {
	
	method precio() {
		return 350000 * cantidadAmbientes + zona.plus()
	}
	
}

class Local inherits Casa {
	var tipoLocal
	
	override method precio() {
		return tipoLocal.valorFinal(super())
	}
	
	override method posibilidadVenta() {
		throw new Exception(message = "Los locales no pueden ser vendidos")
	}
}

object galpon {
	method valorFinal(valorBase){
		return valorBase / 2
	}
}

object localALaCalle {
	
	var property montoFijo
	
	method valorFinal(valorBase) {
		return valorBase + montoFijo
	}
}