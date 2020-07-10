//
//  SceneDelegate.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(frame: UIScreen.main.bounds)
              window?.windowScene = windowScene
              let cntUserContentList = UserContentListViewController()
              let service = UserContentAPI.init()
              let viewModel = UserContentViewModel.init(content: [], service: service, title: "")
              cntUserContentList.viewModel = viewModel
        
              let nav = UINavigationController.init(rootViewController: cntUserContentList)
               UINavigationBar.appearance().barTintColor = .systemBlue
               UINavigationBar.appearance().tintColor = .black
               UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
               UINavigationBar.appearance().isTranslucent = true

        window?.rootViewController = nav
              window?.makeKeyAndVisible()
    }

    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
    }

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
    }

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
