//
//  MainViewController.h
//  iUOC
//
//  Created by Guillem Fernández González on 15/03/13.
//  Copyright (c) 2013 Guillem Fernández González. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OpenAPI;

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *authoriseButton;
@property (strong, nonatomic) UIWebView *authorisationWebView;


- (IBAction)switchAuthorisation:(id)sender;

- (id)initWithData:(OpenAPI *)oal;

@end
