//
//  ChangePassword.swift
//
//  Copyright (c) 2019 Cherrylabs Technologies (http://cherrylabs.com/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

final class ChangePassword: RequestModel {
    
    typealias Response = MsgResponse
    
    var path: String {
        return "/servicedesk/api/v1/profile/password"
    }
    
    var isAuthorizedRequest: Bool {
        return AsistaCore.shared.accessToken.isEmpty ? false : true
    }
    
    var httpMethod: HTTP {
        return .post
    }
    
    var headerField: [String: String] {
        var header: [String: Any] = [:]
        header.appendingQueryParameter(key: "Content-Type", value: "application/json")
        return header as! [String : String]
    }
    
    var httpBody: Data? {
        var body: [String: Any] = [:]
        body.appendingQueryParameter(key: "oldPassword", value: old)
        body.appendingQueryParameter(key: "newPassword", value: new)
        let jsonData = try? JSONSerialization.data(withJSONObject: body, options: [.prettyPrinted])
        return jsonData
    }
    
    
    private let old: String
    
    private let new: String
    
    init(old: String, new: String) {
        self.old = old
        self.new = new
    }
}
