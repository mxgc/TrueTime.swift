//
//  NTPExtensionsSpec.swift
//  TrueTime
//
//  Created by Michael Sanders on 7/18/16.
//  Copyright © 2016 Instacart. All rights reserved.
//

@testable import TrueTime
import Nimble
import Quick
import SwiftCheck
import Foundation
import ObjCTrueTime

final class NTPExtensionsSpec: QuickSpec {
    override func spec() {
        it("ntp_time64_t") {
            property("Matches timeval precision") <- forAll(timeval.arbitraryPositive) { time in
                let ntp = ntp_time64_t(timeSince1970: time)
                return ntp.milliseconds == time.milliseconds
            }
        }
    }
}
