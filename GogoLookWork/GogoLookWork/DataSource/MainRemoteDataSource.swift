//
//  MainRemoteDataSource.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/3.
//  Copyright © 2021 Jason. All rights reserved.
//

class MainRemoteDataSource: MainDataSource {

    func fetchRequest(handler: @escaping (ResponseBody?, Error?) -> ()) {
        let targetUrl = "https://api.jikan.moe/v3/top/anime/1/upcoming"
        let request = RequestSet(url: targetUrl,
                                 method: .get,
                                 parameters: nil,
                                 headers: nil)
        
        HttpHelper.sharedInstance.httpAction(request: request, handler: handler)
    }
}
