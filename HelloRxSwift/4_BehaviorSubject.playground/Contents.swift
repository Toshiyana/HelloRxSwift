import UIKit
import RxSwift

// Behavior Subject
// Behavior Subject is similar to Publish Subject with one difference

// Difference
// * have initial value
// reason: you have to pass the initial value when you subscribe to it,
//         they will give you that all value or the initial value or the last value.

let disposeBag = DisposeBag()

let subject = BehaviorSubject(value: "Initial Value")

subject.onNext("Last Issue") // Last Valueが"Initial Value"でなくなるので、"Last Issue"が呼ばれる

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 1")
