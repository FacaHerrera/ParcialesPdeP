import ciudades.*

object regionSimpsons {
	var ciudades = [springfield, albuquerque]
	
	method centralesMasProductoras() {
		return ciudades.map({unaCiudad => unaCiudad.centralMasProductora()})
	}
}