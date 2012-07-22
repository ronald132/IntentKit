//
//  ISKIntentPickerViewController.m
//  IntentKit
//
//  Created by Zac Bowling on 7/21/12.
//  Copyright (c) 2012 IntentKit. All rights reserved.
//

#import "ISKIntentPickerViewController.h"
#import "ISKIntentListViewController.h"
#import "IntentKit.h"

@interface ISKIntentPickerViewController () {
	ISKIntent *_intent;
	ISKIntentListViewController *_listViewController;
}

@end

@implementation ISKIntentPickerViewController 

@dynamic delegate;

- (id)initWithIntent:(ISKIntent *)intent
{
	ISKIntentListViewController *intentListViewController = [[ISKIntentListViewController alloc] initWithIntent:intent];
	
    self = [super initWithRootViewController:intentListViewController];
    if (self) {
        _intent = intent;
		_listViewController = intentListViewController;
		_listViewController.delegate = self;
		_listViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(doCancel:)]
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)intentListViewController:(ISKIntentListViewController *)controller didSelectApp:(NSDictionary *)app 
{
	NSURL *url = [ISKIntentManager URLForApp:app withItent:_intent];
	
	[self.delegate intentPickerViewController:self didSelectToOpenIntent:_intent withURL:url];
}

-(void)doCancel:(id)sender 
{
	[self.delegate intentPickerViewControllerDidCancel:self];
}

@end
