//
//  ListContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-22.
//

/*
 onLongPressGesture se puede agregar solamente en vista interactivas, no se puede agregar el HStack y VStack porque en teoria no son vistas interactivas, sino son estructuras de vistas.
*/

import Foundation
import SwiftUI

struct ListContactView : View {
    let viewModel : ListContactViewModel = ListContactViewModel()
    
    var contacts : FetchedResults<Contact>
    
    @State private var showAlert : Bool = false
    
    var body: some View {
        if !self.contacts.isEmpty {
            List(self.contacts) { contact in
                HStack {
                    VStack {
                        Text(contact.name ?? "").onLongPressGesture {
                            self.showAlert.toggle()
                        }
                        Text(contact.lastName ?? "").onLongPressGesture {
                            self.showAlert.toggle()
                        }
                    }
                    Spacer()
                    VStack {
                        Text(contact.phone ?? "").onLongPressGesture {
                            self.showAlert.toggle()
                        }
                        Text(contact.email ?? "").onLongPressGesture {
                            self.showAlert.toggle()
                        }
                    }
                }.alert(isPresented: self.$showAlert) {
                    Alert(
                        title: Text(self.viewModel.titleMessageAlert),
                        message: Text(self.viewModel.messageAlert),
                        primaryButton: .default(Text(self.viewModel.titleOkDeleteButton), action: {
                            ContactBookPersistenceController.shared.deleteData(item: contact)
                        }),
                        secondaryButton: .destructive(Text(self.viewModel.titleCancelDeleteButton))
                    )
                }
            }
            .listStyle(.plain)
        } else {
            VStack {
                Spacer()
                Text(self.viewModel.messageNotExistContact)
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()
            }
           
        }
    }
}
