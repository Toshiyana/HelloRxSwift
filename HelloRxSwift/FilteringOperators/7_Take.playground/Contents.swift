import UIKit
import RxSwift

// Take Operator
let disposeBag = DisposeBag()

Observable.of(1,2,3,4,5,6)
    .take(3)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
