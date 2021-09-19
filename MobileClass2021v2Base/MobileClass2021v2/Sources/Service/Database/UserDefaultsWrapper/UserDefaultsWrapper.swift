import Foundation

public enum DatabaseServiceKey: String {
    case filterSortAZ
}

public protocol DatabaseServiceType: AnyObject {
    @discardableResult
    func save<T: Encodable>(object: T, forKey: DatabaseServiceKey) -> Bool
    @discardableResult
    func load<T: Decodable>(key: DatabaseServiceKey) -> T?
}

final class DatabaseService: DatabaseServiceType {
    private let defaults = UserDefaults.standard

    public init() {}

    @discardableResult
    public func save<T: Encodable>(object: T, forKey: DatabaseServiceKey) -> Bool {
        do {
            let data = try JSONEncoder().encode(object)
            defaults.set(data, forKey: forKey.rawValue)
            return true
        } catch {
            return false
        }
    }

    @discardableResult
    public func load<T: Decodable>(key: DatabaseServiceKey) -> T? {
        guard let data = defaults.object(forKey: key.rawValue) as? Data else { return nil }
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            print("Unexpected error: \(error).")
            return nil
        }
    }    
}
