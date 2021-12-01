//
//  NetworkManagerTests.swift
//  GuessTheMovieTests
//
//  Created by Yasmin Mohsen on 01/12/2021.
//

import XCTest
@testable import GuessTheMovie
class NetworkManagerTests: XCTestCase {

    var netWorkManager :Networkmanager!
    
    override func setUpWithError() throws {
        netWorkManager = Networkmanager()

    }

    override func tearDownWithError() throws {
        netWorkManager = nil
    }

    
    func testFetchingData(){
        
        let expc = expectation(description: "complete downloading")
        
        netWorkManager.get(request: Urls().url){[weak self] Result in
            switch(Result){
            
            case .success(let data):
                do{
                    let moviesArray = try JSONDecoder().decode([Movie].self, from: data)
                    expc.fulfill()
                    XCTAssert(moviesArray.count > 0)
                    
                    
                }
                catch(let error){
                    
                    print(error)
                    expc.fulfill()
                    XCTFail()
                }
                
                
            case .failure(let error):
                expc.fulfill()
                XCTFail()
              
            }
        }
        
        waitForExpectations(timeout: 4, handler: nil)
        
    }
    
    

}
