import UIKit
import RxSwift

// The method of disposing subscription
// if you don't dispose, memory leaks happen.

// responsible for disposing that paticular observable
let disposeBag = DisposeBag()

Observable.of("A", "B", "C")
    .subscribe {
        print($0)
    }.disposed(by: disposeBag)


// Create function (= different way of creating observation)
// Create function is similar to subscription

Observable<String>.create { observer in
    
    // gives observerable to create function
    
    // observable
    observer.onNext("A")
    observer.onCompleted() // after calling observer, call onCompleted()
    observer.onNext("?") // never call because of completing above
    
    // Create function has to return Disposable
    // differen way to create the disposable from DisposeBag()
    return Disposables.create()
    
    // Once we have created the observable, we can subscribe to it.
}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("Completed") }, onDisposed: { print("Disposed") })
    .disposed(by: disposeBag) // if you called subscriber, don't forget call disposed()
