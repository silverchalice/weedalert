//
//  WAWeedDetailViewController.m
//  WeedAlert
//
//  Created by Zachary Klein on 10/7/13.
//  Copyright (c) 2013 Silver Chalice, LLC. All rights reserved.
//

#import "WAWeedDetailViewController.h"
#import "WAGalleryCell.h"
#import "Product.h"

@interface WAWeedDetailViewController () <UIWebViewDelegate>

@property (strong, nonatomic) Weed *weed;

@property (weak, nonatomic) IBOutlet UICollectionView *imageGalleryCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *properNameLabel;

@property (weak, nonatomic) IBOutlet UIWebView *descriptionWebView;
@property (weak, nonatomic) IBOutlet UIWebView *managementWebView;
@property (weak, nonatomic) IBOutlet UIWebView *herbUseWebView;
@property (weak, nonatomic) IBOutlet UIWebView *productRecommendationWebView;

@property (weak, nonatomic) IBOutlet UIImageView *distributionMapImageView;
@property (weak, nonatomic) IBOutlet UIImageView *germinationMapImageView;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *germZones;

@end

NSDictionary *germMonthValues;

@implementation WAWeedDetailViewController

+ (void)initialize {
    germMonthValues = @{@2: @"Jan",
                        @4: @"Feb",
                        @8: @"Mar",
                        @16: @"Apr",
                        @32: @"May",
                        @64: @"June",
                        @128: @"July",
                        @256: @"Aug",
                        @512: @"Sept",
                        @1024: @"Oct",
                        @2048: @"Nov",
                        @4096: @"Dec"};
}

- (void)setWeed:(Weed *)weed {
    
    if(_weed) {
        _weed = nil;
    }
    _weed = weed;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.weed) {
        self.navigationItem.title = self.weed.name;
        self.properNameLabel.text = [@"Proper Name: " stringByAppendingString:self.weed.properName];
 
        [self setupImageGallery];
        
        [self setupGerminationZones];
         
         NSString *cssPath = [[NSBundle mainBundle] pathForResource:@"weed" ofType:@"css"];
         NSData *cssData = [NSData dataWithContentsOfFile:cssPath];
         NSString *cssString = [[NSString alloc] initWithData:cssData encoding:NSASCIIStringEncoding];

        
        [self.descriptionWebView setDelegate:self];
        self.descriptionWebView.userInteractionEnabled = NO;
        [self.descriptionWebView loadHTMLString:[NSString stringWithFormat:@"%@%@", self.weed.longDescription, cssString] baseURL:nil];

        [self.managementWebView setDelegate:self];
        self.managementWebView.userInteractionEnabled = NO;
        [self.managementWebView loadHTMLString:[NSString stringWithFormat:@"%@%@", self.weed.management, cssString] baseURL:nil];
        
        [self.herbUseWebView setDelegate:self];
        self.herbUseWebView.userInteractionEnabled = NO;
        [self.herbUseWebView loadHTMLString:[NSString stringWithFormat:@"%@%@", self.weed.herbUse, cssString] baseURL:nil];
        
        
        [self.productRecommendationWebView setDelegate:self];
        self.productRecommendationWebView.userInteractionEnabled = YES;
        self.productRecommendationWebView.scrollView.scrollEnabled = NO;
        [self.productRecommendationWebView loadHTMLString:[NSString stringWithFormat:@"%@%@", [self generateProductRecommendationString], cssString] baseURL:nil];
        
        [self loadDistributionMap];

    } else {
        NSLog(@"No weed!");
    }
}


- (NSString *)generateProductRecommendationString {
    
    
    NSSet *products = self.weed.products;
    __block NSString *html = @"<ul>";
    
    [products enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        Product *product = obj;
        
        html = [html stringByAppendingString:[NSString stringWithFormat:@"<li><a href='%@'>%@</a></li>", product.url, product.name]];
    
    }];
    
    
    html = [html stringByAppendingString:@"</ul>"];
    
    return html;
}


- (void)resizeWebView:(UIWebView *)webView {
    float webViewHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.height"] floatValue];
    
    [webView setFrame:(CGRect){
        webView.frame.origin.x,
        webView.frame.origin.y,
        webView.frame.size.width,
        webViewHeight}];
    

    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
    [webView setBounds:(CGRect){
        webView.bounds.origin.x,
        webView.bounds.origin.y,
        webView.bounds.size.width,
        webViewHeight}];
    
    [webView setCenter:CGPointMake(webView.frame.size.width / 2, webViewHeight / 2)];
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==3) {
        return self.descriptionWebView.frame.size.height;
    }
    else if (indexPath.row==9) {
        return self.managementWebView.frame.size.height;
    } else if (indexPath.row==11) {
        return self.herbUseWebView.frame.size.height;
    } else if (indexPath.row==13) {
        return self.productRecommendationWebView.frame.size.height;
    } else{
        // return height from the storyboard
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}

#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self resizeWebView:webView];
}

-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    if ( inType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL:[inRequest URL]];
        return NO;
    }
    
    return YES;
}


#pragma mark UICollectionViewDatasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.weed images] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WAGalleryCell *cell = (WAGalleryCell *)[self.imageGalleryCollectionView dequeueReusableCellWithReuseIdentifier:@"galleryCell" forIndexPath:indexPath];
    
    UIImage *image = [[self.weed images] objectAtIndex:indexPath.row];
    cell.image = image;
    [cell updateCell];
    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
        return CGSizeMake(375, 240);
}


- (void)setupImageGallery {
    [self.imageGalleryCollectionView registerClass:[WAGalleryCell class] forCellWithReuseIdentifier:@"galleryCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    
    [self.imageGalleryCollectionView setPagingEnabled:YES];
    [self.imageGalleryCollectionView setCollectionViewLayout:flowLayout];
}

- (void)loadDistributionMap {

    UIImage *map = [UIImage imageNamed:[NSString stringWithFormat: @"map%@.png", self.weed.waId]];
    self.distributionMapImageView.image = map;
    
}

- (void)setupGerminationZones {

    for (UILabel *germZoneLabel in self.germZones) {
        NSString *text = [self evaluateGermZoneForLabel:germZoneLabel];
        germZoneLabel.text = text;
    }
    
}


- (NSString *)evaluateGermZoneForLabel:(UILabel *)germZoneLabel {
    
    NSNumber *germValue = [self.weed valueForKey:[NSString stringWithFormat:@"germ%ld", (long)germZoneLabel.tag]];
    
    if ([germValue intValue] == 0) {
        return @"";
    } else {
        NSString *matchingMonth = [germMonthValues objectForKey:germValue];
        if (matchingMonth) {
            return [NSString stringWithFormat:@"Zone %ld: %@", (long)germZoneLabel.tag, matchingMonth];
        } else {
        
            NSMutableArray *results = [[NSMutableArray alloc] init];
            
            int topValue = 4096;
            int nextGermValue = [germValue intValue];
            
            while (topValue > 1) {
                
                if (topValue <= nextGermValue) {
                    [results addObject: [NSNumber numberWithInt:topValue]];
                    nextGermValue = nextGermValue - topValue;
                }
                
                topValue = topValue / 2;
            }
            
            results = [[results sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
            
            NSString *germZoneText = [NSString stringWithFormat:@"%@ - %@", [[germMonthValues objectForKey:results[0]] description], [[germMonthValues objectForKey:results[1]] description]];
            
            return [NSString stringWithFormat:@"Zone %ld: %@", (long)germZoneLabel.tag, germZoneText];
        }
    }
}

@end
