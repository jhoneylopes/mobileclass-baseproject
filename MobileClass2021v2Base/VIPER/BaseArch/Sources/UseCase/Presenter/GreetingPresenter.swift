//  Copyright © 2017 Jhoney Lopes. All rights reserved.

import Foundation

class GreetingPresenter: GreetingOutput, GreetingViewEventHandler {
    weak var view: GreetingView?
    var greetingInteractor: GreetingInteractor?

    func didTapShowGreetingButton() {
        self.greetingInteractor?.provideGreetingData()
    }

    func receiveGreetingData(greetingData: GreetingData) {
        let greeting = greetingData.greeting + " " + greetingData.subject        
        self.view?.setGreeting(greeting: greeting)
    }
}
