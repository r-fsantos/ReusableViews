//
//  SceneDelegate.swift
//  ReusableViews
//
//  Created by Renato F. dos Santos Jr on 20/05/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let templateView = TemplateView(frame: UIScreen.main.bounds)
        templateView.configure(imageName: "airplane",
                               titleName: "Mussum Ipsum",
                               descriptionName: "Mussum Ipsum, cacilds vidis litro abertis. Suco de cevadiss deixa as pessoas mais interessantis.A ordem dos tratores não altera o pão duris.Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl.Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.",
                               backgroundImageName: "backgroundImage")
        let title = "Mussundis"
        let viewController = ViewController(title: title, templateView: templateView)
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}

