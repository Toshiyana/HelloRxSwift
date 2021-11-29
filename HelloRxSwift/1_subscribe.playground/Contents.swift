import UIKit
import RxSwift

let observable = Observable.just(1) // 1だけ監視

// command + 右クリックで、Show Quick Helpでobservable2の型は「Observable<Int>」
let observable2 = Observable.of(1,2,3) // 1,2,3を監視

// 型を見ると、「Observable<[Int]>」
// -> arrayを割り当てると、型がarrayになる
let observable3 = Observable.of([1,2,3])

//型をみると、「Observable<Int>」
let observable4 = Observable.from([1,2,3,4,5])

// observable3, 4より、arrayにおけるof, fromの動作。
// of: Observable will be functional on whole array
// from: Observable will be functional on the individual element

// subscribeすると、eventとして、各要素に順にアクセス(observe)する
observable4.subscribe { event in
//    print(event)
////    出力
////    next(1)
////    next(2)
////    next(3)
////    next(4)
////    next(5)
////    completed
    
    if let element = event.element {
        print(element) // 要素にのみアクセス
//        出力
//        1
//        2
//        3
//        4
//        5
    }
}

observable3.subscribe { event in
    // In observable3, observe whole array
//    print(event)
////    出力
////    next([1, 2, 3])
////    completed
    
    if let element = event.element {
        print(element)
//        出力
//        [1, 2, 3]
        
    }
    
}

// 上記のif let elementによるunwrapping方法が基本的なやり方

// if let element以外で同じ動作のシンプルな書き方
observable4.subscribe(onNext: { element in
    print(element)
//    出力
//    1
//    2
//    3
//    4
//    5
})
