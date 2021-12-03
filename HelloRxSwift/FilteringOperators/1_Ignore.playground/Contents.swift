import UIKit
import RxSwift

// Ignore Element Filter
// It is helpful when you don't care about actual elements,
// but you do still want to fire the subscription
// when the particular sequence is completed.

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes
    .ignoreElements()
    .subscribe { _ in
        print("[Subscription is called]")
    }.disposed(by: disposeBag)

// publish some events by using onNext()
// If you publish some events, you are going to see that even though I am calling the publisher or calling the events,
// it never will fire the subscription.
// The reason is using "ignore elements filter(.ignoreElements())"
strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

// The subscription is only called when we fire the completed event.
strikes.onCompleted()
