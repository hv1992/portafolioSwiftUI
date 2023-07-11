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
    @State var subRaceDogSeleted : String = ""
    
    
    init() {
        ThemeNavigationBar.navigationBarColors(titleColor: .white, tintColor: .white,backButtonColor: .white)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()
                VStack(spacing: 0.0) {
                    if !viewModel.dogRaceList.isEmpty {
                        VStack {
                            HStack {
                                Text(viewModel.titlePickerRaceDog).foregroundColor(Color.black).padding(.leading)
                                Picker(viewModel.titlePickerRaceDog, selection: $raceMainDogSelected) {
                                    ForEach(viewModel.listMainRaceDog,id: \.self) { race in
                                        Text(race).foregroundColor(Color.white)
                                    }
                                }
                                .onAppear {
                                    subRaceDogSeleted = ""
                                    Task {
                                        viewModel.listMainRaceDog = await viewModel.getListMainRaceDogs()
                                    }
                                    //Se ejecuta cuando existe es cambiado el state asignado para dicho picker
                                }.onChange(of: raceMainDogSelected, perform: { raceMain in
                                    Task {
                                        viewModel.listSubRaceDog = await viewModel.getSubListRaceDogs(mainRace: raceMain)
                                    }
                                })
                            }
                            if !viewModel.listSubRaceDog.isEmpty {
                                HStack {
                                    Text(viewModel.titlePickerSubRaceDog).foregroundColor(Color.black)
                                    Picker(viewModel.titlePickerSubRaceDog,selection: $subRaceDogSeleted) {
                                        ForEach(viewModel.listSubRaceDog,id:\.self) { subRace in
                                            Text(subRace)
                                        }
                                    }.onAppear {
                                        subRaceDogSeleted = ""
                                    }
                                }
                            }
                        }.background(Color.white)
                            .cornerRadius(8)
                        Image("dogIcon").resizable().scaledToFit().padding(.all)
                    } else {
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
            }
        }.navigationTitle(self.viewModel.titleNavigationBar)
    }
}

struct RandomDogView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDogView()
    }
}
