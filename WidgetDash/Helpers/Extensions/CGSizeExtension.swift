import UIKit

public extension CGSize {
    /// Инициализирует струтуру с идентичными размерами по высоте и ширине, равными входящему параметру
    ///
    /// - Parameter size: размер с которым нужно инициализировать структуру
    init(_ size: CGFloat) {
        self.init(width: size, height: size)
    }

    /// Умножает все элементы структуры на множитель
    ///
    /// - Parameters:
    ///   - lhs: исходная структура CGSize
    ///   - rhs: множитель
    /// - Returns: результат умножения всех элементов на множитель
    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
}
