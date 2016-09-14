//
//  VideoSplashTests.swift
//  VideoSplashTests
//
//  Created by Toygar Dündaralp on 8/4/15.
//  Copyright (c) 2015 Toygar Dündaralp. All rights reserved.
//

import UIKit
import XCTest
import VideoSplash

class VideoSplashKitTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testVideoCut(){
    let expectation = self.expectation(description: "VideoCutter")
    let videoCutter = VideoCutter()
    let url = URL(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "mp4")!)
    videoCutter.cropVideoWithUrl(
      videoUrl: url,
      startTime: 11.0,
      duration: 1.0) { (videoPath, error) -> Void in
      if let path = videoPath as NSURL? {
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
          dispatch_async(dispatch_get_main_queue()) {
            XCTAssertNotNil(path, "video cut has failed")
            expectation.fulfill()
          }
        }
      }
    }
    self.waitForExpectations(timeout: 5.0, handler: nil)
  }
}
