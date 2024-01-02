//
//  ListContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-22.
//

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
                        primaryButton: .default(Text("Si"), action: {
                            ContactBookPersistenceController.shared.deleteData(item: contact)
                        }),
                        secondaryButton: .destructive(Text("No"))
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
