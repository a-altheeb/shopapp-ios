//
//  ProductOptionHeaderViewSpec.swift
//  ShopAppTests
//
//  Created by Evgeniy Antonov on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Nimble
import Quick
import ShopApp_Gateway

@testable import ShopApp

class ProductOptionHeaderViewSpec: QuickSpec {
    override func spec() {
        var headerView: ProductOptionHeaderView!
        var collectionView: UICollectionView!
        var optionNameLabel: UILabel!
        
        beforeEach {
            let provider = ProductOptionsCollectionProvider()
            
            collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
            collectionView.registerNibForSupplementaryView(ProductOptionHeaderView.self, of: UICollectionView.elementKindSectionHeader)
            collectionView.dataSource = provider
            
            provider.options = [TestHelper.productOptionWithOneValue]
            collectionView.reloadData()
            
            _ = collectionView.numberOfSections
            
            let indexPath = IndexPath(row: 0, section: 0)
            headerView = provider.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath) as? ProductOptionHeaderView
            
            optionNameLabel = self.findView(withAccessibilityLabel: "label", in: headerView) as? UILabel
        }
        
        describe("when header view configured") {
            let title = "Text"
            
            beforeEach {
                headerView.configure(with: title)
            }
            
            it("should have correct option name label text") {
                let expectedText = String.localizedStringWithFormat("Label.Product.OptionTitle".localizable, title)
                
                expect(optionNameLabel.text) == expectedText
            }
        }
    }
}
