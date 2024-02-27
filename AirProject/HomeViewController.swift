//
//  HomeViewController.swift
//  AirProject
//
//  Created by Saif Adel on 15/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageview: UIImageView!
    @IBOutlet weak var takeLoanButton: UIButton!
    @IBOutlet weak var rechargeButton: UIButton!
    @IBOutlet weak var plusImageView: UIImageView!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var viewDetails: UIButton!
    @IBOutlet weak var buyMore: UIButton!
    @IBOutlet weak var internetView: UIView!
    
    @IBOutlet weak var minutesView: UIView!
    @IBOutlet weak var minutesBuyMore: UIButton!
    @IBOutlet weak var minutesProgressView: UIProgressView!
    
    @IBOutlet weak var pointsView: UIView!
    @IBOutlet weak var pointsProgressView: UIProgressView!
    
    
    @IBOutlet weak var menuView: UIView!
    
    
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerCVHeight: NSLayoutConstraint!
    let bannerList: [String] = ["airtel 1", "airtel 2","airtel 3"]
    
    
    @IBOutlet weak var groupCollectionView: UICollectionView!
    @IBOutlet weak var groupCVHeight: NSLayoutConstraint!
    let groupList: [GroupModel] = [GroupModel(imageName: "person", title: "person"), GroupModel(imageName: "eraser", title: "eraser"), GroupModel(imageName: "tray", title: "tray"), GroupModel(imageName: "pencil", title: "pencil"), GroupModel(imageName: "calendar", title: "calendar"), GroupModel(imageName: "doc", title: "doc"), GroupModel(imageName: "note", title: "note"), GroupModel(imageName: "clipboard", title: "clipboard")]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuView.layer.cornerRadius = 20
        self.profileImageview.layer.cornerRadius = self.profileImageview.bounds.height * 0.5
        self.profileView.layer.cornerRadius = self.profileView.frame.height * 0.5
        self.takeLoanButton.layer.cornerRadius = self.takeLoanButton.frame.height * 0.5
        self.rechargeButton.layer.cornerRadius = self.rechargeButton.frame.height * 0.5
        self.plusImageView.layer.cornerRadius = self.plusImageView.bounds.height / 2
        
        self.internetView.layer.cornerRadius = 15
        self.progressView.layer.cornerRadius = 25
        self.progressView.progress = 0.7
        self.viewDetails.layer.cornerRadius = 08
        self.buyMore.layer.cornerRadius = self.buyMore.frame.height * 0.5
        
        
        self.minutesView.layer.cornerRadius = 15
        self.minutesProgressView.layer.cornerRadius = 25
        self.minutesProgressView.progress = 0.2
        self.minutesBuyMore.layer.cornerRadius = self.minutesBuyMore.frame.height * 0.5
        
        
        self.pointsView.layer.cornerRadius = 15
        self.pointsProgressView.layer.cornerRadius = 25
        self.pointsProgressView.progress = 0.4
        
        
        
        bannerCollectionView.tag = 0
        groupCollectionView.tag = 1
        
        
        bannerCollectionView.register(BannerCollectionViewCell.nib(), forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
        bannerCollectionView.dataSource = self
        //  bannerCollectionView.delegate = self
        bannerCollectionView.collectionViewLayout = getFlowlayout()
        
        
        
        groupCollectionView.register(GroupCollectionViewCell.nib(), forCellWithReuseIdentifier: GroupCollectionViewCell.identifier)
        groupCollectionView.dataSource = self
        groupCollectionView.collectionViewLayout = getGroupFlowlayout()
        
        
        
        self.tableView.register(.init(nibName: "TableViewCell", bundle: .main), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
    }
    
    
    
    func getFlowlayout() -> UICollectionViewFlowLayout{
        let cvCellWidth = screenWidth * 0.80
        self.bannerCVHeight.constant = cvCellWidth * 0.56
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: cvCellWidth, height: (cvCellWidth * 0.56))
        flowlayout.minimumLineSpacing = 8
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        return flowlayout
        
    }
    
    
    func getGroupFlowlayout() -> UICollectionViewFlowLayout{
        let cellSpace: CGFloat = 10
        let cellHeight: CGFloat = 60
        let inset: CGFloat = 16
        let numberOfItemInARow: CGFloat = groupList.count >= 4 ? 4.0 : CGFloat(groupList.count)
        
        
        let cvWidth = screenWidth - (inset * 2)
        let cvCellsWidth = cvWidth - ((numberOfItemInARow - 1) * cellSpace)
        let cvCellWidth = cvCellsWidth / numberOfItemInARow
        self.groupCVHeight.constant = cellHeight * (groupList.count > 4 ? 2 : 1) + cellSpace
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: cvCellWidth, height: cellHeight)
        flowlayout.minimumLineSpacing = cellSpace
        flowlayout.minimumInteritemSpacing = cellSpace
        flowlayout.sectionInset = .init(top: 0, left: inset, bottom: 0, right: inset)
        return flowlayout
        
        
    }
    
    
}



extension HomeViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView.tag == 0 ) {
            print("numberOfSections")
            return 1}
        
        else if (collectionView.tag == 1) {
            print("numberOfSections")
            return 1
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView.tag == 0 ) {
            print("numberOfItemsInSection \(self.bannerList.count)" )
            return self.bannerList.count
        }
        
        else if (collectionView.tag == 1) {
            print("numberOfItemsInSection \(self.groupList.count)" )
            return self.groupList.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellForItemAt   \(indexPath.item)")
        
        if (collectionView.tag == 0 ) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as! BannerCollectionViewCell
            cell.configure(with: UIImage(named: bannerList[indexPath.item])!)
            
            return cell
            
        } else if (collectionView.tag == 1) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.identifier, for: indexPath) as! GroupCollectionViewCell
            cell.configure(model: groupList[indexPath.item])
            
            return cell
            
        }
        return  UICollectionViewCell()
        
        
    }
}



extension HomeViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections")
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
         return cell
    }
    
       
    
}

struct GroupModel {
    let image: UIImage?
    let title: String
    
    init(imageName: String, title: String) {
        self.image = UIImage (systemName: imageName)
        self.title = title
        
    }
}



