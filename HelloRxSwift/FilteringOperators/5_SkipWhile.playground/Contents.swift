import UIKit
import RxSwift

// SkipWhile Operator

let disposeBag = DisposeBag()

// Once the condition is false, after the condition,
// all the numbers are becoming a part of sequence.
Observable.of(2,2,3,4,4)
    .skipWhile { $0 % 2 == 0 }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
