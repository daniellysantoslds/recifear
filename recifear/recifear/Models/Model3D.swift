//
//  Model3D.swift
//  recifear
//
//  Created by aaav on 12/04/23.
//

import UIKit
import RealityKit
import Combine

class Model3D {
    var modelName : String
    var modelEntity : ModelEntity?
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                //error
                print("debug: unable to load model entity \(self.modelName)")
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("debug: loaded \(self.modelName)")
            })
        
    }
    
}
