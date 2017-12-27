//
//  CartEmptyDataView.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 12/12/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

protocol CartEmptyDataViewProtocol {
    func didTapStartShopping()
}

class CartEmptyDataView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emptyCartLabel: UILabel!
    @IBOutlet weak var startShoppingButton: UIButton!
    
    var delegate: CartEmptyDataViewProtocol!
    
    // MARK: - init
    init(frame: CGRect, delegate: CartEmptyDataViewProtocol) {
        super.init(frame: frame)
        
        self.delegate = delegate
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: CartEmptyDataView.self), owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupViews()
    }
    
    private func setupViews() {
        emptyCartLabel?.text = NSLocalizedString("Label.YourCartIsEmpty", comment: String())
        startShoppingButton.setTitle(NSLocalizedString("Button.StartShopping", comment: String()).uppercased(), for: .normal)
    }
    
    // MARK: - actions
    @IBAction func startShoppingTapped(_ sender: UIButton) {
        delegate.didTapStartShopping()
    }
}