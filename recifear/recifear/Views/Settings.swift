//
//  Settings.swift
//  recifear
//
//  Created by aaav on 11/04/23.
//

import Foundation

class Settings: ObservableObject{
    static let shared = Settings()
    @Published var opened = false
    @Published var currentConstruction = ""
}
