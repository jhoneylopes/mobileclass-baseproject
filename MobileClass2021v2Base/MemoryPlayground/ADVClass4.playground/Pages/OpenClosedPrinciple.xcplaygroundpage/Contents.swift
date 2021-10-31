//: [Previous](@previous)

import UIKit

///:    O — Open-Closed Principle
///:    Classes deveriam ser abertas para extensão, mas fechadas para modificações
///:    OCP é sobre fechar o código mas ainda mantê-lo aberto de alguma maneira.

// O problema que temos quando não pensamos em OCP

//--- INIT
//final class OffRoad {
//    func showType() {
//        print("OffRoad")
//    }
//}
//
//final class OnRoad {
//    func showType() {
//        print("Road")
//    }
//}
//
//public class Car {
//    private let engineModelOne: OffRoad
//    private let engineModelTwo: OnRoad
//
//    init(engineModelOne: OffRoad, engineModelTwo: OnRoad) {
//        self.engineModelOne = engineModelOne
//        self.engineModelTwo = engineModelTwo
//    }
//
//    func showType() {
//        engineModelOne.showType()
//        engineModelTwo.showType()
//    }
//}
//
//let car1 = Car(engineModelOne: OffRoad(), engineModelTwo: OnRoad())
//car1.showType()
//let car2 = Car(engineModelOne: OffRoad(), engineModelTwo: OnRoad())
//car2.showType()
//--- END

///: E agora, e seu quisermos mudar o show type?

//--- INIT
// Solução
//protocol Engine {
//    func showType()
//}
//
//final class OffRoad: Engine {
//    func showType() {
//        print("OffRoad")
//    }
//}
//
//final class OnRoad: Engine {
//    func showType() {
//        print("Road")
//    }
//}
//
//public class Car {
//    private let engineModel: Engine // OCP here
//
//    init(model: Engine) {
//        self.engineModel = model
//    }
//
//    func showType() {
//        engineModel.showType()
//    }
//}
//
//let car1 = Car(model: OffRoad())
//car1.showType()
//let car2 = Car(model: OnRoad())
//car2.showType()
//--- END

///: Router e OCP

//--- INIT
//enum DeeplinkType {
//    case home
//    case settings
//}
//
//protocol Deeplink {
//    var type: DeeplinkType { get }
//}
//
//class HomeDeeplink: Deeplink {
//    let type: DeeplinkType = .home
//
//    func executeHome() {
//        // Presents the main screen
//    }
//}
//
//class SettingsDeeplink: Deeplink {
//    let type: DeeplinkType = .settings
//
//    func executeProfile() {
//        // Presents the profile screen
//    }
//}
//
//// Se nós adicionarmos qualquer novo caso de deeplink, exigirá uma refatoração dessa classe, quebrando o OCP
//class Router {
//    func execute(_ deeplink: Deeplink) {
//        switch deeplink.type {
//        case .home:
//            (deeplink as? HomeDeeplink)?.executeHome()
//        case .settings:
//            (deeplink as? SettingsDeeplink)?.executeProfile()
//        }
//    }
//}
//--- END

// Se quisermos respeitar OCP precisamos de uma nova estrutura
//--- INIT
//protocol Deeplink {
//    func execute()
//}
//
//class HomeDeeplink: Deeplink {
//    func execute() {
//        print("Push Home ->")
//    }
//}
//
//class SettingsDeeplink: Deeplink {
//    func execute() {
//        print("Push settings ->")
//    }
//}
//
//class Router {
//    func execute(_ deeplink: Deeplink) {
//        deeplink.execute()
//    }
//}
//--- END


//: [Next](@next)
