import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let userInteractive = DispatchQueue.global(qos: .userInteractive)
let userInitiated = DispatchQueue.global(qos: .userInitiated)
let defaultPriority = DispatchQueue.global(qos: .default)
let utility = DispatchQueue.global(qos: .utility)
let background = DispatchQueue.global(qos: .background)
let unspecified = DispatchQueue.global(qos: .unspecified)

let semaPhore = DispatchSemaphore.init(value: 1)

func printEmoji(queue:DispatchQueue,emoji:String){
    queue.async {
        debugPrint("\(emoji) waiting")
        semaPhore.wait()
        for i in 0...3{
            debugPrint("\(emoji) \(i)")
        }
        debugPrint("\(emoji) signal")
        semaPhore.signal()
    }
}
printEmoji(queue: userInitiated, emoji:"🚜")
printEmoji(queue: userInteractive, emoji:"🚒")
printEmoji(queue: defaultPriority, emoji:"🚚")
printEmoji(queue:utility,emoji:"🚗")
printEmoji(queue: background, emoji:"🚙")
printEmoji(queue: unspecified, emoji:"🛵")


 
