import SwiftUI

enum CustomFont: String {
    case Ubuntu = "Ubuntu"
}

extension Font {
    static func custom(_ customFont: CustomFont, size: CGFloat) -> Font {
        Font.custom(customFont.rawValue, size: size)
    }
}
