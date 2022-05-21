//
//  ViewController.swift
//  ReusableViews
//
//  Created by Renato F. dos Santos Jr on 20/05/22.
//

import UIKit

final class ViewController: UIViewController {

    private var templateView: TemplateView

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = templateView
    }
    
    
    init(title: String, templateView: TemplateView) {
        self.templateView = templateView
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
