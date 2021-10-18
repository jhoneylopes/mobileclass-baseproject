//: [Previous](@previous)

import Foundation

final class Master {
    var name: String
    private(set) var tables: [Table] = []
    private(set) var paylers: [Player] = []

    init(_ name: String) {
        self.name = name
        print("🟢 Init Master \(self.name)")
    }

    deinit {
        print("🔴 Deinit Master \(self.name)")
    }

    func addTable(_ table: Table) {
        self.tables.append(table)

    }

    func addPlayer(_ players: [Player]) {
        self.paylers = players
    }
}

final class Table { // Tabletop RPG System
    var system: String
    var master: Master?

    init(_ system: String) {
        self.system = system
        print("🟢 Init system \(self.system)")
    }

    deinit {
        print("🔴 Deinit system \(self.system)")
    }
}

final class Player {
    var name: String
    var master: Master?
    var table: Table?

    init(_ name: String, _ master: Master, _ table: Table) {
        self.name = name
        self.master = master
        self.table = table
        print("🟢 Init Player \(self.name)")
    }

    deinit {
        print("🔴 Deinit Player \(self.name)")
    }
}

do {
    let master = Master("Jhoney")
    let table = Table("D&D 3ª Edição")
    let player1 = Player("Player1", master, table)
    let player2 = Player("Player1", master, table)

    master.addTable(table)
    master.addPlayer([player1, player2])
}

//: [Next](@next)
