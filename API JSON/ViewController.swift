//
//  ViewController.swift
//  API JSON
//
//  Created by Kelvin Tan on 7/19/18.
//  Copyright © 2018 Kelvin Tan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortLabel: UILabel!
    
    var news: News!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news = News()
        news.downloadNews {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    func updateUI(){
        let url = URL(string: news.image)
        imageView.kf.setImage(with: url)
        authorLabel.text = news.name
        titleLabel.text = news.title
        shortLabel.text = news.short
    }


}

