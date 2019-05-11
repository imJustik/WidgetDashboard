import UIKit

extension UIOffset {
    /// Инициализирует структуру с отсутапми равными ширине и высоте входящего параметра
    ///
    /// - Parameter size: размер с которым нужно инициализировать структуру
    init(_ size: CGSize) {
        self.init(horizontal: size.width, vertical: size.height)
    }

    /// Умножает все элементы структуры на множитель
    ///
    /// - Parameters:
    ///   - lhs: исходная структура UIOffset
    ///   - rhs: множитель
    /// - Returns: результат умножения всех элементов на множитель
    static func * (lhs: UIOffset, rhs: CGFloat) -> UIOffset {
        return UIOffset(horizontal: lhs.horizontal * rhs, vertical: lhs.vertical * rhs)
    }
}
