//
//  DetailViewController.swift
//  Milestone1-3
//
//  Created by HubertMac on 16/05/2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var flagImage: UIImageView!
    
    var selectedFlag: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        
        let countryName = selectedFlag?.replacingOccurrences(of: "@3x.png", with: "") ?? ""
        
        title = (countryName == "us" || countryName == "uk") ? countryName.uppercased() : countryName.capitalized
        
        guard let selectedFlag else { return }
        flagImage.image = UIImage(named: selectedFlag)
        flagImage.layer.borderColor = UIColor.black.cgColor
        flagImage.layer.borderWidth = 1

        // Do any additional setup after loading the view.
    }

    @objc func shareFlag() {
        guard let flagToShare = flagImage.image?.jpegData(compressionQuality: 0.6) else { return }
                
        let vc = UIActivityViewController(activityItems: ["share the flag", flagToShare], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
    }
}
