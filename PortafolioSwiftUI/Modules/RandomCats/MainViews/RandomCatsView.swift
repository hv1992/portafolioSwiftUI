//
//  RandomCatsView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-06-28.
//

import SwiftUI

struct RandomCatsView: View {
    @ObservedObject var viewModel : RandomCatsViewModel = RandomCatsViewModel()
    @State var listViewCats : [RandomCatCellView] = [] //Cuando se pune @State, no es necesario agregar $ cuando se puede usar dicha variable, ya que al colocar @State, ya se considera de que el swiftUI está al tanto del cambio de valor del mismo.
    
    var body: some View {
        NavigationView {
            if listViewCats.isEmpty {
                ProgressView(self.viewModel.titleProgressView).progressViewStyle(.circular)
                    .onAppear {
                        Task { // El Task sirve para ejecutar una instrucción asincrona, que para este caso, se hace llamar el listado de gatos.
                            
                            //Para entender mejor de los await, es necasario entender que son los actores, y funciones asincronas.
                            await viewModel.loadListCats()
                            for cat in self.viewModel.listCatRandom {
                                await self.createRandomCatCell(idCatImage: cat.id, informationCat: cat.getOwner())
                            }
                        }
                    }
            } else {
                //Esto codigo se usa en vez de usar el List, porque el List no se puede quitar el separador en ios 14, o por lo menos no encontré la forma.
                ScrollView {
                    LazyVStack { //Usa LazyStack, porque se crea el stack solamente si va a ser usado.
                        ForEach(listViewCats) { cat in
                            cat
                        }
                    }.padding(.leading).padding(.trailing)
                }
            }
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
            self.listViewCats.append(randomCatCell)
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
