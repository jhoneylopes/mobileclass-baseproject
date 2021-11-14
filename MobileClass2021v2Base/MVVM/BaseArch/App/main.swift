import UIKit

private let fakeAppDelegateClass: AnyClass? = NSClassFromString("BaseArchTests.FakeAppDelegate")
private let appDelegateClass: AnyClass = fakeAppDelegateClass ?? AppDelegate.self

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
