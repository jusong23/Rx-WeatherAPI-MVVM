//
//  SceneDelegate.swift
//  GangNamRoad+MVVM
//
//  Created by mobile on 2023/02/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let viewController = ViewController(viewModel: RootViewModel(weatherService: WeatherService()))
        let navigationController = UINavigationController(rootViewController: viewController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        let addWigetURL: String = "addWiget"

        guard let url = URLContexts.first?.url,
              let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }

        print("url: \(url)")
        print("addWigetURL: \(addWigetURL)")
        
        if addWigetURL == urlComponents.path {

            print("addWigetURL: \(addWigetURL)")
            guard let registerWidgetViewController = UIStoryboard(name: "RegisterWidgetViewController", bundle: nil).instantiateViewController(withIdentifier: "RegisterWidgetViewController") as? RegisterWidgetViewController else { return }

            registerWidgetViewController.modalPresentationStyle = .overFullScreen
            window?.rootViewController?.present(registerWidgetViewController, animated: true, completion: nil)
        }

    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

