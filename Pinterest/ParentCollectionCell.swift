//
//  ParentCollectionCell.swift
//  Pinterest
//
//  Created by Yuchen Nie on 3/15/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ParentCollectionCell: UICollectionViewCell {
  static let reuseID = "ParentCollectionCellReuseID"
  
  private lazy var label: UILabel = {
    let label = UILabel(frame: .zero)
    label.textColor = UIColor.whiteColor()
    label.text = "some label"
    self.contentView.addSubview(label)
    return label
  }()
  
  private lazy var openAllviewLabel:UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "Title Label"
    label.textColor = UIColor.grayColor()
    self.openAllView.addSubview(label)
    return label
  }()
  
  private lazy var openAllView:UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 0.55)
    let tap = UITapGestureRecognizer(target: self, action: "openNewView")
    tap.numberOfTapsRequired = 1
    view.addGestureRecognizer(tap)
    self.contentView.addSubview(view)
    return view
  }()
  
  private lazy var photoCollectionView:PhotoStreamViewController = {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewControllerWithIdentifier("Photostream") as! PhotoStreamViewController
    self.contentView.addSubview(vc.view)
    return vc
  }()
  
  override func updateConstraints() {
    photoCollectionView.view.snp_updateConstraints { (make) -> Void in
      make.leading.equalTo(self.contentView)
      make.trailing.equalTo(self.contentView)
      make.top.equalTo(self.contentView)
      make.bottom.equalTo(self.contentView)
    }
    
    openAllView.snp_updateConstraints { (make) -> Void in
      make.leading.equalTo(self.contentView)
      make.trailing.equalTo(self.contentView)
      make.bottom.equalTo(self.contentView)
      make.height.equalTo(50)
    }
    
    openAllviewLabel.snp_updateConstraints { (make) -> Void in
      make.center.equalTo(self.openAllView.center)
    }
    
    self.contentView.bringSubviewToFront(openAllView)
    
    contentView.backgroundColor = UIColor.greenColor()
    super.updateConstraints()
  }
  
  func config(title:String) {
    openAllviewLabel.text = title
    setNeedsUpdateConstraints()
    updateConstraintsIfNeeded()
  }
  
  func openNewView() {
    print("show new view")
  }
}
