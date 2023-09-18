//
//  Observable.swift
//  LoginMVVM
//
//  Created by 정경우 on 2023/09/18.
//

import Foundation

class Observable<T> {
   private var listener: ((T) -> ())?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> () ) {
        closure(value)
        listener = closure
        print(type(of: listener))
    }
}
