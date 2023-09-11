//
//  ViewController.swift
//  KingfisherExample
//
//  Copyright (c) 2023 Minii All rights reserved.
        

import UIKit

import Kingfisher
import Nuke
import AlamofireImage


class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    private let imageURLString = "https://images.unsplash.com/photo-1682685796766-0fddd3e480de?crop=entropy&cs=srgb&fm=jpg&ixid=M3wzODM2MDd8MHwxfGFsbHx8fHx8fHx8fDE2OTM2NjYyMjh8&ixlib=rb-4.0.3&q=85"
    
    private var nukeTask: ImageTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageCache.default.diskStorage.config.sizeLimit = 1
        ImageCache.default.memoryStorage.config.countLimit = 0
        try? ImageCache.default.diskStorage.removeAll()
        ImageCache.default.memoryStorage.removeAll()
        
        Nuke.ImageCache.shared.countLimit = 0
        Nuke.ImageCache.shared.removeAll()
        
        AlamofireImage.AutoPurgingImageCache().removeAllImages()
    }
    
    private func measureTime(_ closure: () -> Void) -> TimeInterval {
        let start = CFAbsoluteTimeGetCurrent()
        closure()
        let duration = CFAbsoluteTimeGetCurrent() - start
        return duration
    }
    
    @IBAction func setKingfisherImage(_ sender: UIButton) {
        guard let url = URL(string: imageURLString) else { return }
        
        ImageDownloader.default.cancelAll()
        
        imageView.kf.setImage(with: url)
    }
    
    @IBAction func setNukeImage(_ sender: UIButton) {
        guard let url = URL(string: self.imageURLString) else { return }
        
        Nuke.loadImage(with: url, into: imageView)
    }
    
    @IBAction func setAFImage(_ sender: Any) {
        guard let url = URL(string: imageURLString) else {
            return
        }
        imageView.af.setImage(withURL: url)
    }
    
    @IBAction func resetImage(_ sender: UIButton) {
        imageView.image = nil
        
        Nuke.ImageCache.shared.removeAll()
        
        AlamofireImage.AutoPurgingImageCache().removeAllImages()
        
        try? ImageCache.default.diskStorage.removeAll()
        ImageCache.default.memoryStorage.removeAll()
    }
}

