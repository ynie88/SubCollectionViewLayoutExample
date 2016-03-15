//
//  ParentCollectionVC.swift
//  Pinterest
//
//  Created by Yuchen Nie on 3/15/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit


class ParentCollectionVC: UICollectionViewController {
  override func viewDidLoad() {
    collectionView?.dataSource = self
    collectionView?.registerClass(ParentCollectionCell.self, forCellWithReuseIdentifier: ParentCollectionCell.reuseID)
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .Vertical
    
    self.collectionView?.collectionViewLayout = layout
    self.collectionView?.backgroundColor = UIColor.blueColor()
    super.viewDidLoad()
  }
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let parentCell = collectionView.dequeueReusableCellWithReuseIdentifier(ParentCollectionCell.reuseID, forIndexPath: indexPath) as! ParentCollectionCell
    parentCell.config("Open New View")
    return parentCell
  }
  
}

extension ParentCollectionVC {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    guard let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
      return
    }
    
    if UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
      flowLayout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 350)
    } else {
      flowLayout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 350)
    }
  }
  
  
}
