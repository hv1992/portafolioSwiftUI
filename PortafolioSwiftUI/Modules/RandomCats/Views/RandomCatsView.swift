//
//  RandomCatsView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-28.
//

import SwiftUI

struct RandomCatsView: View {
    @ObservedObject var viewModel : RandomCatsViewModel = RandomCatsViewModel()
    @State var listViewCats : [RandomCatCellView] = []
    
    var body: some View {
        //Vamos a usar el grid para mostrar las imagenes de los gatos, con scrollView.
        NavigationView {
            List($listViewCats) { cat in
                cat.wrappedValue
            }.onAppear {
                Task {
                    await viewModel.loadListCats()
                    for cat in self.viewModel.listCatRandom {
                        await self.createRandomCatCell(idCatImage: cat.id, informationCat: cat.owner ?? "No tiene")
                            
                    }
                }
            }.listStyle(.plain)
        }.navigationTitle(self.viewModel.titleNavigationBar)
    }
    
    func createRandomCatCell(idCatImage : String?,informationCat : String) async {
        guard let idImage = idCatImage else {
            return
        }
        
        do {
            let imageCat = try await HttpRequest.shared.downloadImage(urlString: self.viewModel.getUrlCatImage(idImageCat: idImage))
            let text = Text(informationCat)
            
            let randomCatCell : RandomCatCellView = RandomCatCellView(imageCat: imageCat,textInformation: text)
            self.$listViewCats.wrappedValue.append(randomCatCell)
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
}

struct RandomCatsView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatsView()
    }
}
