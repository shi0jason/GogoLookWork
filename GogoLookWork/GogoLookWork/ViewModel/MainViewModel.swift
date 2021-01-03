//
//  MainViewModel.swift
//  GogoLookWork
//
//  Created byJason on 2021/1/3.
//  Copyright © 2021Jason. All rights reserved.
//

import Foundation

class MainViewModel {
    
    private var responseBody: ResponseBody?
    
    func fetchRequest(handler: @escaping(ResponseBody?, Error?) -> ()) {
        let targetUrl = "https://api.jikan.moe/v3/top/anime/1/upcoming"
        let request = RequestSet(url: targetUrl,
                                 method: .get,
                                 parameters: nil,
                                 headers: nil)
        
        HttpHelper.sharedInstance.httpAction(request: request) { (ResponseBody, Error) in
            if let body = ResponseBody {
                self.responseBody = body
            }
            handler(ResponseBody, Error)
        }
    }
    
    var numberOfSections: Int {
        if let count = responseBody?.top?.count  {
            return count
        }
        return 0
    }

    func cellViewModel(at indexPath: IndexPath) -> TopObject? {
        if let tops = responseBody?.top,
            let count = responseBody?.top?.count,
            indexPath.item < count {
            return tops[indexPath.item]
        }
        return nil
    }
}

