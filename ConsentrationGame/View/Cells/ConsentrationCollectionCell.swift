//
//  ConsentrationCollectionCell.swift
//  ConsentrationGame
//
//  Created by Ogabek Bakhodirov on 11/12/22.
//

import UIKit

class ConsentrationCollectionCell: UICollectionViewCell {
    
    private var cardModel: Cards?
            
    var sendCardIdentifier: ((Int?) -> ())?
    
    private var card = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    func setUI(cardModel: Cards, emoji: String) {
                
        self.cardModel = cardModel
        
        let cardView = UIView(frame: contentView.bounds)
        cardView.backgroundColor = .clear
        self.contentView.addSubview(cardView)
        
        card = UIButton(frame: cardView.bounds)
        
        if cardModel.isFaceUp && cardModel.isMatched {
            card.setTitle("", for: .normal)
            card.backgroundColor = .clear
        } else if cardModel.isFaceUp && !cardModel.isMatched {
            card.setTitle(cardModel.isFaceUp ? emoji : "", for: .normal)
            card.backgroundColor = .orange
        } else if !cardModel.isFaceUp && !cardModel.isMatched {
            card.backgroundColor = .black
        }
        
        card.titleLabel?.font = .systemFont(ofSize: 50)
        card.layer.cornerRadius = 10
        card.isEnabled = !cardModel.isMatched
        card.addTarget(self, action: #selector(cardTapped), for: .touchUpInside)        
        cardView.addSubview(card)
    }
    
    @objc func cardTapped() {
        self.sendCardIdentifier?(cardModel?.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
