//
//  RNLocalizable.h
//  RNLocalizable
//
//  Created by Fabricio Vergal on 08/01/18.
//  Copyright © 2018 Fabriciovergal. All rights reserved.
//

#ifndef RNLocalizable_h
#define RNLocalizable_h

#import <Foundation/Foundation.h>

#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#elif __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import "React/RCTBridgeModule.h"
#endif

@interface RNLocalizable : NSObject<RCTBridgeModule>
@property (nonatomic, assign) NSString *fallbackLanguage;
@end

#endif /* RNLocalizable_h */
