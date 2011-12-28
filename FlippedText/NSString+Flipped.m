//
//  NSString+Flipped.m
//  FlippedText
//
//  Created by Chitradeep Dutta Roy on 28/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+Flipped.h"
#import "GDataXMLNode.h"

@implementation NSString (Flipped)
-(NSString *) flipText {
    unichar map[1<<16];
    
    NSError *err;
    
    for (int i=0; i<(1<<16); ++i) {
        map[i] = i;
    }
    
    GDataXMLDocument *dom = [[GDataXMLDocument alloc] initWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flipMap.xml" ofType:nil]] options:0 error:&err];
    
    if (dom==nil) {
        NSLog(@"%@",err);
        return nil;
    }
    
    NSArray *arr = [dom.rootElement elementsForName:@"tr"];
    
    int i=0;
    for (GDataXMLElement *el in arr) {
        if (!i) {
            ++i;
            continue;
        }
        
        NSArray *data = [el elementsForName:@"td"];
        //NSLog(@"%d",i);
        
        NSString *from = [NSString stringWithString:[[data objectAtIndex:0] stringValue]];
        NSString *to = [NSString stringWithString:[[data objectAtIndex:1] stringValue]];
        
        //NSLog(@"%C | %C",[from characterAtIndex:0],[to characterAtIndex:0]);
        
        map[[from characterAtIndex:0]] = [to characterAtIndex:0];
        map[[to characterAtIndex:0]] = [from characterAtIndex:0];
        
        ++i;
    }
    
    //Special Entries From WikiPedia
    
    map['1'] = 0x21C2;
    map['2'] = 0x1105;
    map['5'] = 0x078E;
    
    //NSLog(@"%@",self);
    
    NSUInteger len = [self length];
    //NSLog(@"%d",len);
    
    unichar *t;
    t = (unichar *)malloc((len+1)*sizeof(unichar));
    
    NSString *flip;
    
    for (int i=0; i<len; ++i) {
        t[i] = map[[self characterAtIndex:i]];
    }
    t[len] = '\0';
    
    flip = [NSString stringWithCharacters:t length:len];
    //NSLog(@"%@",flip);
    
    free(t);
    
    return flip;
}
@end
