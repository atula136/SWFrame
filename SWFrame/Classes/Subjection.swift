//
//  Subjection.swift
//  SWFrame
//
//  Created by 杨建祥 on 2020/5/16.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift
import ObjectMapper
import Cache

public var subjects: [String: Any] = [:]

final public class Subjection {
    
    public class func `for`<T: Subjective>(_ type: T.Type) -> BehaviorRelay<T?> {
        let key = String(describing: type)
        if let subject = subjects[key] as? BehaviorRelay<T?> {
            return subject
        }
        let subject = BehaviorRelay<T?>(value: type.current)
        subjects[key] = subject
        return subject
    }
    
}

public protocol Subjective {
    static var current: Self? { get }
}

public extension Subjective {
    static var current: Self? {
        return nil
    }
}

