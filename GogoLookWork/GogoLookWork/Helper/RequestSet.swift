//
//  RequestSet.swift
//  GogoLookWork
//
//  Created byJason on 2021/1/3.
//  Copyright © 2021Jason. All rights reserved.
//
import Alamofire

struct RequestSet {
    let url: URLConvertible
    let method: Alamofire.HTTPMethod
    let parameters: Parameters?
    let headers: HTTPHeaders?
}
