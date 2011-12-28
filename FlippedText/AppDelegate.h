//
//  AppDelegate.h
//  FlippedText
//
//  Created by Chitradeep Dutta Roy on 27/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlippedTextModel.h"
#import "TextController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    TextController *t;
}

@property (strong, nonatomic) UIWindow *window;

@end
