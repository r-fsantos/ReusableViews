//
//  TemplateView.swift
//  ReusableViews
//
//  Created by Renato F. dos Santos Jr on 20/05/22.
//

import Foundation
import UIKit


// TODO: This enum should be nested :)
enum TemplateViewConstants {
    static let nextButtonHeight: CGFloat = 50.0
    static let buttonSpacing: CGFloat = 16.0
}


final class TemplateView: UIView {
    
    private lazy var selfieImageView: UIImageView = {
        let selfie = UIImageView(frame: .zero)
        selfie.contentMode = .scaleToFill
        selfie.translatesAutoresizingMaskIntoConstraints = false
        return selfie
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let background = UIImageView(frame: .zero)
        background.contentMode = .scaleAspectFit
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
        description.minimumScaleFactor = 0.7
        description.adjustsFontSizeToFitWidth = true
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private lazy var contentStackView: UIStackView = {
        let content = UIStackView(frame: .zero)
        content.axis = .vertical
        content.alignment = .center
        content.spacing = 0.0
        content.distribution = .fillProportionally
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var footerStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 5.0 // TODO: should be mapped on TemplateViewConstants
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nextButton: UIButton = {
        let next = UIButton(type: .system)
        next.backgroundColor = .purple
        next.layer.cornerRadius = 16.0 // TODO: Calculate this
        next.setTitle("Próximo, por favor!", for: .normal)
        next.translatesAutoresizingMaskIntoConstraints = false
        return next
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageName: String,
                   titleName: String,
                   descriptionName: String,
                   backgroundImageName: String) {
        setSelfieImage(imageName)
        setTitle(titleName)
        setDescription(descriptionName)
        setBackgroundImage(backgroundImageName)
        setupViewCode()
    }
    
    private func setSelfieImage(_ imageName: String) {
        // TODO: Refactor from imageName to named
        selfieImageView.setDimensions(width: 100, height: 100)
        selfieImageView.image = UIImage(systemName: imageName)
    }
    
    private func setBackgroundImage(_ imageName: String) {
        backgroundImageView.image = UIImage(named: imageName)
    }
    
    private func setTitle(_ titleName: String) {
        titleLabel.text = titleName
    }
    
    private func setDescription(_ descriptionName: String){
        descriptionLabel.text = descriptionName
    }
}

extension TemplateView: ViewCode {
    
    func configureViews() {
        backgroundColor = .white
    }
    
    func buildHierarchy() {
        
        addSubview(backgroundImageView)
        addSubview(contentStackView)
        addSubview(footerStackView)
        
        contentStackView.addArrangedSubview(selfieImageView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        
        footerStackView.addArrangedSubview(nextButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                     constant: frame.size.height * 0.3),
            backgroundImageView.widthAnchor.constraint(equalTo: widthAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: footerStackView.topAnchor),
            

            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                  constant: frame.size.height * 0.1),
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: footerStackView.topAnchor,
                                                     constant: -frame.size.height * 0.4),

            footerStackView.widthAnchor.constraint(equalTo: widthAnchor),
            
            footerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            nextButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                constant: TemplateViewConstants.buttonSpacing),
            
            nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                 constant: -TemplateViewConstants.buttonSpacing),
            
            nextButton.heightAnchor.constraint(equalToConstant: TemplateViewConstants.nextButtonHeight)
        ])
    }
}
