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
                modelEntity = try! ModelEntity.loadModel(named: "Predio.usdz")
                modelEntity.name = "casa"
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

        // INSTALA POSSIBILIDADE DE MUDAR O TAMANHO E ROTACIONAR
        construction.generateCollisionShapes(recursive: true)
        arView.installGestures([.scale, .rotation], for: construction)
            .forEach{ gestureRecognizer in
                gestureRecognizer.addTarget(self.arView, action: #selector(arView.capScale(_:)))
        }
        
        // FUNÇÕES QUE ADICIONAM DE FATO NA CENA
        imageAnchorEntity.addChild(construction)
        arView.scene.addAnchor(imageAnchorEntity)
    }
    
}

extension ARView {
    
    func enableFindOutMore(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer){
        let tapLocation = recognizer.location(in: self)
        
        if let entity = self.entity(at: tapLocation) as? ModelEntity{
            if entity.name == "casa"{
                print(entity.name)
                Settings.shared.shouldOpenHouseView.toggle()
                
            } else if entity.name == "bigbang" {
                print(entity.name)
                Settings.shared.shouldOpenBigBangView.toggle()

            } else if entity.name == "rey" {
                print(entity.name)
                Settings.shared.shouldOpenBigBangView.toggle()

            }
        }
    }
    
    func enableScaleCap(){
        let scaleGestureRecognizer = EntityScaleGestureRecognizer(target: self, action: #selector(capScale(_:)))
    }
    
    @objc func capScale(_ recognizer: EntityScaleGestureRecognizer){
        
        print((recognizer.entity?.scale.x)!)
        
        if (recognizer.entity?.scale.x)! > 0.00015 {
            recognizer.entity?.transform.scale = SIMD3<Float>(0.00015, 0.00015, 0.00015)
        }
        if (recognizer.entity?.scale.x)! < 0.00005 {
            recognizer.entity?.transform.scale = SIMD3<Float>(0.00005, 0.00005, 0.00005)
        }
    }
}
