//
//  RandomCatsView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-28.
//

import SwiftUI

struct RandomCatsView: View {
    @ObservedObject var viewModel : RandomCatsViewModel
    @State var listViewCats : [RandomCatCellView] = []
    
    init() {
        self.viewModel = RandomCatsViewModel()
    }
    
    var body: some View {
        //Vamos a usar el grid para mostrar las imagenes de los gatos, con scrollView.
        NavigationView {
            List(listViewCats) { catView in
                catView.frame(height:100)
            }
        }.navigationTitle(self.viewModel.titleNavigationBar)
    }
    
    func createRandomCatCell(cat : CatModel) {
        if let urlString = cat.getUrlImageDownload() {
            HttpRequest.shared.downloadImage(urlString: urlString, onSuccess: { image in
                if let ownerTemp = cat.getOwner() {
                    let textTemp = Text(ownerTemp)
                    let randomCatCell = RandomCatCellView(imageCat: image,textOwner: textTemp)
                    self.listViewCats.append(randomCatCell)
                } else {
                    let randomCatCell = RandomCatCellView(imageCat: image)
                    self.listViewCats.append(randomCatCell)
                }
            })
        }
    }
}

struct RandomCatsView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatsView()
    }
}
