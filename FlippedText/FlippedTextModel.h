//
//  FlippedTextModel.h
//  FlippedText
//
//  Created by Chitradeep Dutta Roy on 27/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

@interface FlippedTextModel : NSObject {
    @private
    unichar map[1<<16];
}

+(FlippedTextModel *) instance;
-(NSString *) flippedString:(NSString *)inp;
@end
