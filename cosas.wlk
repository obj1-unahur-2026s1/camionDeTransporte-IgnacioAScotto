object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
}

object bumblebee {
    var formaActual =  auto

    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel()
    method cambiarForma(nuevaForma) {formaActual = nuevaForma}
}

object auto{ method nivel() = 15}
object robot{ method nivel() = 30}

object paqueteLadrillos {
    var cantidadDeLadrillos = 10

    method peso() = 2 * cantidadDeLadrillos
      
    method nivelDePeligrosidad() = 1

    method cambiarCantidad(nuevaCantidad) {cantidadDeLadrillos = nuevaCantidad}
}

object arena {
    var property peso = 10

    method nivelDePeligrosidad() = 1 
}

object bateria {
    var estaConMisiles = false

    method peso() = if (estaConMisiles) 300 else 200
    method nivelDePeligrosidad() = if (estaConMisiles) 100 else 0
    method cargarYDescargarMisiles() {estaConMisiles = !estaConMisiles}
}

object contenedor {
    const cosasContenidas = []

    method peso() = 100 + self.pesoDeCosasContenidas()
    method pesoDeCosasContenidas() = cosasContenidas.sum({c=>c.peso()})
    method nivelDePeligrosidad() = if (not cosasContenidas.isEmpty()) self.cosaContenidaMasPeligrosa().nivelDePeligrosidad() else 0
    method cosaContenidaMasPeligrosa() = cosasContenidas.max({c=>c.nivelDePeligrosidad()})

    method meterElementos(listaDeElementos) {cosasContenidas.addAll(listaDeElementos)}
}

object residuos {
    var property peso = 10

    method nivelDePeligrosidad() = 200 
}

object embalaje{
    var cosaQueEnvuelve = residuos

    method peso() = cosaQueEnvuelve.peso()
    method nivelDePeligrosidad() = cosaQueEnvuelve.nivelDePeligrosidad() * 0.5 
    method cambiarLoQueEnvuelve(nuevaCosa) { cosaQueEnvuelve = nuevaCosa} 
}

