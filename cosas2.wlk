object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
    method bultos() = 1

    method consecuenciaDeLaCarga() {}
}

object bumblebee {
    var formaActual =  auto

    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel()
    method bultos() = 2

    method cambiarForma(nuevaForma) {formaActual = nuevaForma}
    method consecuenciaDeLaCarga() {
        self.cambiarForma(robot)
    }
}

object auto{ method nivel() = 15}
object robot{ method nivel() = 30}

object paqueteLadrillos {
    var cantidadDeLadrillos = 10

    method peso() = 2 * cantidadDeLadrillos
      
    method nivelDePeligrosidad() = 1

    method bultos() {
        if(cantidadDeLadrillos<=100) {
            return 1
        }   else if(cantidadDeLadrillos.between(101, 300)) {
            return 2
        } else {return 3}
    }

    method cambiarCantidad(nuevaCantidad) {cantidadDeLadrillos = nuevaCantidad}

    method consecuenciaDeLaCarga() {
        cantidadDeLadrillos += 12
    }
}

object arena {
    var property peso = 10

    method nivelDePeligrosidad() = 1 
    method bultos() = 1

    method consecuenciaDeLaCarga() {
        peso = (peso-10).max(0)
    }
}

object bateria {
    var estaConMisiles = false

    method peso() = if (estaConMisiles) 300 else 200
    method nivelDePeligrosidad() = if (estaConMisiles) 100 else 0

    method bultos() = if(estaConMisiles) 2 else 1

    method cargarYDescargarMisiles() {estaConMisiles = !estaConMisiles}

    method consecuenciaDeLaCarga() {
        estaConMisiles = true
    }
}

object contenedor {
    const cosasContenidas = []

    method peso() = 100 + self.pesoDeCosasContenidas()
    method pesoDeCosasContenidas() = cosasContenidas.sum({c=>c.peso()})
    method nivelDePeligrosidad() = if (not cosasContenidas.isEmpty()) self.cosaContenidaMasPeligrosa().nivelDePeligrosidad() else 0
    method cosaContenidaMasPeligrosa() = cosasContenidas.max({c=>c.nivelDePeligrosidad()})
    method bultos() = 1 +self.bultosDeCosasContenidas()
    method bultosDeCosasContenidas() = cosasContenidas.sum({c=>c.bultos()})

    method meterElementos(listaDeElementos) {cosasContenidas.addAll(listaDeElementos)}
    method consecuenciaDeLaCarga() {
      cosasContenidas.forEach({c=>c.consecuenciaDeLaCarga()})
    }
}

object residuos {
    var property peso = 10

    method nivelDePeligrosidad() = 200 
    method bultos() = 1

    method consecuenciaDeLaCarga() {
        peso += 15
    }
}

object embalaje{
    var cosaQueEnvuelve = residuos

    method peso() = cosaQueEnvuelve.peso()
    method nivelDePeligrosidad() = cosaQueEnvuelve.nivelDePeligrosidad() * 0.5 
    method bultos() = 2

    method cambiarLoQueEnvuelve(nuevaCosa) { cosaQueEnvuelve = nuevaCosa} 
    method consecuenciaDeLaCarga() {}
}

