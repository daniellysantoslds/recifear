////
////  ContentView.swift
////  recifear
////
////  Created by aaav on 22/03/23.
////
//
import SwiftUI
import RealityKit
import ARKit
//
//
//struct ContentView : View {
//    @StateObject var arViewModel : ARViewModel = ARViewModel()
//    @ObservedObject var settings = Settings.shared
//    let buildingInfoViewModel = BuildingInfoViewModel()
//    @State var showBuildingInfo : Bool = true
//    @State var opened : Bool = false
//
//    
//    var body: some View {
//        ZStack(){
//            HStack{
//                // INSTANCIA A VIEW PASSANDO COMO ARGUMENTO O VIEWMODEL, QUE SERÁ O CONTROLADOR
//                ARViewContainer(arViewModel: arViewModel)
//                
//                Spacer()
//                
//                if settings.opened {
//                    BuildingInfoView(buildingInfoModel:
//                                        buildingInfoViewModel.allInfos[settings.currentConstruction] ??
//                                     BuildingInfoModel(bid: "", title: "???", description: "", impact: "", history: ""), opened: $opened)
//                }
//                
//            }
//        }
//    }
//}
//
class Settings: ObservableObject{
    static let shared = Settings()
    @Published var opened = false
    @Published var currentConstruction = ""
//    @Published var shouldOpenHouseView = false
//    @Published var shouldOpenShackView = false
//    @Published var shouldOpenBuildingView = false
//    @Published var shouldOpenStiltHouseView = false
}
//
//// CRIA O VIEW MODEL (QUE CONTROLA O MODEL)
//struct ARViewContainer: UIViewRepresentable {
//
//    var arViewModel : ARViewModel
//
//    // FUNÇÃO PADRÃO DO PROTOCOLO UIVIEWREPRESENTABLE QUE RODA O MÉTODO PRA DAR O DELEGATE PRO VIEWMODEL E RETORNA UMA VIEW
//    func makeUIView(context: Context) -> ARView {
//        arViewModel.startSessionDelegate()
//
//        arViewModel.arView.enableFindOutMore()
//        arViewModel.arView.enableScaleCap()
//
//        return arViewModel.arView
//    }
//
//    // TENHO QUE VER AINDA COMO USAR ISSO MELHOR
//    func updateUIView(_ uiView: ARView, context: Context) {
//
//    }
//}
//
//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
