import UIKit

prefix func !<T>(keyPath: KeyPath<T, Bool>) -> (T) -> Bool {
    { !$0[keyPath: keyPath] }
}

func ==<T, V: Equatable>(lhs: KeyPath<T, V>, rhs: V) -> (T) -> Bool {
    { $0[keyPath: lhs] == rhs }
}

func !=<T, V: Equatable>(lhs: KeyPath<T, V>, rhs: V) -> (T) -> Bool {
    { $0[keyPath: lhs] != rhs }
}

struct Model {
    enum SomeType {
        case free
        case own
    }

    let type: SomeType
    let isAvailable: Bool
}

let songs: [Model] = [
    Model(type: .free, isAvailable: true),
    Model(type: .own, isAvailable: false)
]

songs.filter(!\.isAvailable)
songs.filter(\.type == .free)
songs.filter(\.type != .own)
