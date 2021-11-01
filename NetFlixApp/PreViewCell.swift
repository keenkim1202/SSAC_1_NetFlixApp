//
//  PreViewCell.swift
//  NetFlixApp
//
//  Created by KEEN on 2021/09/29.
//

import UIKit

class PreViewCell: UICollectionViewCell {
  @IBOutlet weak var previewImage: UIImageView!
  
  override func layoutSubviews() {
    super.layoutSubviews()
    previewImage.layer.cornerRadius = previewImage.frame.height / 2
  }
}
