//
//  MainDataSource.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/3.
//  Copyright © 2021 Jason. All rights reserved.
//


protocol MainDataSource {

    func fetchRequest(loadCount: Int, handler: @escaping(ResponseBody?, Error?) -> ())
}
