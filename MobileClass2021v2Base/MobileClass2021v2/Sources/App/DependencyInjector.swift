class DependencyInjector {
    static func load() {
        DependencyManager.register(DatabaseServiceType.self) {
            DatabaseService()
        }
    }
}
