//
//  RandomDogView.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2023-07-07.
//

import SwiftUI

struct RandomDogView: View {
    
    @ObservedObject var viewModel : RandomDogViewModel = RandomDogViewModel()
    @State var raceMainDogSelected : String = ""
    @State var subRaceDogSelected : String = ""
    @State var imageDog : Image?
    @State var progressLoadDogPowerOn : Bool = false
    
    
    init() {
        ThemeNavigationBar.navigationBarColors(titleColor: .white, tintColor: .white,backButtonColor: .white)
    }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.8).ignoresSafeArea()
            VStack { //Este Stack es para llevar al selector para arriba
                VStack(spacing: 0.0) {
                    if !viewModel.dogRaceList.isEmpty {
                        //MARK: Bloque de selector de raza.
                        VStack { //Este stack contiene la el bloque de configurar obtener imagen del perro
                            HStack {
                                Text(viewModel.titlePickerRaceDog).foregroundColor(Color.black).padding(.leading)
                                Picker(viewModel.titlePickerRaceDog, selection: $raceMainDogSelected) {
                                    ForEach(viewModel.listMainRaceDog,id: \.self) { race in
                                        Text(race).foregroundColor(Color.white)
                                    }
                                }
                                .onAppear {
                                    subRaceDogSelected = ""
                                    Task {
                                        viewModel.listMainRaceDog = await viewModel.getListMainRaceDogs()
                                        raceMainDogSelected = viewModel.listMainRaceDog.first ?? ""
                                    }
                                    //Se ejecuta cuando existe es cambiado el state asignado para dicho picker
                                }.onChange(of: raceMainDogSelected, perform: { raceMain in
                                    Task {
                                        viewModel.listSubRaceDog = await viewModel.getSubListRaceDogs(mainRace: raceMain)
                                        subRaceDogSelected = viewModel.listSubRaceDog.first ?? ""
                                    }
                                })
                            }
                            if !viewModel.listSubRaceDog.isEmpty {
                                HStack {
                                    Text(viewModel.titlePickerSubRaceDog).foregroundColor(Color.black)
                                    Picker(viewModel.titlePickerSubRaceDog,selection: $subRaceDogSelected) {
                                        ForEach(viewModel.listSubRaceDog,id:\.self) { subRace in
                                            Text(subRace)
                                        }
                                    }.onAppear {
                                        subRaceDogSelected = ""
                                    }
                                }
                            }
                            Button {
                                //MARK: Hacemos la llamada para obtener la imagen del perro
                                Task {
                                    await self.getImageDog(raceDog: raceMainDogSelected, subRaceDog: subRaceDogSelected)
                                }
                                
                            } label: {
                                //Aqui se pone aparte el titulo para el boton, ya que necesitamos que haga espaciado dentro del botón.
                                Text(viewModel.titleButtonLoadImageDog).padding(.all,8.0)
                            }
                            .background(Color.blue.opacity(0.8).ignoresSafeArea())
                            .cornerRadius(8)
                            .foregroundColor(Color.white)
                            Spacer().frame(height:16)
                        }.background(Color.white)
                            .cornerRadius(8)
                        //MARK: Imagen del perro.
                        if progressLoadDogPowerOn {
                            Spacer().frame(height: 100)
                            ProgressView(viewModel.titleProgressViewLoadDog).progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                                .foregroundColor(Color.white)
                        } else {
                            imageDog?.resizable().scaledToFit().padding(.all).cornerRadius(8)
                        }
                    } else {
                        //MARK: Ventana de espera de obtensión de la imagen del perro
                        ZStack {
                            Color.blue.opacity(0.8).ignoresSafeArea()
                            ProgressView(self.viewModel.titleProgressLoadRaceDogs).progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                                .foregroundColor(.white)
                                .onAppear {
                                    Task {
                                        await viewModel.loadDogRaces()
                                    }
                                }
                        }
                    }
                }
                Spacer()
            }
        }.navigationTitle(self.viewModel.titleNavigationBar)
    }
    
    //MARK: La llamada para obtener la imagen del perro
    func getImageDog(raceDog : String,subRaceDog : String) async {
        do {
            progressLoadDogPowerOn.toggle()
            let urlDogImage = await viewModel.getUrlImageDog(raceDog: raceDog,subRaceDog: subRaceDog)
            if let urlImage = urlDogImage {
                self.imageDog = try await HttpRequest.shared.downloadImage(urlString: urlImage)
                if self.imageDog != nil {
                    progressLoadDogPowerOn.toggle()
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

struct RandomDogView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDogView()
    }
}
