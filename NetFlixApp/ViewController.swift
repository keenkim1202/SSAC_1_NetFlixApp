//
//  ViewController.swift
//  NetFlixApp
//
//  Created by KEEN on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {
  
  let previewImages: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6", "poster7", "poster8", "poster9"]
  
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    configure()
  }
  
  func configure() {
    playButton.layer.cornerRadius = CGFloat(8)
  }
}

// MARK: UICollectionView Delegate & DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return previewImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCell", for: indexPath) as! PreViewCell
    cell.layer.cornerRadius = cell.frame.height / 2
    cell.layer.borderWidth = 3
    cell.layer.borderColor = UIColor.darkGray.cgColor
    cell.previewImage.image = UIImage(named: previewImages[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }
    let numberOfCells: CGFloat = 3
    let width = collectionView.frame.size.width - (flowLayout.minimumInteritemSpacing * (numberOfCells - 1))
    return CGSize(width: width / (numberOfCells), height: width / (numberOfCells))
  }
}
