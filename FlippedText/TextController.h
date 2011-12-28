//
//  TextController.h
//  FlippedText
//
//  Created by Chitradeep Dutta Roy on 28/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextController : UIViewController <UITextViewDelegate>

@property (nonatomic,retain) IBOutlet UITextView *input;
@property (nonatomic,retain) IBOutlet UITextView *output;

-(IBAction)hideKeyboard:(id)sender;
-(IBAction)copyInput:(id)sender;

@end
