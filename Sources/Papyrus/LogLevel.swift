public enum LogLevel {
    case debug
    case info
    case `default`
    case error
    case fault
}

extension LogLevel: Comparable {
    var order: Int {
        switch self {
        case .debug: return 0
        case .info: return 1
        case .default: return 2
        case .error: return 3
        case .fault: return 4
        }
    }
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.order < rhs.order
    }
}

extension LogLevel: Sendable {}
