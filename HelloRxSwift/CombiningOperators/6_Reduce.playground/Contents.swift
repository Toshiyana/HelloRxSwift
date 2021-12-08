import UIKit
import RxSwift

let disposeBag = DisposeBag()

let source = Observable.of(1,2,3)

// parameter
// seed: where are we starting out at this particular point?
source.reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// This code is same work with the above.
// more clear than the above code (recommend use this)
source.reduce(0, accumulator: {
    summary, newValue in
    return summary + newValue
}).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
