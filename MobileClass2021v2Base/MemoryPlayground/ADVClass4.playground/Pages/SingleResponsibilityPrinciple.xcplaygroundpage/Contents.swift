//: [Previous](@previous)

import UIKit

///:    # S — Single Responsibility
///:    Uma classe deveria ter apenas uma única responsabilidade

/// Imagine um AppDelegate com uma massiva quantidade de funções e instâncias locais
//class AppDelegate {
//    func application(_ application: String) -> Bool {
//        //self.initializeRootViewController()
//        //self.nitializeAppAppreance()
//        //self.initializeRemovteNotificate()
//        //self.initializeDataBase()
//        //self.nitializeLogger()
//        //self.initializeAnalytics()
//        return true
//    }
//}

// -> Ver Command.swift

// Depois vamos criar um builder com todos os commands
class AppDelegateCommandBuilder {
    let actions: [Command] = [
        InitializeRootViewControllerCommand(),
        InitializeAppAppreanceCommand(),
        InitializeRemovteNotificateCommand(),
        InitializeRemovteNotificateCommand(),
        InitializeDataBaseCommand(),
        InitializeLoggerCommand(),
        InitializeAnalyticsCommand()]
}

/// Agora o nosso AppDelegate irá apenas invocar o Command Builder que armazena as instâncias que precisamos no futuro, deixando AppDelegate resolver apenas coisas relacionadas a sua própria implementação
class AppDelegate {
    func application(_ application: String) -> Bool {
        AppDelegateCommandBuilder().actions.forEach({$0.execute()})
        return true
    }
 }

//: [Next](@next)
