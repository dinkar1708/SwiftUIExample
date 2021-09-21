//
//  SceneDelegate.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya on 2021/09/21.
//

import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("SceneDelegate sceneWillEnterForeground")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("SceneDelegate sceneDidEnterBackground")
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("SceneDelegate sceneDidBecomeActive")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("SceneDelegate sceneWillResignActive")
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("SceneDelegate sceneDidDisconnect")
    }
}
