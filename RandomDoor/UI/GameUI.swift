//
//  GameUI.swift
//  RandomDoor
//
//  Created by Даниил Сивожелезов on 29.12.2024.
//

import UIKit

final class GameUI {
    let bounce: CGRect
    
    init() {
        self.bounce = UIScreen.main.bounds
    }
    
    // MARK: - Background
    lazy var background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bg
        imageView.frame = bounce
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Doors
    
    lazy var leftDoor = createDoor(openImage: .firstDoorClose, closedImage: .firstDoorOpen, tag: 1)
    lazy var rightDoor = createDoor(openImage: .secondDoorClose, closedImage: .secondDoorOpen, tag: 2)
    
    lazy var doorsView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: bounce.width - 60, height: 140)))
        view.addSubview(leftDoor)
        view.addSubview(rightDoor)
        return view
    }()
    
    private func createDoor(openImage: UIImage, closedImage: UIImage, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 126, height: 140)))
        button.tag = tag
        button.setBackgroundImage(openImage, for: .normal)
        button.setBackgroundImage(closedImage, for: .highlighted)
        return button
    }
    
    // MARK: - Labels
    
    lazy var recordLabel = createGameLabel(text: "Record:", color: .black, fontSize: 30)
    lazy var recordValue = createGameLabel(text: "0", color: .black, fontSize: 30)
    lazy var correctLabel = createGameLabel(text: "Correct!", color: .appGreen)
    lazy var inCorrectLabel = createGameLabel(text: "Incorrect!", color: .appRed)
    lazy var selectLabel = createGameLabel(text: "Select a door...")
    lazy var scoreLabel = createGameLabel(text: "Score:", fontSize: 40)
    lazy var scoreValue = createGameLabel(text: "0", fontSize: 40)
    lazy var scoreDescriptionLabel = createGameLabel(text: "")
    
    private func createGameLabel(text: String, color: UIColor = .white, fontSize: CGFloat = 20) -> UILabel {
        let label = UILabel()
        label.setMinecraftFont(size: fontSize)
        label.numberOfLines = 0
        label.textColor = color
        label.text = text
        return label
    }
    
    // MARK: - Stacks
    private lazy var scoreResultStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [UIView(), scoreLabel, scoreValue, UIView()])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var scoreStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [selectLabel, scoreResultStack])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [scoreStack, scoreDescriptionLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 40
        stack.frame = CGRect(origin: .zero, size: CGSize(width: bounce.width, height: 140))
        return stack
    }()
}
