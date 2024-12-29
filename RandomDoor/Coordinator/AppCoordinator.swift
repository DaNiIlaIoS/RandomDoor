//
//  AppCoordinator.swift
//  RandomDoor
//
//  Created by Даниил Сивожелезов on 29.12.2024.
//

import UIKit

final class AppCoordinator {
    private weak var controller: UIViewController?
    let view: UIView?
    
    private let ui = GameUI()
    private let engine = GameEngine()
    
    lazy var leftDoor = ui.leftDoor
    lazy var rightDoor = ui.rightDoor
    
    init(controller: UIViewController? = nil) {
        self.controller = controller
        self.view = controller?.view
    }
    
    func setEnvironment() {
        guard let view else { return }
        
        [ui.background, ui.recordLabel, ui.recordValue, ui.mainStack, ui.doorsView].forEach { view.addSubview($0) }
        
        ui.recordLabel.frame = CGRect(x: 30, y: 80, width: 150, height: 40)
        ui.recordValue.frame = CGRect(x: 180, y: 80, width: 60, height: 40)
        ui.recordValue.text = "\(engine.record)"
        
        ui.mainStack.center.x = view.center.x
        ui.mainStack.center.y = view.center.y - 80
        
        rightDoor.frame.origin.x = ui.doorsView.frame.width - 126
        ui.doorsView.center.y = view.center.y + 100
        ui.doorsView.center.x = view.center.x
        
        setInteraction()
    }
    
    func setInteraction() {
        leftDoor.addTarget(self, action: #selector(selectedDoor), for: .touchUpInside)
        rightDoor.addTarget(self, action: #selector(selectedDoor), for: .touchUpInside)
    }
    
    @objc private func selectedDoor(_ sender: UIButton) {
        let side = sender.tag == 1 ? false : true
        
        if engine.checkAnswer(side) {
            ui.selectLabel.text = ui.correctLabel.text
            ui.selectLabel.textColor = ui.correctLabel.textColor
        } else {
            ui.selectLabel.text = ui.inCorrectLabel.text
            ui.selectLabel.textColor = ui.inCorrectLabel.textColor
        }
        
        ui.scoreValue.text = "\(engine.score)"
        ui.recordValue.text = "\(engine.record)"
        ui.scoreDescriptionLabel.text = createDescription(score: engine.score)
    }
    
    func createDescription(score: Int) -> String {
        switch score {
        case 5: "Excellent!"
        case 10: "Are you psychic?"
        case 15: "Call an exorcist!"
        case 20: "They've already come for you!"
        default: ""
        }
    }
}
