import UIKit
import RxSwift

// Skip Until Operator
let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

// Everything is skipped until it pass something to the trigger.
// This means that I can go ahead and add mutiple subject on next and different values to it
subject.skipUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// ignored "A" and "B" until we pass something to the trigger
subject.onNext("A")
subject.onNext("B")

// pass something to the trigger
trigger.onNext("X")

subject.onNext("C")
