//
//  ContactBookPersistenceController.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-19.
//

import Foundation
import CoreData

/*
 En Swift, el Persistence Controller generalmente se refiere a un controlador o gestor utilizado para la persistencia de datos en una aplicación. La persistencia se refiere a la capacidad de almacenar datos más allá de la vida útil de una aplicación, lo que permite recuperarlos y utilizarlos en sesiones futuras.
 
 En el contexto de SwiftUI y Core Data, el Persistence Controller es una estructura fundamental para gestionar el almacenamiento y recuperación de datos en una base de datos local utilizando Core Data. Core Data es un marco de Apple que permite manejar el modelo de datos de una aplicación, incluyendo su almacenamiento, recuperación y gestión.

 El Persistence Controller en este contexto puede ser una estructura personalizada que inicializa y configura la pila de Core Data (como el modelo, el contexto y el coordinador de almacén persistentes). Ayuda a la gestión de la interacción entre la interfaz de usuario de SwiftUI y los datos almacenados en Core Data, proporcionando una forma eficiente de acceder y manipular los datos en la aplicación.

 En resumen, el Persistence Controller en Swift con Core Data es un componente crucial que facilita la persistencia y manipulación de datos almacenados localmente en una aplicación, ayudando a separar las preocupaciones relacionadas con el almacenamiento de datos de la lógica de la interfaz de usuario.
 
 */


struct ContactBookPersistenceController {
    
    static let shared = ContactBookPersistenceController()
    
    let container : NSPersistentContainer
    
    // A test configuration for SwiftUI previews
        static var preview: ContactBookPersistenceController = {
            let controller = ContactBookPersistenceController(inMemory: true)

            // Create 10 example contacts.
            for i in 0..<10 {
                let contact = Contact(context: controller.container.viewContext)
                contact.name = "Contact\(i)"
                contact.lastName = "ContactLast\(i)"
                
            }

            return controller
        }()

    
    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        self.container = NSPersistentContainer(name: "ContactContainer")

        /*
            La parte del almacenamiento en memoria de ese código es importante, porque cuando configura Core Data para guardar información en la memoria en lugar del disco, significa que todos los cambios que realiza se desechan cuando finaliza el programa.
         */
        if inMemory {
            /*
             
             /dev/null es un dispositivo especial en sistemas operativos tipo Unix y Linux que se utiliza para descartar datos. En términos simples, es un "agujero negro" donde puedes enviar información y esa información simplemente desaparecerá, sin ser almacenada en ningún lugar.

             Cuando un programa escribe datos en /dev/null, estos datos se descartan de inmediato. Por ejemplo, si rediriges la salida de un comando al archivo /dev/null, significa que estás enviando esa salida a la nada, lo que es útil cuando no necesitas la salida del comando y solo deseas asegurarte de que no se muestre ni se almacene en ningún lugar. Es común usar /dev/null para silenciar la salida de un comando o para descartar datos innecesarios.
             
             */
            
            self.container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        self.container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    /// Esto es para guardar los datos en el Core Data.
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error guardado: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteData(item : Contact) {
        let context = container.viewContext
        
        context.delete(item)
        //try! context.save()
        do {
            try context.save()
            print("Elimino")
        } catch let error as NSError {
            // alerta al usario
            print("No elimino", error.localizedDescription)
        }
    }
}
