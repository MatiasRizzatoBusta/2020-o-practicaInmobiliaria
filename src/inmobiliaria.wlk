import operaciones.*
import inmueble.*
import empleados.*

object inmobiliaria {
	var empleados = []
	var operacionesRealizadas = []
	
	method agregarOperacionRealizada(operacion) = operacionesRealizadas.add(operacion)
	
	method comisionPorOperacion(operacion) = operacion.comisionOperacion()
	
	method mejorEmpleado(criterio) = criterio.mejorSegunCriterio(empleados)
}

object totalComisiones{
	
	method mejorSegunCriterio(listaEmpleados) = listaEmpleados.max({empleado => empleado.totalComisiones()})
	
}

object cantOperacionesCerradas{
	
	method mejorSegunCriterio(listaEmpleados) = listaEmpleados.max({empleado => empleado.totalOperacionesTipo("operaciones concretadas")})
	
}

object cantidadReservas{
	method mejorSegunCriterio(listaEmpleados) = listaEmpleados.max({empleado => empleado.totalOperacionesTipo("operaciones reservadas")})
	
}
