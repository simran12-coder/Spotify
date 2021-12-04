//
//  Extensions.swift
//  OHLEsport
//
//  Created by Tushar Agarwal on 27/10/17.
//  Copyright © 2017 Tushar Agarwal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
//
//extension AppDelegate {
//    class func mainStoryBoard() -> UIStoryboard{
//        return UIStoryboard(name: "Main", bundle: Bundle.main)
//    }
//    class func SignInViewController() -> SignInVC {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
//    }
//    class func TabBarController() -> TabBarViewController {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
//    }
//    class func ChangePasswordVC() -> ChangePasswordVC {
//        return mainStoryBoard().instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
//    }
//}

extension UIApplication {
    func getScreenshot() -> UIImage? {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return nil }
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        window.drawHierarchy(in: bounds, afterScreenUpdates: true)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}

@IBDesignable class myButton : UIButton {}
extension UIView {   
    @IBInspectable var borderColor:UIColor{
        set{
            self.layer.borderColor = (newValue as UIColor).cgColor
        }
        get{
            let color  = self.layer.borderColor
            return UIColor(cgColor: color!)  
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        set{
            self.layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat{
        set{
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var maskToBounds:Bool{
        set{
            self.layer.masksToBounds = newValue
        }
        get{
            return self.layer.masksToBounds
        }
    }
    
    class HighlightedButton: UIButton {

           override var isHighlighted: Bool {
               didSet {
                   backgroundColor = isHighlighted ? .red : .green
               }
           }
       }
    
    @IBInspectable
      var shadowRadius: CGFloat {
          get {
              return layer.shadowRadius
          }
          set {
              layer.masksToBounds = false
              layer.shadowRadius = newValue
          }
      }

      @IBInspectable
      var shadowOpacity: Float {
          get {
              return layer.shadowOpacity
          }
          set {
              layer.masksToBounds = false
              layer.shadowOpacity = newValue
          }
      }

      @IBInspectable
      var shadowOffset: CGSize {
          get {
              return layer.shadowOffset
          }
          set {
              layer.masksToBounds = false
              layer.shadowOffset = newValue
          }
      }

      @IBInspectable
      var shadowColor: UIColor? {
          get {
              if let color = layer.shadowColor {
                  return UIColor(cgColor: color)
              }
              return nil
          }
          set {
              if let color = newValue {
                  layer.shadowColor = color.cgColor
              } else {
                  layer.shadowColor = nil
              }
          }
      }
}

@IBDesignable
extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
}

@IBDesignable class TextViewWithPlaceholder: UITextView {

    override var text: String! { // Ensures that the placeholder text is never returned as the field's text
        get {
            if showingPlaceholder {
                return "" // When showing the placeholder, there's no real text to return
            } else { return super.text }
        }
        set { super.text = newValue }
    }
    @IBInspectable var placeholderText: String = ""
    @IBInspectable var placeholderTextColor: UIColor = UIColor(red: 171.00/255.00, green: 171.00/255.00, blue: 171.00/255.00, alpha: 1.0)
    private var showingPlaceholder: Bool = true // Keeps track of whether the field is currently showing a placeholder

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if text.isEmpty {
            showPlaceholderText() // Load up the placeholder text when first appearing, but not if coming back to a view where text was already entered
        }
    }

    override func becomeFirstResponder() -> Bool {
        // If the current text is the placeholder, remove it
        if showingPlaceholder {
            text = nil
            textColor = nil // Put the text back to the default, unmodified color
            showingPlaceholder = false
        }
        return super.becomeFirstResponder()
    }

    override func resignFirstResponder() -> Bool {
        // If there's no text, put the placeholder back
        if text.isEmpty {
            showPlaceholderText()
        }
        return super.resignFirstResponder()
    }

    private func showPlaceholderText() {
        showingPlaceholder = true
        textColor = placeholderTextColor
        text = placeholderText
    }
}

extension UIAlertController {
    class func showInfoAlertWithTitle(_ title: String?, message: String?, buttonTitle: String, viewController: UIViewController? = nil){
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction.init(title: buttonTitle, style: .default, handler: { (okayAction) in
                if viewController != nil {
                    viewController?.dismiss(animated: true, completion: nil)
                } else {
                    UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
                }
            })
            alertController.addAction(okayAction)
            if viewController != nil {
                viewController?.present(alertController, animated: true, completion: nil)
            } else {
                UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
            }
        })
    }
}

extension String {
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F:   // Variation Selectors
                return true
            default:
                continue
            }
        }
        return false
    }
    
    func containsOnlyNumbers(_ string : String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = (string as NSString).components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    init(htmlEncodedString: String) {
        self.init()
        guard let encodedData = htmlEncodedString.data(using: .utf8) else {
            self = htmlEncodedString
            return
        }
        
        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            NSAttributedString.DocumentReadingOptionKey(rawValue: NSAttributedString.DocumentAttributeKey.documentType.rawValue): NSAttributedString.DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey(rawValue: NSAttributedString.DocumentAttributeKey.characterEncoding.rawValue): String.Encoding.utf8.rawValue
        ]
        
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            self = attributedString.string
        }
        catch {
            self = htmlEncodedString
        }
    }
    
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}

