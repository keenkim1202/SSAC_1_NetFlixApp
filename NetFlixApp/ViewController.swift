//
//  ViewController.swift
//  NetFlixApp
//
//  Created by KEEN on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {
  
  var previewImageList: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6", "poster7", "poster8", "poster9"]
  let mainImageList: [String] = ["7번방의선물", "겨울왕국2", "광해", "괴물", "국제시장", "극한직업", "도둑들", "명량", "베테랑", "부산행", "신과함께인과연", "신과함께죄와벌", "아바타", "알라딘", "암살", "어벤져스엔드게임", "왕의남자", "태극기휘날리며", "택시운전사", "해운대"]
  
  var imageIndex: Int = 0
  
  @IBOutlet weak var mainImageView: UIImageView!
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
    mainImageView.image = UIImage(named: mainImageList[imageIndex])
  }
  
  func getRandom() {
    var flag: Bool = false
    // collectionViewCell의 이미지 순서 랜덤하게 띄우기
    previewImageList.shuffle()
    // 배경의 메인 이미지 랜덤하게 띄우기
    while flag == false {
      var nextIndex = Int.random(in: 0..<mainImageList.count)
      
      if imageIndex == nextIndex {
        nextIndex = Int.random(in: 0..<mainImageList.count)
      } else {
        imageIndex = nextIndex
        flag = true
      }
    }
    mainImageView.image = UIImage(named: mainImageList[imageIndex])
  }
  
  // MARK: Action
  @IBAction func onPlay(_ sender: UIButton) {
    getRandom()
    collectionView.reloadData()
  }
}

// MARK: UICollectionView Delegate & DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return previewImageList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCell", for: indexPath) as! PreViewCell
    cell.layer.cornerRadius = cell.frame.height / 2
    cell.layer.borderWidth = 3
    cell.layer.borderColor = UIColor.darkGray.cgColor
    cell.previewImage.image = UIImage(named: previewImageList[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }
    let numberOfCells: CGFloat = 3
    let width = collectionView.frame.size.width - (flowLayout.minimumInteritemSpacing * (numberOfCells - 1))
    return CGSize(width: width / (numberOfCells), height: width / (numberOfCells))
  }
}
