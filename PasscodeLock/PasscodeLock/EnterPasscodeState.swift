//
//  EnterPasscodeState.swift
//  PasscodeLock
//
//  Created by Yanko Dimitrov on 8/28/15.
//  Copyright © 2015 Yanko Dimitrov. All rights reserved.
//

import Foundation

struct EnterPasscodeState: PasscodeLockStateType {
    
    let title: String
    let description: String
    let isCancellableAction = false
    var isTouchIDAllowed = true
    
    init() {
        
        title = localizedStringFor("PasscodeLockEnterTitle", comment: "Enter passcode title")
        description = localizedStringFor("PasscodeLockEnterDescription", comment: "Enter passcode description")
    }
    
    func acceptPasscode(passcode: [String], fromLock lock: PasscodeLockType) {
        
        guard let currentPasscode = lock.repository.passcode else {
            assertionFailure("There is no saved passcode")
            return
        }
        
        if passcode == currentPasscode {
            
            lock.delegate?.passcodeLockDidSucceed(lock)
            
        } else {
            
            lock.delegate?.passcodeLockDidFail(lock)
        }
    }
}