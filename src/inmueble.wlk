import operaciones.*
import zonas.*

class Inmueble {
	var metrosCuadrados
	var ambientes
	var operacionParaLaQueSePublica
	var zona
	var reservado
	var reservadoParaCliente
	var tomadaPorEmpleado	
	
	method zona() = zona
	
	method reservar(cliente,empleado){
		if(not(self.reservado())){
			reservado = true
			reservadoParaCliente = cliente
			tomadaPorEmpleado = empleado
		}
	}
	
	method reservado() = reservado
	
	method reservadoPorCliente() = reservadoParaCliente
	
	method tomadaPorEmpleado() = tomadaPorEmpleado
	
	method reservadaPorEl(empleado) = tomadaPorEmpleado == empleado
		
	method concretar(cliente,empleado,operacion){
		if(reservadoParaCliente == cliente){
			operacion.concretarOperacion(empleado)
		}else{
			self.error("No fue reservada por este cliente.")
		}
		
	}
	
	method puedeVenderse() = true
	
	method valor()
	
	
}

class Casa inherits Inmueble{
	var valorParticular = 0
	
	override method valor() = valorParticular + zona.plusZona()
	
}

class Ph inherits Inmueble{
	var valorMetroCuadrado = 14000
	
	method cambiarValorMetroCuadrado(nuevoValor){
		valorMetroCuadrado = nuevoValor
	}
	
	override method valor() = 500000.max(valorMetroCuadrado * metrosCuadrados) +zona.plusZona()
	
}

class Depto inherits Inmueble{
	var tasaPorAmbiente = 350000
	
	method cambiarTasaPorAmbiente(nuevaTasa){
		tasaPorAmbiente = nuevaTasa
	}
	
	override method valor() = (tasaPorAmbiente * ambientes) + zona.plusZona()
}

class Local inherits Casa{
	var tipo
	
	override method valor() = zona.plusZona() + tipo.valorTipo(valorParticular)
	
	method cambiarTipo(nuevoTipo){
		tipo = nuevoTipo
	}
	
	override method puedeVenderse() = false
	
}

// tipos de local

object galpon{
	method valorTipo(valorParticular) = valorParticular / 2
}

object aLaCalle{
	const montoFijo = 20000
	
	method valorTipo(valorParticular) =  montoFijo + valorParticular
}
