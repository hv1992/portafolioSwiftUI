//
//  FormAddContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-23.
//

import SwiftUI

struct FormAddContactView: View {
    
    @State var nameContact : String = ""
    @State var lastName : String = ""
    @State var phone: String = ""
    @State var email: String = ""

    
    var body: some View {
        VStack {
            FormCellAddContactView(titleCell: "Nombre: ", information: nameContact)
            FormCellAddContactView(titleCell: "Apellido: ", information: nameContact)
            FormCellAddContactView(titleCell: "Telefono: ", information: nameContact)
            FormCellAddContactView(titleCell: "Email: ", information: email)
        }.padding()
    }
}

#Preview {
    FormAddContactView()
}

struct FormCellAddContactView : View {
    
    var titleCell : String
    @State var errorMessage : String = ""
    @State var information : String
    
    var body: some View {
        VStack {
            HStack {
                Text(self.titleCell)
                TextEditor(text: $information)
            }.frame(height: 35)
            if !errorMessage.isEmpty {
                Text(self.errorMessage)
            }
        }
        
    }
    
}
