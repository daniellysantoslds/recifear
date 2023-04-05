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
            Color("background").ignoresSafeArea()
            VStack(spacing: 16) {
                
                HStack{
                    Button {
                        opened = false
                    } label: {
                        HStack{
                            Image(systemName: "multiply.square.fill")
                            Text("Fechar")
                        }.foregroundColor(Color("accent"))
                    }
                    Spacer()
                }
                
                HStack {
                    Text(buildingInfoModel.title)
//                        .font(.largeTitle)
                        .font(.custom("ObviouslyVar-WideSmBd", size: 40)).foregroundColor(Color("primary"))
                    Spacer()
                }
                
                HStack {
                    Text(buildingInfoModel.description)
                        .multilineTextAlignment(.leading)
                        .font(.custom("ObviouslyVar-Reg", size: 20)).foregroundColor(Color("primary"))
                    Spacer()
                }
                Spacer()
                HStack {
                    LargeButton(title: "Impacto",
                                icon: impactBool ? Image(systemName : "arrowtriangle.down.fill") : Image(systemName:"arrowtriangle.forward.fill"),
                                action: {
                        impactBool.toggle()
                        historyBool = false})
                    Spacer()
                }

                if impactBool == true {
                    HStack {
                        Text(buildingInfoModel.impact)
                            .multilineTextAlignment(.leading)
                            .font(.custom("ObviouslyVar-Reg", size: 15)).foregroundColor(Color("primary"))
                        Spacer()
                    }
                }
                
                HStack {
                    LargeButton(title: "História do Recife",
                                icon: historyBool ? Image(systemName : "arrowtriangle.down.fill") : Image(systemName:"arrowtriangle.forward.fill"),
                                action: {
                        historyBool.toggle()
                        impactBool = false})
                    Spacer()
                }
                
                if historyBool{
                    HStack {
                        Text(buildingInfoModel.history)
                            .multilineTextAlignment(.leading)
                            .font(.custom("ObviouslyVar-Reg", size: 15)).foregroundColor(Color("primary"))

                        Spacer()
                    }
                }
            }
            .padding(61)
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
