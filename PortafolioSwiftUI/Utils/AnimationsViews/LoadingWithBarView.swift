//
//  LoadingWithBar.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-04.
//

import SwiftUI

struct LoadingWithBarView: View {
    @State private var isLoading = false
     
        var body: some View {
            ZStack {
     
                Text("Cargando")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: -25)
     
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(.systemGray5), lineWidth: 3)
                    .frame(width: 250, height: 3)
     
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.green, lineWidth: 3)
                    .frame(width: 30, height: 3)
                    .offset(x: isLoading ? 110 : -110, y: 0)
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            }
            .onAppear() {
                self.isLoading = true
            }
        }
}

struct LoadingWithBarView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingWithBarView()
    }
}
