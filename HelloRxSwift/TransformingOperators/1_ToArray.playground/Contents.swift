import UIKit
import RxSwift

let disposeBag = DisposeBag()

Observable.of(1,2,3,4,5)
    .toArray()
    .subscribe(onSuccess: {
        print($0)
    }).disposed(by: disposeBag)
