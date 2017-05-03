//
//  NodeExtension.swift
//  VaporStencilProvider
//
//  
//
//

import Vapor

extension Node {
    var rawValue:Any {
        switch(self) {
        case Node.null:
            return ""
        case Node.bool(let boolValue):
            return boolValue
        case Node.array(let nodes):
            return nodes.map { $0.rawValue }
        case Node.bytes(let bytes):
            return bytes
        case Node.object(let dict):
            var newDict = [String:Any]()
            dict.allItems.forEach({ key, value in
                newDict[key] = value.rawValue
            })
            return newDict
        case Node.number(let number):
            switch number {
            case Node.Number.double(let doubleValue):
                return doubleValue
            case Node.Number.int(let intValue):
                return intValue
            case Node.Number.uint(let uintValue):
                return uintValue
            default:
                return number.double
            }
        case Node.string(let str):
            return str
        default:
            return ""
        }
    }
}
