//
//  ContactBookView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-19.
//

import SwiftUI

struct ContactBookView: View {
    private var viewModel = ContactBookViewModel()
    
    //Para obtener el listado de contactos desde el Core Data
    @FetchRequest(entity: Contact.entity(), sortDescriptors: []) var contacts : FetchedResults<Contact>
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Colors.defaultBackgroundColor
                VStack {
                    ListContactView(contacts: contacts)
                    Spacer()
                    ButtonAddContactView()
                    Spacer()
                }
            }
        }
        .navigationTitle(self.viewModel.titleNavigationBar)
        
    }
}

#Preview {
    ContactBookView()
}

