//
//  ViewController.swift
//  Tab Bar
//
//  Created by actionfi on 29/03/1946 Saka.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    let images = ["image1","image3","image4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        imageSetup()
        // Do any additional setup after loading the view.
    }
    func imageSetup(){
        for image in images{
            let imageView = UIImageView(image: UIImage(named: image))
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            
            //gesture
            let gesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.addGestureRecognizer(gesture)
            
            stackView.addArrangedSubview(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        }
    }
    func didScroll(_scrollView:UIScrollView){
        let pageIndex = Int(round(scrollView.contentOffset.x / 100))
        backGroundImage(forPage: pageIndex)
    }
    func backGroundImage(forPage page: Int){
        if page < images.count{
            imageView.image = UIImage(named: images[page])
        }
                         }
    @objc func imageTapped(_ sender : UITapGestureRecognizer){
        if let imageView = sender.view as? UIImageView , let index = stackView.arrangedSubviews.firstIndex(of: imageView){
            backGroundImage(forPage: index)
        }
    }

}

