//
//  Protocols.swift
//  DataTransferTask-1
//
//  Created by Berkay on 5.09.2022.
//

import Foundation


protocol DataTransferProtocol {
    // Data transfer from CreateAccountVC to ViewController
    func data(name: String?, department: String?, email: String?, phone: String?)
}
