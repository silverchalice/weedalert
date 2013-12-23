//
//  WAWeedDetailViewController.m
//  WeedAlert
//
//  Created by Zachary Klein on 10/7/13.
//  Copyright (c) 2013 Silver Chalice, LLC. All rights reserved.
//

#import "WAWeedDetailViewController.h"

@interface WAWeedDetailViewController () <UIScrollViewDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *primaryImageView;
@property (weak, nonatomic) IBOutlet UILabel *properNameLabel;
@property (strong, nonatomic) IBOutlet UIWebView *descriptionWebView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) float webViewHeight;

@property (strong, nonatomic) Weed *weed;

@end

@implementation WAWeedDetailViewController

- (void)setWeed:(Weed *)weed {
    
    if(_weed) {
        _weed = nil;
    }
    
    _weed = weed;
    
}

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");

    [super viewDidLoad];
    
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if(self.weed) {
        self.nameLabel.text = [@"Name: " stringByAppendingString:self.weed.name];
        self.properNameLabel.text = [@"Proper Name: " stringByAppendingString:self.weed.properName];
        
        self.descriptionWebView = [[UIWebView alloc] initWithFrame:CGRectMake(21, 214, 278, 276)];
        self.descriptionWebView.userInteractionEnabled = NO;
        
        [self.descriptionWebView setDelegate:self];
        [self.descriptionWebView.scrollView setScrollEnabled:NO];
        
        [self.scrollView addSubview:self.descriptionWebView];
        
        
        self.navigationItem.title = self.weed.name;
        
    }
    NSLog(@"VDL - ScrollView contentSize: %f - %f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);

    
    
    [self.descriptionWebView loadHTMLString:self.weed.longDescription baseURL:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.descriptionWebView removeFromSuperview];
}


- (void)viewDidLayoutSubviews {
}


- (void)resizeWebView {
//    NSLog(@"viewDidLayoutSubviews");
    self.scrollView.delegate = self;
    [self.scrollView setScrollEnabled:YES];
    
    [self.descriptionWebView setFrame:(CGRect){
        self.descriptionWebView.frame.origin.x,
        self.descriptionWebView.frame.origin.y,
        self.descriptionWebView.frame.size.width,
        self.webViewHeight}];
    
    
    // 66points = status bar + nav bar height
    // 640 points = 1/2 height of the screen
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                             self.view.frame.size.height + self.descriptionWebView.frame.size.height - (self.scrollView.frame.size.height - self.descriptionWebView.frame.origin.y) );
    
    NSLog(@"VDLS - ScrollView contentSize: %f - %f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);
    NSLog(@"VDLS - DescriptionWebView frame: %f - %f", self.descriptionWebView.frame.size.height, self.descriptionWebView.frame.size.width);

}

#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
    NSLog(@"%@", [self.descriptionWebView stringByEvaluatingJavaScriptFromString:@"document.height"]);
    
    self.webViewHeight = [[self.descriptionWebView stringByEvaluatingJavaScriptFromString:@"document.height"] floatValue];
    
    NSLog(@"WVDFL - DescriptionWebView frame: %f - %f", self.descriptionWebView.frame.size.height, self.descriptionWebView.frame.size.width);
    NSLog(@"View size: %f - %f", self.view.frame.size.height, self.view.frame.size.width);

    
    [self resizeWebView];
}


@end
