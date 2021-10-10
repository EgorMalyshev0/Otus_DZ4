//
//  ServiceLocator.swift
//  DZ№3
//
//  Created by Egor Malyshev on 02.10.2021.
//

import Foundation


class ServiceLocator: NSObject {
    
    static let shared: ServiceLocator = .init()
    
    private var services = [String: AnyObject]()
    
    func register<T: AnyObject>(service: T) {
        let key = "\(T.self)"
        if services[key] == nil {
            services[key] = service
        }
    }
    
    func resolve<T: AnyObject>(type: T.Type) -> T? {
        let key = "\(T.self)"
        return services[key] as? T
    }
    
    func remove<T: AnyObject>(type: T.Type) {
        let key = "\(T.self)"
        _ = services.removeValue(forKey: key)
    }
}
