class SuenioMultiple {
	
	const property sueniosACumplir
	
	method puedeCumplirsePara(unaPersona) {
		return sueniosACumplir.forEach({unSuenio => unSuenio.puedeCumplirsePara(unaPersona)})
	}
	
	method cumplirsePara(unaPersona) {
		sueniosACumplir.forEach({unSuenio => unSuenio.cumplirsePara(unaPersona)})
	}
}
