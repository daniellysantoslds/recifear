//
//  BuildingInfoView.swift
//  recifear
//
//  Created by aaav on 03/04/23.
//

import SwiftUI

struct BuildingInfoView: View {
    @State var impactBool : Bool = false
    @State var historyBool : Bool = false
    
    var buildingInfoModel : BuildingInfoModel
    @Binding var opened : Bool
    
    var body: some View {
        
        ZStack{
            Color.green.ignoresSafeArea()
            VStack{
                
                Button("Fechar"){
                    opened = false
                }
                
                Text(buildingInfoModel.title)
                Text(buildingInfoModel.description)
                
                
                LargeButton(title: "Impacto", icon: Image(systemName:"play.fill")  , action: {
                    print("ALO");
                    impactBool.toggle()
                    historyBool = false
                }
                );

                
                Text(impactBool ?  buildingInfoModel.impact : "")
                
                LargeButton(title: "História do Recife", icon: Image(systemName:"play.fill")  , action: {
                    print("ALO");
                    historyBool.toggle()
                    impactBool = false
                }
                );
                
                
                Text(historyBool ?  buildingInfoModel.history : "")
                
            }
        }
        .frame(maxWidth: 456)
        
    }
}




struct DummyView : View {
    
    @State var showBuildingInfo = false
    let buildingInfoViewModel = BuildingInfoViewModel()
    @State var buildingInfoModel = BuildingInfoModel(bid: "", title: "???", description: "", impact: "", history: "")
    
    var body: some View{
        HStack {
            Spacer()
            VStack{
                Spacer()
                Button("predio"){
                    buildingInfoModel = buildingInfoViewModel.selectBuildingInfo(building: "predio")
                        showBuildingInfo = true
                }
                Spacer()
                Button("palafita"){
                    buildingInfoModel = buildingInfoViewModel.selectBuildingInfo(building: "palafita")
                        showBuildingInfo = true
                }
                Spacer()
                Button("historico"){
                    buildingInfoModel = buildingInfoViewModel.selectBuildingInfo(building: "historico")
                        showBuildingInfo = true
                    
                }
                Spacer()
                Button("barraco"){
                    buildingInfoModel = buildingInfoViewModel.selectBuildingInfo(building: "barraco")
                        showBuildingInfo = true
                }
                Spacer()
            }
            Spacer()
            if showBuildingInfo == true {
                BuildingInfoView(buildingInfoModel: buildingInfoModel, opened: $showBuildingInfo)
            }
        }
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}

//struct BuildingInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildingInfoView()
//    }
//}
