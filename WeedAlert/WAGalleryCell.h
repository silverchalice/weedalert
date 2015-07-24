//
//  WAGalleryCell.h
//  WeedAlert
//
//  Created by Zachary Klein on 1/22/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//  Based on CMFGallerCell -- http://adoptioncurve.net/archives/2013/04/creating-a-paged-photo-gallery-with-a-uicollectionview/

#import <UIKit/UIKit.h>

@interface WAGalleryCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

-(void)updateCell;

@end
