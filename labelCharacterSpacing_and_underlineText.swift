import UIKit
import Foundation

extension UILabel {
    
      func addCharacterSpacing(kernValue: Double) {
        if let labelText = text, labelText.count > 0 {
          let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
          attributedText = attributedString
        }
      }


    func underlineText(parentText: String, underlines: [String]) -> NSMutableAttributedString {
        let nsString: NSString = NSString(string: parentText)
        let attributedString: NSMutableAttributedString = NSMutableAttributedString.init(string: parentText)
        for underlineText in underlines {
            let underlineRange: NSRange = nsString.range(of: underlineText)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: underlineRange)
        }
        return attributedString
    }
    
    
}
