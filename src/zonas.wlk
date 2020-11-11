import inmueble.*

class Zona { // las distintas zonas son objetos que heredan de esta clase y tienen distintos plus
	var plusZona = 1
	
	method plusZona() = plusZona
	
	method cambiarPlus(nuevoPlus){
		plusZona = nuevoPlus
	}
	
	method esLaMismaZona(otraZona) = otraZona == self
	
}
