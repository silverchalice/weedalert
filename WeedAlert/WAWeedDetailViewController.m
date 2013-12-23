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
@property (weak, nonatomic) IBOutlet UIWebView *descriptionWebView;
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
    
    if(self.weed) {
        self.nameLabel.text = [@"Name: " stringByAppendingString:self.weed.name];
        self.properNameLabel.text = [@"Proper Name: " stringByAppendingString:self.weed.properName];
        
        [self.descriptionWebView setDelegate:self];
        [self.descriptionWebView.scrollView setScrollEnabled:NO];
        [self.descriptionWebView loadHTMLString:self.weed.longDescription baseURL:nil];
        
        self.navigationItem.title = self.weed.name;
        
    }
        NSLog(@"VDL - ScrollView contentSize: %f - %f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);
    
}


- (void)viewDidLayoutSubviews {
        NSLog(@"viewDidLayoutSubviews");
    self.scrollView.delegate = self;
    [self.scrollView setScrollEnabled:YES];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                             self.view.frame.size.height + self.webViewHeight);
    
    [self.descriptionWebView setFrame:(CGRect){
        self.descriptionWebView.frame.origin.x,
        self.descriptionWebView.frame.origin.y,
        self.descriptionWebView.frame.size.width,
        self.webViewHeight}];

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

    
    
}


@end
