//
//  ListContactView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-12-22.
//

import Foundation
import SwiftUI

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
