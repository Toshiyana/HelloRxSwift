import UIKit
import RxSwift

// Element At Operator
let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()

// In the case of elementAt(2)
strikes.elementAt(2)
    .subscribe(onNext: { _ in
        print("[Subscription is called]")
    }).disposed(by: disposeBag)

// The index is starting from zero,
// so the subscritpion fires when onNext() was called three times
// (because of elementAt(2))
strikes.onNext("X")
strikes.onNext("X")
strikes.onNext("X")
