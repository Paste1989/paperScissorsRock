//
//  GestureModel.swift
//  paperScissorsRock
//
//  Created by GaussUser on 08.12.2017..
//  Copyright © 2017. GaussUser. All rights reserved.
//

import Foundation
import UIKit

enum HandGesutre
{
    case rock
    case paper
    case scissor
    
    var signName: String
    {
        switch self
        {
        case .rock: return "Rock"
        case .paper: return "paper"
        case .scissor: return "scissor"
        }
    }
    
    var signImage: UIImage
    {
        switch self
        {
        case .rock: return #imageLiteral(resourceName: "rock1")
        case .paper: return #imageLiteral(resourceName: "paper")
        case .scissor: return #imageLiteral(resourceName: "scissors")
        }
    }

    func getResult(secondGesture sing: HandGesutre) -> GameResult
    {
        switch self {
            
        case .rock:
            switch sing
            {
            case .rock: return .draw
            case .paper: return .lose
            case .scissor: return .win
            }
            
        case .paper:
            switch sing
            {
            case .rock: return .win
            case .paper: return .draw
            case .scissor: return .lose
            }
            
        case .scissor:
            switch sing
            {
            case .rock: return .lose
            case .paper: return .win
            case .scissor: return .draw
            }
        }
    }
}

enum GameResult: String
{
    case draw = "draw"
    case win = "win"
    case lose = "lose"
}
