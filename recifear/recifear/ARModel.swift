//
//  ARModel.swift
//  recifear
//
//  Created by aaav on 22/03/23.
//

import Foundation
import RealityKit
import ARKit

struct ARModel{
    
    private(set) var arView : ARView
    
    var imageRecognizedVar = false
    
    // INICIALIZA O MODEL, ASSIM QUE INSTANCIADO
    init() {
        arView = ARView(frame: .zero)
        
        // PEGA TODAS AS IMAGENS DAS PASTA RESOURCES QUE SERVIRÃO DE ÂNCORA
        guard let trackerImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        // CONFIGURA A REALITADE AUMENTADA PARA IDENTIFICAR IMAGENS 2D NO ESPAÇO
        let configuration = ARImageTrackingConfiguration()
        configuration.trackingImages = trackerImages
        configuration.maximumNumberOfTrackedImages = 4
        
        arView.session.run(configuration)
    }
    
    
    // ENCONTRA AS IMAGENS NA CÂMERA E FAZ ALGO COM ELAS
    mutating func imageRecognized(anchors: [ARAnchor]) {
        
        // PEGA TODAS AS IMAGENS DA CENA E ANCORA NUM LUGAR
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        // PEGA AS ÂNCORAS (TIPO AS COORDENADAS)
        for anchor in anchors {
            
            guard let imageAnchor = anchor as? ARImageAnchor else { return }
            
            var modelEntity = ModelEntity()
            
            // CRIA O OBJETO 3D
            if (imageAnchor.name)! == "casa"{
                modelEntity = try! ModelEntity.loadModel(named: "casa3.usdz")
            }
            if (imageAnchor.name)! == "bigbang"{
                modelEntity = try! ModelEntity.loadModel(named: "mundo.usdz")
            }
            
            imageRecognizedVar = true
            
            // COLOCA O OBJETO EM CIMA DA ÂNCORA
            placeConstruction(construction: modelEntity, imageAnchor: imageAnchor)

        }
    }
    
    // COLOCA O OBJETO EM CIMA DA ÂNCORA
    func placeConstruction(construction: ModelEntity, imageAnchor: ARImageAnchor){
        
        let imageAnchorEntity = AnchorEntity(anchor: imageAnchor)
       
        // PODE MEXER NA ESCALA DO OBJETO 3D
        construction.transform.scale = construction.transform.scale * 1
        
        
        // SITUA O OBJETO 3D NO ESPAÇO EM RELAÇÃO À ÂNCORA
        construction.setPosition(SIMD3(x: 0, y: 0, z: 0), relativeTo: imageAnchorEntity)
        
        
        // FUNÇÕES QUE ADICIONAM DE FATO NA CENA
        imageAnchorEntity.addChild(construction)
        arView.scene.addAnchor(imageAnchorEntity)
        
    }
    
}
