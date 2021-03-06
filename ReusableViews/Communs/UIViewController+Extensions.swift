//
//  UIViewController+Extensions.swift
//  ReusableViews
//
//  Created by Renato F. dos Santos Jr on 22/05/22.
//

import Foundation
import SwiftUI
import UIKit

extension UIViewController {
    
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(viewController: self)
    }
}
