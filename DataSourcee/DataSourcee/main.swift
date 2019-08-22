//
//  Main.swift
//  DataSourcee
//
//  Created by IvanLyuhtikov on 8/18/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

var size: Int? = .none

enum Tree<T> {
    case leaf(T)
    indirect case branch(Tree<T>, Tree<T>)
}

var tree = Tree.branch(
           .branch(.leaf(1), .leaf(2)),
           .branch(.leaf(3), .branch(.leaf(34), .leaf(34))))

class Car: Hashable {
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.speed == rhs.speed
    }
    
    private let maxSpeed: UInt16 = 350
    private let minSpeed: UInt16 = 60
    private(set) var name: String
    
    init(mark: String = "Unknown") {
        name = mark
    }
    
    var speed: UInt16 {
        return UInt16.random(in: minSpeed...maxSpeed)
    }
    
}







/*
//MARK: -ClassIntegerRef
class IntegerRef {
    @objc let objValue: Int
    
    
    init(_ value: Int) {
        self.objValue = value
    }
    
    @objc class func gotDefault() -> Int {
        return 42
    }
    
    @objc func obj() -> Int {
        return 9
    }
    var version: Int = 0
    
}


//MARK: -Func
@discardableResult func getDefaultValue(_ anyClass: AnyClass, _ anyObj: AnyObject) -> Int? {
    anyClass.gotDefault() //objc calling
    anyObj.version
    return 1
}

func getObject() -> AnyObject {
    return IntegerRef(100)
}

let objVar: AnyObject = getObject()
let z = IntegerRef.self

getDefaultValue(IntegerRef.self, IntegerRef.self)


var thread = pthread_t(bitPattern: 0)
var attribute = pthread_attr_t()
pthread_attr_init(&attribute)
pthread_attr_set_qos_class_np(&attribute, QOS_CLASS_USER_INTERACTIVE, 0)
pthread_create(&thread, &attribute, { (pointer) -> UnsafeMutableRawPointer? in
    for i in 0...1000000 {
        print(i)
    }
    pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
    
    return nil
}, nil)
 */

let thread = Thread {
    
    print("test")
    print(qos_class_self())
}
thread.qualityOfService = .userInitiated
thread.start()
print(qos_class_main())

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(MyApplication.self),
    NSStringFromClass(AppDelegate.self)
)



