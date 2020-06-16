import elementos.*
class Plagas {
	
	var property poblacion 
	method puedeTrasmitir () = poblacion >= 10
	method efectoDeAtaque (elemento)
	{ 
		elemento.esAtacado(self)
		poblacion+= poblacion*0.1  
	}
	
}

class Cucarachas inherits Plagas
{
	var property peso 
	method nivelDeDanio() =  poblacion/2
	override method  puedeTrasmitir() =  peso > 10 and super()
	override method efectoDeAtaque(elemento) 
	{
		super(elemento)
		peso += 2
	}
}

class Pulgas inherits Plagas
{
	
	method nivelDeDanio() = poblacion * 2
} 

class Garrapatas inherits Pulgas 
{
	override method efectoDeAtaque(elemento)
	{
		elemento.esAtacado(self)
		poblacion+=poblacion*0.2
	}
}

class Mosquitos inherits Plagas 
{
	method nivelDeDanio() = poblacion
	override method puedeTrasmitir () = poblacion%3 == 0 and super()
}