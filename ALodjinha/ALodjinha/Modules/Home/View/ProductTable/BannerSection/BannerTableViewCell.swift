//
//  BannerTableViewCell.swift
//  ALodjinha
//
//  Created by Thiery Gastaldi on 24/09/19.
//  Copyright © 2019 tgr. All rights reserved.
//

import UIKit
import AlamofireImage

class BannerTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.scrollView.backgroundColor = .primaryColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func render(_ banners: Banners?) {
        if let banners = banners {
            let width = UIScreen.main.bounds.width
            self.scrollView.frame = CGRect(x: 0, y: 0, width: width, height: self.scrollView.frame.height)
            self.scrollView.contentSize = CGSize(width: Int(width) * banners.count, height: 136)
            self.scrollView.isPagingEnabled = true
            self.scrollView.delegate = self
            
            // Add views for each banner
            for i in 0 ..< banners.count {
                let banner = banners[i]
                let bannerPage = UIImageView()
                bannerPage.contentMode = .scaleToFill
                bannerPage.frame = CGRect(x: width * CGFloat(i), y: 0, width: width, height: self.scrollView.frame.height)
                if let imageUrl = URL(string: banner.imageUrl) {
                    bannerPage.af_setImage(withURL: imageUrl)
                }
                self.scrollView.addSubview(bannerPage)
            }
            
            // Config page controll
            self.pageControl.numberOfPages = banners.count
            self.pageControl.currentPage = 0
        }
    }
}

extension BannerTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // ScrollViewDelegate for page controll
        let width = UIScreen.main.bounds.width
        let pageIndex = round(scrollView.contentOffset.x/width)
        self.pageControl.currentPage = Int(pageIndex)
    }
}
