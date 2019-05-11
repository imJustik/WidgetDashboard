import UIKit

public extension UIEdgeInsets {
    /// Инициализирует структуру с попарно одинаковыми отсутапми, сверху и снизу равными высоте, слева и справа — ширине
    ///
    /// - Parameter size: высота и ширина отступов
    init(_ size: CGSize) {
        self.init(top: size.height, left: size.width, bottom: size.height, right: size.width)
    }

    /// Умножает все элементы структуры на множитель
    ///
    /// - Parameters:
    ///   - lhs: исходная структура UIEdgeInsets
    ///   - rhs: множитель
    /// - Returns: результат умножения всех элементов на множитель
    static func * (lhs: UIEdgeInsets, rhs: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: lhs.top * rhs, left: lhs.left * rhs, bottom: lhs.bottom * rhs, right: lhs.right * rhs)
    }

    /// Инициализирует структуру с заданными вертикальными и горизонтальными отступами
    init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    /// Инициализирует структуру с равными по всем сторонам отступами
    init(uniform: CGFloat) {
        self.init(top: uniform, left: uniform, bottom: uniform, right: uniform)
    }

    /// Возвращает новую структуру с заданным отступом сверху
    func with(top: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.top = top
        return inset
    }

    /// Возвращает новую структуру с заданным отступом слева
    func with(left: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.left = left
        return inset
    }

    /// Возвращает новую структуру с заданным отступом снизу
    func with(bottom: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.bottom = bottom
        return inset
    }

    /// Возвращает новую структуру с заданным отступом справа
    func with(right: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.right = right
        return inset
    }

    /// Возвращает новую структуру с нулевым верхним отступом
    func withoutTop() -> UIEdgeInsets { return with(top: 0) }

    /// Возвращает новую структуру с нулевым левым отступом
    func withoutLeft() -> UIEdgeInsets { return with(left: 0) }

    /// Возвращает новую структуру с нулевым нижним отступом
    func withoutBottom() -> UIEdgeInsets { return with(bottom: 0) }

    /// Возвращает новую структуру с нулевым правым отступом
    func withoutRight() -> UIEdgeInsets { return with(right: 0) }
}
