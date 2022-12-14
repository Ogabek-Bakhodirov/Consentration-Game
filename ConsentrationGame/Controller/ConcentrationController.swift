//
//  ConcentrationController.swift
//  ConsentrationGame
//
//  Created by Ogabek Bakhodirov on 23/11/22.
//

import UIKit

class ConcentrationController: UIViewController {
    
    var emojiChoices = ["😍", "🤩", "😇", "🥹", "😎", "🥸", "😁", "🫠", "🥶", "❤️"]
    
    lazy var game = Consentration(numberOfPairsOfCards: emojiChoices.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    func setUI(){
        
        var concentrationView = ConsentrationView(frame: self.view.bounds, model: game, emojiesArray: emojiChoices)
        concentrationView.onAction = { buttonIdentifier, buttonIndex in
            concentrationView.flipCount += 1
            self.game.chooseCard(at: buttonIndex ?? 0)
            concentrationView.updateCollection()
        }
        self.view.addSubview(concentrationView)
    }
}
