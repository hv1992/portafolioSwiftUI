//
//  ContactBookView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-19.
//

import SwiftUI

struct ContactBookView: View {
    @ObservedObject var viewModel = ContactBookViewModel()
    
    //Para obtener el listado de contactos desde el Core Data
    @FetchRequest(entity: Contact.entity(), sortDescriptors: []) var contacts : FetchedResults<Contact>
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Colors.defaultBackgroundColor
                VStack {
                    TitleContactListView(viewModel: self.viewModel)
                    ListContactView(viewModel: self.viewModel, contacts: self.contacts)
                    Spacer()
                    ButtonAddContact(viewModel: self.viewModel, contacts: self.contacts)
                }
            }
        }
        .navigationTitle(self.viewModel.titleNavigationBar)
        
    }
}

#Preview {
    ContactBookView()
}


struct TitleContactListView: View {
    
    @ObservedObject var viewModel : ContactBookViewModel
    
    var body: some View {
        Text(self.viewModel.titleListContacts)
            .font(.title)
            .foregroundColor(.white)
    }
}

struct ListContactView : View {
    @ObservedObject var viewModel : ContactBookViewModel
    
    var contacts : FetchedResults<Contact>
    
    var body: some View {
        if !self.contacts.isEmpty {
            List(self.contacts) { contact in
                HStack {
                    VStack {
                        Text(contact.name ?? "")
                        Text(contact.lastName ?? "")
                    }
                    VStack {
                        Text(contact.phone ?? "")
                        Text(contact.email ?? "")
                    }
                }
            }
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

struct ButtonAddContact : View {
    @ObservedObject var viewModel : ContactBookViewModel
    
    var contacts : FetchedResults<Contact>
    
    var body: some View {
        Button {
            
        } label: {
            Text(self.viewModel.titleButtonAddContact).padding(.all,8.0)
        }
        .background(Color.blue.opacity(0.8).ignoresSafeArea())
        .cornerRadius(8)
        .foregroundColor(Color.white)
    }
    
}
