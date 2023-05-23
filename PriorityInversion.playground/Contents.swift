import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
var greeting = "Hello, playground"

let highPriority = DispatchQueue.global(qos: .userInitiated)
let lowPriority = DispatchQueue.global(qos: .utility)
let defaultPriority = DispatchQueue.global(qos: .default)

let semaPhore = DispatchSemaphore.init(value: 1)


func printEmoji(queue:DispatchQueue,emoji:String){
    queue.async {
        debugPrint("\(emoji) waiting")
        semaPhore.wait()
        for i in 0...10{
            debugPrint("\(emoji) \(i)")
        }
        debugPrint("\(emoji) signal")
        semaPhore.signal()
    }
}
printEmoji(queue:lowPriority,emoji:"🚗")
printEmoji(queue:highPriority,emoji:"🚑")
printEmoji(queue: defaultPriority, emoji: "🚙") //low priority task execure first

 
