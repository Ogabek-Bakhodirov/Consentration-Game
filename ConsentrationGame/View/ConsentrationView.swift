//
//  ConsentrationView.swift
//  ConsentrationGame
//
//  Created by Ogabek Bakhodirov on 10/12/22.
//

import UIKit

class ConsentrationView: UIView{
    
    var game: Consentration!
        
    var emojiesArray = [String]()
    
    var onAction: ((Int, Int) -> ())?
    
    var flipper = UILabel()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var flipCount = 0 { didSet { flipper.text = "Flip count: \(flipCount)" } }
    
    init(frame: CGRect, model game: Consentration, emojiesArray: [String]) {
        super .init(frame: frame)
        self.game = game
        self.emojiesArray = emojiesArray.shuffled()
        initViews()
    }
    
    private func initViews(){
        setFlipCounter()
        setCollection()
    }
    
    private func setFlipCounter(){
        flipper = UILabel(frame: CGRect(x: universalWidth(20), y: 60, width: windowWidth - universalWidth(40), height: universalHeight(18)))
        flipper.text = "Flip count: 0"
        flipper.textColor = .black
        flipper.font = .systemFont(ofSize: 18, weight: .semibold)
        flipper.textAlignment = .center
        self.addSubview(flipper)
    }
    
    private func setCollection(){
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: universalWidth(75), height: universalWidth(100))
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect(x: universalWidth(20), y: flipper.frame.maxY + 30, width: windowWidth - universalWidth(40), height: windowHeight - 90), collectionViewLayout: layout)
        collectionView.register(ConsentrationCollectionCell.self, forCellWithReuseIdentifier: "ConsentrationCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        self.addSubview(collectionView)
    }
    
    func updateCollection(){
        if  self.collectionView.isDescendant(of: self){
            self.collectionView.removeFromSuperview()
            setCollection()
        } else {
            setCollection()
        }
    }
    
    private func emojiFactory(cards: Cards) -> String {
        let emoji = emojiesArray[cards.identifier-1]
        return emoji
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ConsentrationView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.game.cards.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsentrationCollectionCell", for: indexPath) as? ConsentrationCollectionCell else { return UICollectionViewCell() }
        
        cell.setUI(cardModel: self.game.cards[indexPath.row], emoji: emojiFactory(cards: self.game.cards[indexPath.row]))
        cell.sendCardIdentifier = { cardIdentifier in
            self.onAction?(cardIdentifier ?? 0, indexPath.row)
        }
        return cell
    }
}
