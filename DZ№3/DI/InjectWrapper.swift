//
//  InjectWrapper.swift
//  DZ№3
//
//  Created by Egor Malyshev on 02.10.2021.
//

import Foundation

@propertyWrapper
struct Injected<Service: AnyObject> {
    
    private var service: Service?
    
    private weak var serviceLocator = ServiceLocator.shared
    
    public var wrappedValue: Service? {
        mutating get {
            if service == nil {
                service = serviceLocator?.resolve(type: Service.self)
            }
            return service
        }
        mutating set {
            service = newValue
        }
    }
    
    public var projectedValue: Injected<Service> {
        mutating set { self = newValue }
        get { return self }
    }
}
