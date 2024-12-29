//
//  ViewController.swift
//  RandomDoor
//
//  Created by Даниил Сивожелезов on 29.12.2024.
//

import UIKit

class GameViewController: UIViewController {

    private var coordinator: AppCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator = AppCoordinator(controller: self)
        
        coordinator.setEnvironment()
    }
}

