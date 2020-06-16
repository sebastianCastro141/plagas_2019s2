import plagas.*
class Hogar {
	
	var property nivelDeMugre 
	var property confort 
	
	method esBueno() = nivelDeMugre <= confort/2
	method esAtacado(plaga) {nivelDeMugre += plaga.nivelDeDanio()}
	
	
}

class Huerta 
{
	var property capacidadDeProduccion
	var property nivel
	method esBueno() = capacidadDeProduccion > nivel
	method esAtacado(plaga) 
	{
		capacidadDeProduccion-= plaga.nivelDeDanio()*0.1
		return if (plaga.puedeTrasmitir()) {capacidadDeProduccion -= 10} else {capacidadDeProduccion}
	}
}

class Mascotas 
{
	var property nivelDeSalud 
	method esBueno () = nivelDeSalud > 250
	method esAtacado(plaga) {return if (plaga.puedeTrasmitir()){nivelDeSalud -= plaga.nivelDeDanio()}else{} } 
}

class Barrios 
{
	var property listaDeElementos = []
	method esCopado() = self.elementosBuenos() > self.elementosMalos()
	method elementosBuenos() = listaDeElementos.filter({e => e.esBueno()}).size()
	method elementosMalos() = listaDeElementos.filter({e => not e.esBueno()}).size() 
}






