//
//  DetailViewController.swift
//  Favourites-Swift
//
//  Created by Cenny Davidsson on 2015-08-24.
//  Copyright (c) 2015 Linköpings University. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    var link: Link? {
        // Egen setter för link som uppdaterar gränsnittet så fort länken ändras
        didSet {
            // Om länken är ny, sätt den
            if oldValue != link {
                // Update the view.
                self.configureView()
            }
        }
    }

    func configureView() {
        // Uppdaterar användargränsnittet för att visa en länk
        if let link = link, webView = webView {
            webView.loadRequest(NSURLRequest(URL: link.url))
            title = link.url.description
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
}
