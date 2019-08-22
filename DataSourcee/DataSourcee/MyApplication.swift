//
//  MyApplication.swift
//  DataSourcee
//
//  Created by IvanLyuhtikov on 8/18/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import UIKit

class MyApplication: UIApplication {
    override func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        if let host = url.host, host.contains("hackingwithswift.com") {
            super.open(url, options: options, completionHandler: completion)
        } else {
            completion?(false)
        }
    }
}
