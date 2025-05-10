object dominic {
    const autos = []
    method comprar(unAuto) {autos.add(unAuto)}
    method autosNoEnCondiciones() = autos.filter({a=> not a.estaEnCondicion()})
    method autosEnCondiciones() =   autos.filter({a => a.enCondiciones()})
    method mandarAutosAlTaller() {taller.recibirAutos(self.autosNoEnCondiciones())}
    method pruebasDeVelocidad() {autos.forEach({a => a.hacerPrueba()})}
    method venderAutos() { autos.clear() }
    method promedioVelocidades() = autos.sum({a => a.velocidadMaxima()}) /autos.size()
    method masRapido() = self.autosEnCondiciones().max({ a=> a.velocidadMaxima()})
    method hayUnAutoMuyRapido() = self.masRapido().velocidadMaxima() > 2 * self.promedioVelocidades()    
}

object taller {
    const autosAReparar = []
    method recibirAutos(listaDeAutos) { autosAReparar.addAll(listaDeAutos) }
    method repararAutos() { 
      autosAReparar.forEach({a => a.reparar()}) 
      autosAReparar.clear()
      }
}

object ferrari {
    var motor = 87
    method enCondiciones() = motor >= 65
    method reparar() {motor = 100}
    method velocidadMaxima() = 110 + if(motor>75) 15 else 0
    method hacerPrueba() { motor = (motor - 30).max(0)}   
}

object flechaRubi{
    var cantidadLitrosCombustible = 100
    var color = azul
    var property combustible = gasolina
    method enCondiciones() = cantidadLitrosCombustible > combustible.nivelMinimo(cantidadLitrosCombustible)  && color == rojo
    method hacerPrueba() {(cantidadLitrosCombustible - 5).max(0)}
    method reparar() {
      cantidadLitrosCombustible *= 2
      color = color.cambiarDeColor()
    }
    method velocidadMaxima() = cantidadLitrosCombustible * 2 + combustible.valorExtra(cantidadLitrosCombustible)
}


object gasolina {
    method nivelMinimo() = 85
    method valorExtra(litros) = 10    

}
object nafta {
    method nivelMinimo() = 50
    method valorExtra(litros) = -1 * ((litros * 2)*0.10)
}
object nitrogenoLiquido {
    method nivelMinimo() = 0
    method valorExtra(litros) = litros * 2 * 10
}

object azul {method cambiarDeColor() = verde}

object rojo {method cambiarDeColor() = azul}

object verde {method cambiarDeColor() = rojo}

object intocable{
    var property enCondiciones = true
    method hacerPrueba() {enCondiciones = false}
    method reparar() {enCondiciones = true}
    method velocidadMaxima() = 45
}