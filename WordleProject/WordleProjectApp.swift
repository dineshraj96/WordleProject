//
//  WordleProjectApp.swift
//  WordleProject
//
//  Created by Dinesh Kumar Raj Kumar on 2022-06-29.
//

import SwiftUI

@main
struct WordleProjectApp: App {
    @StateObject var dm = WorldDataModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
