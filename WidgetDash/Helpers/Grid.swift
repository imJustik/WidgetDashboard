import UIKit
import Foundation
public protocol Grid {
    /// Размер минимального элемента сетки
    static var gridUnitSize: CGSize { get }
}

// MARK: - Cетки для верстки по умолчанию

public extension Grid {
    /// Значение минимального размера сетки по умолчанию
    static var gridUnitSize: CGSize { return CGSize(4) }

    // MARK: Grid multipliers

    /// = 1
    static var xxxs: CGFloat { return 1 }
    /// = 2
    static var xxs: CGFloat { return 2 }
    /// = 3
    static var xs: CGFloat { return 3 }
    /// = 4
    static var s: CGFloat { return 4 }
    /// = 6
    static var m: CGFloat { return 6 }
    /// = 8
    static var l: CGFloat { return 8 }
    /// = 9
    static var xl: CGFloat { return 9 }
    /// = 12
    static var xxl: CGFloat { return 12 }
    /// = 18
    static var xxxl: CGFloat { return 18 }

    /// {4, 4, 4, 4},  если gridUnitSize не переопределён
    var xxxsInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.xxxs }
    /// {8, 8, 8, 8},  если gridUnitSize не переопределён
    var xxsInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.xxs }
    /// {12, 12, 12, 12},  если gridUnitSize не переопределён
    var xsInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.xs }
    /// {16, 16, 16, 16},  если gridUnitSize не переопределён
    var sInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.s }
    /// {24, 24, 24, 24},  если gridUnitSize не переопределён
    var mInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.m }
    /// {32, 32, 32, 32},  если gridUnitSize не переопределён
    var lInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.l }
    /// {36, 36, 36, 36},  если gridUnitSize не переопределён
    var xlInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.xl }
    /// {48, 48, 48, 48},  если gridUnitSize не переопределён
    var xxlInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.xxl }
    /// {72, 72, 72, 72},  если gridUnitSize не переопределён
    var xxxlInsets: UIEdgeInsets { return UIEdgeInsets(Self.gridUnitSize) * Self.xxxl }

    /// = 4,  если gridUnitSize не переопределён
    var xxxsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxxs) }
    /// = 8,  если gridUnitSize не переопределён
    var xxsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxs) }
    /// = 12,  если gridUnitSize не переопределён
    var xsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xs) }
    /// = 16,  если gridUnitSize не переопределён
    var sSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.s) }
    /// = 24,  если gridUnitSize не переопределён
    var mSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.m) }
    /// = 32,  если gridUnitSize не переопределён
    var lSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.l) }
    /// = 36,  если gridUnitSize не переопределён
    var xlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xl) }
    /// = 48,  если gridUnitSize не переопределён
    var xxlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxl) }
    /// = 72,  если gridUnitSize не переопределён
    var xxxlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxxl) }

    /// {4, 4},  если gridUnitSize не переопределён
    var xxxsSize: CGSize { return Self.gridUnitSize * Self.xxxs }
    /// {8, 8},  если gridUnitSize не переопределён
    var xxsSize: CGSize { return Self.gridUnitSize * Self.xxs }
    /// {12, 12},  если gridUnitSize не переопределён
    var xsSize: CGSize { return Self.gridUnitSize * Self.xs }
    /// {16, 16},  если gridUnitSize не переопределён
    var sSize: CGSize { return Self.gridUnitSize * Self.s }
    /// {24, 24},  если gridUnitSize не переопределён
    var mSize: CGSize { return Self.gridUnitSize * Self.m }
    /// {32, 32},  если gridUnitSize не переопределён
    var lSize: CGSize { return Self.gridUnitSize * Self.l }
    /// {36, 36},  если gridUnitSize не переопределён
    var xlSize: CGSize { return Self.gridUnitSize * Self.xl }
    /// {48, 48},  если gridUnitSize не переопределён
    var xxlSize: CGSize { return Self.gridUnitSize * Self.xxl }
    /// {72, 72},  если gridUnitSize не переопределён
    var xxxlSize: CGSize { return Self.gridUnitSize * Self.xxxl }

    /// {4, 4},  если gridUnitSize не переопределён
    var xxxsOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.xxxs }
    /// {8, 8},  если gridUnitSize не переопределён
    var xxsOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.xxs }
    /// {12, 12},  если gridUnitSize не переопределён
    var xsOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.xs }
    /// {16, 16},  если gridUnitSize не переопределён
    var sOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.s }
    /// {24, 24},  если gridUnitSize не переопределён
    var mOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.m }
    /// {32, 32},  если gridUnitSize не переопределён
    var lOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.l }
    /// {36, 36},  если gridUnitSize не переопределён
    var xlOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.xl }
    /// {48, 48},  если gridUnitSize не переопределён
    var xxlOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.xxl }
    /// {72, 72},  если gridUnitSize не переопределён
    var xxxlOffset: UIOffset { return UIOffset(Self.gridUnitSize) * Self.xxxl }
}
