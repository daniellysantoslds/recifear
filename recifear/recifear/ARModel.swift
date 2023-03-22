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
        configuration.maximumNumberOfTrackedImages = 20
        
        arView.session.run(configuration)
    }
    
    
    // ENCONTRA AS IMAGENS NA CÂMERA
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
                modelEntity.name = "casa"
            }
            if(imageAnchor.name)! == "rey"{
                modelEntity = ModelEntity(mesh: MeshResource.generateBox(size: 2))
                modelEntity.name = "rey"
            }
            if (imageAnchor.name)! == "bigbang"{
                modelEntity = try! ModelEntity.loadModel(named: "mundo.usdz")
                modelEntity.name = "bigbang"
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
//        construction.transform.scale = construction.transform.scale * 0.01
        construction.transform.scale = SIMD3<Float>(0.0001, 0.0001, 0.0001)
    
        
        // SITUA O OBJETO 3D NO ESPAÇO EM RELAÇÃO À ÂNCORA
        construction.setPosition(SIMD3(x: 0, y: 0, z: 0), relativeTo: imageAnchorEntity)
        
        arView.installGestures([.all], for: construction)

        // FUNÇÕES QUE ADICIONAM DE FATO NA CENA
        imageAnchorEntity.addChild(construction)
    
        arView.scene.addAnchor(imageAnchorEntity)

        construction.generateCollisionShapes(recursive: true)
        arView.installGestures([.rotation, .scale], for: construction)
        
    }
    
    func printAnchors(){
        for anchor in arView.scene.anchors{
            for children in anchor.children{
                print(children.name)
//                print(children)
                print("____")

            }
        }
    }
    
}
