import operaciones.*
import inmueble.*

class Empleado {
	var operacionesConcretadas = []
	var operacionesReservadas = []
	
	method agregarOperacionConcretada(operacion) = operacionesConcretadas.add(operacion)
	
	method agregarOperacionReservada(operacion) = operacionesReservadas.add(operacion)
	
	method operacionesConcretadas() = operacionesConcretadas
	
	method operacionesReservadas() = operacionesReservadas
	
	method totalComisiones() = operacionesConcretadas.sum({operacion => operacion.comisionAgente()})
	
	method esOperacionesConcretadas(tipo) = tipo == "operaciones concretadas"
	
	method totalOperacionesTipo(tipoDeOperacion){
		if(self.esOperacionesConcretadas(tipoDeOperacion)){
			return operacionesConcretadas.size()
		}else{
			return operacionesReservadas.size()
		}
	}
	
	method zonasOperadas() = operacionesConcretadas.map({operacion => operacion.zonaOperacion()}).asSet() //no pongo reptidos
	
	method operoEn(zona) = self.zonasOperadas().contains(zona)
	
	method operoEnMismaZona(otroEmpleado) = self.zonasOperadas().any({zona => otroEmpleado.operoEn(zona)})
	
	method concretoReservaDeOtro(otroEmpleado) = operacionesConcretadas.any({otraOperacion => otraOperacion.esSuReserva(otroEmpleado)})
	
	method vaATenerProblemasCon(otroEmpleado) {
		return self.operoEnMismaZona(otroEmpleado) and (self.concretoReservaDeOtro(otroEmpleado) || otroEmpleado.concretoReservaDeOtro(self))
	}
	
	
}
