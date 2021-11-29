import UIKit
import RxSwift
import RxRelay

// Behavior Relay is alternative of using variables
// To use Behavior Relay, you have to install 'RxRelay' library by cocoapods

let disposeBag = DisposeBag()

let relay = BehaviorRelay(value: "Initial Value")

relay.asObservable()
    .subscribe {
        print($0)
    }

// change the value of the Behavior Relay
relay.accept("Hello world")



// In the case of array
let relay2 = BehaviorRelay(value: ["Item 1"])
//let relay2 = BehaviorRelay(value: [String]()) // you can define no element array

// add element in this array

// pattern 1
var value = relay2.value
value.append("Item 2")
value.append("Item 3")
relay2.accept(value)

// pattern 2
//relay2.accept(relay2.value + ["Item 2"])

relay2.asObservable()
    .subscribe {
        print($0)
    }
