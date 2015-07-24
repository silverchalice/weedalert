//
//  WAGalleryCell.m
//  WeedAlert
//
//  Created by Zachary Klein on 1/22/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import "WAGalleryCell.h"
#import "MHFacebookImageViewer.h"

@interface WAGalleryCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WAGalleryCell

- (id)initWithFrame:(CGRect)frame {
    NSLog(@"initing WAGalleryCell");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"WAGalleryCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
    }
    
    return self;
}

- (void) updateCell {

    UIImage *image = self.image;
    
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setImage:image];
    [self.imageView setupImageViewer];
    
}


@end
