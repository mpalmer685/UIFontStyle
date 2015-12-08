//
//  UIFont+Style.swift
//  UIFontStyle
//
//  Created by Mike Palmer on 12/8/15.
//  Copyright © 2015 Mike Palmer. All rights reserved.
//

import UIKit

/// Convenience enum for `UIFontTextStyle` values.
@objc
enum FontStyle: Int
{
    case Body
    case Callout
    case Caption1
    case Caption2
    case Footnote
    case Headline
    case Subheadline
    case Title1
    case Title2
    case Title3
    
    private var textStyle: String {
        switch self {
        case .Body: return UIFontTextStyleBody
        case .Callout: return UIFontTextStyleCallout
        case .Caption1: return UIFontTextStyleCaption1
        case .Caption2: return UIFontTextStyleCaption2
        case .Footnote: return UIFontTextStyleFootnote
        case .Headline: return UIFontTextStyleHeadline
        case .Subheadline: return UIFontTextStyleSubheadline
        case .Title1: return UIFontTextStyleTitle1
        case .Title2: return UIFontTextStyleTitle2
        case .Title3: return UIFontTextStyleTitle3
        }
    }
}

extension UIFont
{
    class func fontWithStyle(style: FontStyle) -> UIFont {
        return preferredFontForTextStyle(style.textStyle)
    }
    
    func bold() -> UIFont {
        return fontWithAddedTraits(.TraitBold)
    }
    
    func italic() -> UIFont {
        return fontWithAddedTraits(.TraitItalic)
    }
    
    func boldAndItalic() -> UIFont {
        return fontWithAddedTraits([.TraitBold, .TraitItalic])
    }
    
    private func fontWithAddedTraits(addedTraits: UIFontDescriptorSymbolicTraits) -> UIFont {
        let currentDescriptor = fontDescriptor()
        let newTraits = currentDescriptor.symbolicTraits.union(addedTraits)
        let newDescriptor = currentDescriptor.fontDescriptorWithSymbolicTraits(newTraits)
        return UIFont(descriptor: newDescriptor, size: newDescriptor.pointSize)
    }
    
    private var kBaseFontSize: CGFloat { return 16 }
    func withScaledSize(size: CGFloat) -> UIFont {
        let scale = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody).pointSize / kBaseFontSize
        let pointSize = size * scale
        return UIFont(descriptor: fontDescriptor(), size: pointSize)
    }
    
    func withFixedSize(size: CGFloat) -> UIFont {
        return UIFont(descriptor: fontDescriptor(), size: size)
    }
}
