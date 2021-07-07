//
//  SnakeHead.swift
//  Snake1
//
//  Created by Dmitry on 14/04/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        self.physicsBody?.categoryBitMask = CollisionCategories.SnakeHead
        
        self.physicsBody?.contactTestBitMask = CollisionCategories.Apple | CollisionCategories.EdgeBody | CollisionCategories.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(color:) has not been implemented")
    }
}
