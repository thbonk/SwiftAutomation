//
//  SwiftAEFormatter.swift
//  SwiftAE
//
//  Swift-ObjC shim
//
//

import Foundation



@objc public class SwiftAEFormatter: NSObject {
    @objc public class func formatAppleEvent(_ event: NSAppleEventDescriptor, useSDEF: Bool) -> String {
        return SwiftAEFormatAppleEvent(event, useTerminology: useSDEF ? .sdef : .aete)
    }
}

