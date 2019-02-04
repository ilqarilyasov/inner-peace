//
//  ViewController.swift
//  InAPeace
//
//  Created by Ilgar Ilyasov on 2/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var quoteImageView: UIImageView!
    
    let quotes = Bundle.main.decode([Quote].self, from: "quotes.json")
    let images = Bundle.main.decode([String].self, from: "pictures.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func updateQuote() {
        guard let imageName = images.randomElement() else {
            fatalError("Unable to read an image.")
        }
        backgroundImageView.image = UIImage(named: imageName)
        
        guard let randomQuote = quotes.randomElement() else {
            fatalError("Unable to read a quote.")
        }
        
        let insetAmount: CGFloat = 250
        let drawBounds = quoteImageView.bounds.inset(by: UIEdgeInsets(top: insetAmount,
                                                                      left: insetAmount,
                                                                      bottom: insetAmount,
                                                                      right: insetAmount))
        
        var quoteRect = CGRect(x: 0, y: 0,
                               width: CGFloat.greatestFiniteMagnitude,
                               height: CGFloat.greatestFiniteMagnitude)
        var fontSize: CGFloat = 120
        var font: UIFont!
        var attrs: [NSAttributedString.Key: Any]!
        var str: NSAttributedString!
        
        while true {
            font = UIFont(name: "Georgia-Italic", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
            attrs = [.font: font, .foregroundColor: UIColor.white]
            str = NSAttributedString(string: randomQuote.text, attributes: attrs)
            quoteRect = str.boundingRect(with: CGSize(width: drawBounds.width,
                                                      height: .greatestFiniteMagnitude),
                                         options: .usesLineFragmentOrigin, context: nil)
            
            if quoteRect.height > drawBounds.height {
                fontSize -= 5
            } else {
                break
            }
            
            let format = UIGraphicsImageRendererFormat()
            format.opaque = false
            let renderer = UIGraphicsImageRenderer(bounds: quoteRect, format: format)
            
            quoteImageView.image = renderer.image(actions: { (ctx) in
                str.draw(in: quoteRect)
            })
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateQuote()
    }
}
