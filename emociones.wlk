import persona.*

class Evento{
    const impacto
    method impacto() = impacto

    const descripcion //string
    method descripcion() = descripcion

}
    

class Emocion{
    var property intensidad

    const valorParaIntensidad
    var eventosExperimentados = 0

    method esElevada(){
        return (intensidad > valorParaIntensidad) && self.otraCondicion()
    }
    method otraCondicion()


    method puedeLiberarse(){
        return self.esElevada()
    }

    method liberarse(evento){
        self.intensidad(intensidad - evento.impacto())
    }

    method tratarLiberarse(evento){
        if(self.puedeLiberarse()){
            self.liberarse(evento)
        }
        eventosExperimentados += 1
    }
}

class Furia inherits Emocion(intensidad = 100){
    var palabrotas
    
    override method otraCondicion(){
        return palabrotas.any({palabra => palabra.length() > 5})
    }

    override method liberarse(evento){
        super(evento)
        palabrotas = palabrotas.remove(palabrotas.head())
    }
}

class Alegria inherits Emocion{

    override method otraCondicion(){
        return eventosExperimentados % 2 == 0
    }
    
    override method intensidad(valor){
        intensidad = valor.abs()
    }

}

class Tristeza inherits Emocion{
    var property causa = "melancolia"

    override method otraCondicion(){
        return causa != "melancolia"
    }

    override method liberarse(evento){
        super(evento)
        causa = evento.descripcion()
    }
}

class DesagradoYtemor inherits Emocion{
    
    override method otraCondicion(){
        return eventosExperimentados > intensidad
    }

}

//Intensamente 2

class Ansiedad inherits Emocion{
    var property nivelDeAnsiedad

    override method otraCondicion(){
        return nivelDeAnsiedad > 10 && eventosExperimentados > 4
    }

    //al ser liberada, la intensidad disminuye en el doble del impacto del evento
    override method liberarse(evento){
        const impactoDoble = evento.impacto() * 2
        self.intensidad(intensidad - impactoDoble)
    }
    
}   

/* 
  Explica para qué fueron útiles dichos conceptos: polimorfismo y herencia

rta: El concepto de herencia es muy útil con el fin de no repetir código. Las distintas emociones, 
    como por ejemplo furia o alegria, son un tipo de emoción y por lo tanto comparten ciertas características.
    En lugar de repetir las diferentes propiedades y métodos, se puede crear una clase Emocion
    que contenga las propiedades y métodos comunes a todas las emociones y luego crear las emociones 
    que hereden de ella.

    Por otro lado, el polimorfismo es útil para poder tratar a distintos objetos de una misma 
    jerarquía de clases de la misma manera. Esto permite por ejemplo en el metodo de la clase 
    persona vivirEvento, poder tratar a todas las emociones de la persona de la misma manera 
    sin importar de que tipo sean. Por lo tanto, Es fácil agregar nuevas emociones como "Ansiedad" 
    sin afectar el resto del sistema. 
*/