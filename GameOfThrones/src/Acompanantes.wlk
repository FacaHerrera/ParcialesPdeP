class Animal {
	
	method patrimonioPersonal() {
		return 0
	}
}

class Dragon inherits Animal {
	
	method esPeligroso() {
		return true
	}
	
}

class Lobo inherits Animal {
	
	const property huergo
	
	method esPeligroso() {
		return huergo
	}
	
}
