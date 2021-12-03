import UIKit
import RxSwift

// TakeWhile Operator
let disposeBag = DisposeBag()

// "7" is false, so "8" and "10" are not called
Observable.of(2,4,6,7,8,10)
    .takeWhile {
        // returnは省略可能（skipWhileも同様）
       return $0 % 2 == 0
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
