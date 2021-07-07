//
//  GameViewController.swift
//  Snake4
//
//  Created by Dmitry on 11/04/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // создаем экземпляр сцены
        let scene = GameScene(size: view.bounds.size)
        // получаем главную область экрана
        let skView = view as! SKView
        // включаем отображение fps (количество кадров в секунду)
        skView.showsFPS = true
        // показывать количество объектов на экране
        skView.showsNodeCount = true
        // включаем произвольный порядок рендеринга объектов в узле
        skView.ignoresSiblingOrder = true
        // режим отображения сцены, растягивается на все доступное пространство
        scene.scaleMode = .resizeFill
        // добавляем сцену на экран
        skView.presentScene(scene)
    }
}
