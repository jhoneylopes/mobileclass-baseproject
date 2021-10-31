import Foundation

public protocol Command {
    func execute()
}
public class InitializeRootViewControllerCommand: Command {
    public init() {}
    public func execute() {
        print("Initialize RootView Controller")
    }
}
public class  InitializeAppAppreanceCommand: Command {
    public init() {}
    public func execute() {
        print("Initialize App Appreance")
    }
}
public class  InitializeRemovteNotificateCommand: Command {
    public init() {}
    public func execute() {
        print("Initialize Removte Notificate")
    }
}
public class  InitializeDataBaseCommand: Command {
    public init() {}
    public func execute() {
        print("Initialize Database")
    }
}
public class  InitializeLoggerCommand: Command {
    public init() {}
    public func execute() {
        print("Initialize Logger")
    }
}
public class  InitializeAnalyticsCommand: Command {
    public init() {}
    public func execute() {
        print("Initialize Analytics")
    }
}
