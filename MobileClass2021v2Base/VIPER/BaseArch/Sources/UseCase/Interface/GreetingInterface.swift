//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

protocol GreetingViewEventHandler {
    func didTapShowGreetingButton()
}

protocol GreetingView: AnyObject {
    func setGreeting(greeting: String)
}

protocol GreetingProviderType {
    func provideGreetingData() -> GreetingData
}

protocol GreetingInteractorType {
    func provideGreetingData()
}

protocol GreetingOutput: AnyObject {
    func receiveGreetingData(greetingData: GreetingData)
}
