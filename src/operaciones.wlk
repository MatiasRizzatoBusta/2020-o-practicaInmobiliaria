import inmueble.*

class Operacion {
	var inmueble
	var concretada
	
	method comisionAgente()

	method reservarOperacion(cliente,unInmueble,empleado){
		inmueble = unInmueble
		inmueble.reservar(cliente,empleado)
		empleado.agregarOperacionReservada(self)
	}
	
	method concretarOperacion(empleadoQueConcreta){
		concretada = true
		empleadoQueConcreta.agregarOperacionConcretada(self)
	}
	
	method comisionOperacion() = inmueble.valor()
	
	method inmueble() = inmueble
	
	method esLaMisma(operacion) = inmueble == operacion.inmueble()
	
	method zonaOperacion() = inmueble.zona()
	
	method esSuReserva(otroEmpleado) = inmueble.reservadaPorEl(otroEmpleado)
	
}

// TIPOS DE OPERACION

class Alquiler inherits Operacion{
	var mesesAlquilados = 0
	
	override method comisionAgente() = (inmueble.valor() * mesesAlquilados) / 50000
	
}


object venta inherits Operacion{
	var porcentajeSobreValor = 1.5
	
	method cambiarPorcentaje(nuevoPorcentaje){
		porcentajeSobreValor = nuevoPorcentaje
	}
	
	override method comisionAgente() = inmueble.valor() * porcentajeSobreValor
	
}
