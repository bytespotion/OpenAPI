//
//  MainViewController.m
//  iUOC
//
//  Created by Guillem Fernández González on 15/03/13.
//  Copyright (c) 2013 Guillem Fernández González. All rights reserved.
//

#import "MainViewController.h"
#import "OpenAPI.h"

@interface MainViewController ()
{
    OpenAPI *_oal;
}
@end

@implementation MainViewController

- (id)initWithData:(OpenAPI *)oal
{
    self = [super init];
    
    if (self) {
        _oal = oal;
    }
    
    return  self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([_oal isUserAuthorised])
        [_authoriseButton setImage:[UIImage imageNamed:@"connected.png"] forState:UIControlStateNormal];
    else
        [_authoriseButton setImage:[UIImage imageNamed:@"disconnected.png"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchAuthorisation:(id)sender {
    
    if ([_oal isUserAuthorised]) {
        [_oal deauthorize];
        [_authoriseButton setImage:[UIImage imageNamed:@"disconnected.png"] forState:UIControlStateNormal];
    } else {
        CGRect webViewFrame = CGRectMake(10, 10, 300, 300);
        _authorisationWebView = [[UIWebView alloc] initWithFrame:webViewFrame];
        [self.view addSubview:_authorisationWebView];
        [_oal authoriseUsingWebView:_authorisationWebView];
    }
}


@end
