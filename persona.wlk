import emociones.*
class GrupoDePersonas{
    const personas

    method agregarPersona(persona){
        personas.add(persona)
    }

    method vivirEventoGrupo(evento){
        personas.forEach({persona => persona.vivirEvento(evento)}) 
    }

    method estanPorExplotar(){
        return personas.all({persona => persona.estaPorExplotar()})
    }
}

class Persona{
    const edad
    const emociones = []

    method esAdolescente(){
        return edad.between(12, 18)
    }

    method nuevaEmocion(emocion){
        emociones.add(emocion)
    }

    method estaPorExplotar(){
        return emociones.all({emocion => emocion.puedeLiberarse()})
    }

    method vivirEvento(evento){
        emociones.forEach({emocion => emocion.tratarLiberarse(evento)})
    }

}