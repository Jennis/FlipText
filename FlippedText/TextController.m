//
//  TextController.m
//  FlippedText
//
//  Created by Chitradeep Dutta Roy on 28/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TextController.h"
#import "FlippedTextModel.h"
#import "NSString+Flipped.h"

@implementation TextController
@synthesize input,output;

-(IBAction)hideKeyboard:(id)sender {
    [input resignFirstResponder];
}

-(IBAction)copyInput:(id)sender {
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    paste.string = output.text;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)textViewDidChange:(UITextView *)textView {
    
    output.text = [input.text flipText];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
