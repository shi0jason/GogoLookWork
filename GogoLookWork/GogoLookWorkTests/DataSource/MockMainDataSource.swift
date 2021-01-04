//
//  MockMainDataSource.swift
//  GogoLookWorkTests
//
//  Created by Jason on 2021/1/3.
//  Copyright © 2021 Jason. All rights reserved.
//

import Foundation

class MockMainDataSource: MainDataSource {

    func fetchRequest(loadCount: Int, handler: @escaping (ResponseBody?, Error?) -> ()) {
        handler(DummyData.responseBody, nil)
    }
}