extension UIViewController {
    func getDayFromDate(dateString: String, dateFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: dateString)
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat  = "EEEE"//"EE" to get short style
        return date != nil ? dateFormat.string(from: date!) : "" //"Sunday"
    }
    
    func getMonthFromDate(dateString: String, dateFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: dateString)
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat  = "LLLL"//"EE" to get short style
        return date != nil ? dateFormat.string(from: date!) : "" //"January"
    }
    
    func getDateTimeFromTimeStamp(timeStamp:Double) -> String? {
        let date = NSDate(timeIntervalSince1970: timeStamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.locale = Locale(identifier: "en_US_POSIX")
        dayTimePeriodFormatter.dateFormat = "MM-dd-YYYY 'at' hh:mm:ss a"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    func convertDateString(dateString : String!, fromFormat sourceFormat : String!, toFormat desFormat : String!) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = sourceFormat
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = desFormat
        if date != nil  {
            return dateFormatter.string(from: date!)
        }
        else {
            return ""
        }
    }
    
    func getDateFromString(dateStr:String, formatString : String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter.date(from: dateStr)
    }
    
    func saveDocUrlInDocumentDirectory(filename:String) {
        // get the documents directory url
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(filename)
        // get your UIImage jpeg data representation and check if the destination file url already exists
        if !FileManager.default.fileExists(atPath:fileURL.path) {
            do {
                // writes the image data to disk
                var zipData: NSData! = NSData()
                do {
                    zipData = try NSData(contentsOf: fileURL, options: NSData.ReadingOptions())
                }
                catch {
                    // print("- error during get nsdata from zip file\(error)")
                }
                try zipData.write(to: fileURL)       // print("file saved")
            }  
            catch {
                //print("error saving file:", error)
            }
        }
    }
}

extension UIImage {
    func fixOrientation() -> UIImage? {
        // No-op if the orientation is already correct
        if imageOrientation == .up {
            return self
        }
        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform: CGAffineTransform = .identity
        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: .pi/2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -.pi/2)
        case .up, .upMirrored:
            break
        @unknown default:
            break
        }
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .up, .down, .left, .right:
            break
        @unknown default:
            break
        }
        let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: (cgImage?.bitsPerComponent)!, bytesPerRow: 0, space: (cgImage?.colorSpace)!, bitmapInfo: (cgImage?.bitmapInfo)!.rawValue)
        ctx?.concatenate(transform)
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            // Grr...
            ctx?.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            ctx?.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        // And now we just create a new UIImage from the drawing context
        let cgimg = ctx?.makeImage()
        let img = UIImage(cgImage: cgimg!)
        return img
    }
    
    //MARK:- set tab bar item background color
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0 , width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension CALayer {
    
    func border() {
        
        let topBorder = CALayer()
        let rightBorder:CALayer = CALayer()
        let bottomBorder:CALayer = CALayer()
        
        topBorder.borderWidth = 1
        topBorder.borderColor = UIColor.lightGray.cgColor
        rightBorder.borderWidth = 1
        rightBorder.borderColor = UIColor.lightGray.cgColor
        bottomBorder.borderWidth = 1
        bottomBorder.borderColor = UIColor.lightGray.cgColor
        topBorder.frame = CGRect(x: 0, y: 0, width: frame.width , height: 1)
        rightBorder.frame = CGRect(x: frame.width - 1, y: 0 , width: 1, height: frame.height)
        bottomBorder.frame = CGRect(x: 0, y: frame.height, width: frame.width , height: 1)
        self.addSublayer(topBorder)
        self.addSublayer(rightBorder)
        self.addSublayer(bottomBorder)
        
    }
   
}

extension UIView {
    func setShadow(shadowColor:UIColor, shadowOffset:CGSize) {
        //        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)).cgPath
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = self.cornerRadius
        //        self.layer.shadowPath = shadowPath
    }
    
    func setShadow(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, radius: CGFloat) {
        let shadowPath = UIBezierPath(rect: CGRect(x: x,
                                                   y: y,
                                                   width: width,
                                                   height: height))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor  //custom
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.06
        self.layer.shadowRadius = radius
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    func dropShadow(width: Int, height: Int?, opacity: Float, radius: CGFloat, color: CGColor) {
        layer.masksToBounds =  false
        layer.shadowOffset = CGSize(width: width, height: height!)
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowColor = color
    }
}
@IBDesignable
class RoundedCornerView: UIView {

    var cornerRadiusValue : CGFloat = 0
    var corners : UIRectCorner = []

    @IBInspectable public var topLeft : Bool {
        get {
            return corners.contains(.topLeft)
        }
        set {
            setCorner(newValue: newValue, for: .topLeft)
        }
    }

    @IBInspectable public var topRight : Bool {
        get {
            return corners.contains(.topRight)
        }
        set {
            setCorner(newValue: newValue, for: .topRight)
        }
    }

    @IBInspectable public var bottomLeft : Bool {
        get {
            return corners.contains(.bottomLeft)
        }
        set {
            setCorner(newValue: newValue, for: .bottomLeft)
        }
    }

    @IBInspectable public var bottomRight : Bool {
        get {
            return corners.contains(.bottomRight)
        }
        set {
            setCorner(newValue: newValue, for: .bottomRight)
        }
    }

    func setCorner(newValue: Bool, for corner: UIRectCorner) {
        if newValue {
            addRectCorner(corner: corner)
        } else {
            removeRectCorner(corner: corner)
        }
    }

    func addRectCorner(corner: UIRectCorner) {
        corners.insert(corner)
        updateCorners()
    }

    func removeRectCorner(corner: UIRectCorner) {
        if corners.contains(corner) {
            corners.remove(corner)
            updateCorners()
        }
    }

    func updateCorners() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}
