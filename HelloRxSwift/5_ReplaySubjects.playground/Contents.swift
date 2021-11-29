import UIKit
import RxSwift

// Replay Subjects
// Replay Subjects basically relays the events based on the buffar size that you're going to set

let disposeBag = DisposeBag()

// This means when new subscribers are going to subscribe to this subject,
// they will automatically replay the last two values that were emitted by that subject.
let subject = ReplaySubject<String>.create(bufferSize: 2) // emit last 2 events

// emit sum values
subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")

subject.subscribe {
    print($0)
    // output last 2 event (because of buffer size 2)
    // next(Issue 2)
    // next(Issue 3)
}

subject.onNext("Issue 4")
subject.onNext("Issue 5")
subject.onNext("Issue 6")

print("[Subscription 2]")
subject.subscribe {
    print($0)
    // output last 2 event (because of buffer size 2)
    // next(Issue 5)
    // next(Issue 6)
}
