//
//  ConcentrationController.swift
//  ConsentrationGame
//
//  Created by Ogabek Bakhodirov on 23/11/22.
//

import UIKit

class ConcentrationController: UIViewController {
    
    private var emojiChoices = ["😍", "🤩", "😇", "🥹", "😎", "🥸", "😁", "🫠", "🥶", "❤️"] 
    
    private lazy var game = Consentration(numberOfPairsOfCards: emojiChoices.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setConcentrationView()
    }
    
    private func setConcentrationView(){
        self.game = Consentration(numberOfPairsOfCards: emojiChoices.count)
        var concentrationView = ConsentrationView(frame: self.view.bounds, model: self.game, emojiesArray: emojiChoices)
        concentrationView.onAction = { buttonIdentifier, buttonIndex in
            concentrationView.flipCount += 1
            self.game.chooseCard(at: buttonIndex ?? 0)
            if self.game.gameStatusChecker(cards: self.game.cards) {
                self.showAlert(view: concentrationView)
            }
            concentrationView.updateCollection()
        }
        self.view.addSubview(concentrationView)
    }
    
    private func showAlert(view: UIView){
        let uiAlert = UIAlertController(title: "Congratulations🎉", message: "If you want to replay the game, please tap the button.", preferredStyle: UIAlertController.Style.alert)
        uiAlert.addAction(UIAlertAction(title: "Replay", style: UIAlertAction.Style.default){ _ in 
            self.replayGame(concentrationView: view)
        }) 
        self.present(uiAlert, animated: true)
    }
    
    private func replayGame(concentrationView: UIView){        
        for index in self.game.cards.indices {
            self.game.cards[index].isMatched = false
            self.game.cards[index].isFaceUp = false
        }
        concentrationView.removeFromSuperview()
        setConcentrationView()
    }
}
