//
//  UsefulExtension.swift
//
//
//  Created by Ivan.Chow on 10/20/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

//MARK - UIColor
extension UIColor {
    
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}

//MARK - UIView
extension UIView {
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var size: CGSize  {
        get {
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin = CGPoint(x:newValue, y:self.frame.origin.y)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin = CGPoint(x:self.frame.origin.x, y:newValue)
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x:newValue, y:self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x:self.center.x, y:newValue)
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = newValue
        }
    }
    
}

//MARK - UIImageView
extension UIImageView {
    func roundImage() {
        //height and width should be the same
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}


//MARK - UIImage
extension UIImage {
    func croppedImage(bound : CGRect) -> UIImage {
        let scaledBounds = CGRect(x:bound.origin.x * self.scale, y:bound.origin.y * self.scale, width:bound.size.width * self.scale, height:bound.size.height * self.scale)
        let imageRef = cgImage?.cropping(to:scaledBounds)
        let croppedImage = UIImage(cgImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.up)
        
        return croppedImage
    }
}

