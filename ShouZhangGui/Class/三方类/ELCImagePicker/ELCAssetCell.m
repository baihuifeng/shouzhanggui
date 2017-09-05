//
//  AssetCell.m
//
//  Created by ELC on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "ELCAssetCell.h"
#import "ELCAsset.h"
#import "ELCConsole.h"
#import "ELCOverlayImageView.h"

static CGFloat thumbnail_width = 0;
static CGFloat thumbnail_borde = 2;

@interface ELCAssetCell ()

@property (nonatomic, strong) NSArray *rowAssets;
@property (nonatomic, strong) NSMutableArray *imageViewArray;
@property (nonatomic, strong) NSMutableArray *overlayViewArray;

@end

@implementation ELCAssetCell

//Using auto synthesizers

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	if (self) {
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped:)];
        [self addGestureRecognizer:tapRecognizer];
        
        NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:4];
        self.imageViewArray = mutableArray;
        
        NSMutableArray *overlayArray = [[NSMutableArray alloc] initWithCapacity:4];
        self.overlayViewArray = overlayArray;
        
        self.alignmentLeft = YES;
	}
	return self;
}

- (void)setCellWidth:(CGFloat)width columnCount:(NSInteger)count
{
    thumbnail_width = (width - thumbnail_borde * (count + 1)) / count;
}

- (void)setAssets:(NSArray *)assets
{
    self.rowAssets = assets;
	for (UIImageView *view in _imageViewArray) {
        [view removeFromSuperview];
	}
    for (ELCOverlayImageView *view in _overlayViewArray) {
        [view removeFromSuperview];
	}
    //set up a pointer here so we don't keep calling [UIImage imageNamed:] if creating overlays
    UIImage *overlayImage = nil;
    for (NSInteger i = 0; i < [_rowAssets count]; ++i)
    {
        CGRect frame = CGRectMake(thumbnail_borde + (thumbnail_borde + thumbnail_width) * i,
                                  thumbnail_borde,
                                  thumbnail_width,
                                  thumbnail_width);
        
        ELCAsset *asset = [_rowAssets objectAtIndex:i];
        if (i < [_imageViewArray count])
        {
            UIImageView *imageView = [_imageViewArray objectAtIndex:i];
            imageView.image = [UIImage imageWithCGImage:asset.asset.thumbnail];
        }
        else
        {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:asset.asset.thumbnail]];
            imageView.frame = frame;
            [_imageViewArray addObject:imageView];
        }
        
        if (i < [_overlayViewArray count])
        {
            ELCOverlayImageView *overlayView = [_overlayViewArray objectAtIndex:i];
            overlayView.hidden = asset.selected ? NO : YES;
        }
        else
        {
            if (overlayImage == nil) overlayImage = [UIImage imageNamed:@"Overlay.png"];
            ELCOverlayImageView *overlayView = [[ELCOverlayImageView alloc] initWithImage:overlayImage];
            overlayView.frame = frame;
            [_overlayViewArray addObject:overlayView];
            overlayView.hidden = asset.selected ? NO : YES;
        }
    }
}

- (void)cellTapped:(UITapGestureRecognizer *)tapRecognizer
{
    CGPoint point = [tapRecognizer locationInView:self];
    
	for (NSInteger i = 0; i < [_rowAssets count]; ++i)
    {
        CGRect frame = CGRectMake(thumbnail_borde + (thumbnail_borde + thumbnail_width) * i,
                                  thumbnail_borde,
                                  thumbnail_width,
                                  thumbnail_width);
        
        if (CGRectContainsPoint(frame, point))
        {
            ELCAsset *asset = [_rowAssets objectAtIndex:i];
            asset.selected = !asset.selected;
            ELCOverlayImageView *overlayView = [_overlayViewArray objectAtIndex:i];
            overlayView.hidden = !asset.selected;
            if (asset.selected)
            {
                asset.index = [[ELCConsole mainConsole] numOfSelectedElements];
                [[ELCConsole mainConsole] addIndex:asset.index];
            }
            else
            {
                NSInteger lastElement = [[ELCConsole mainConsole] numOfSelectedElements] - 1;
                [[ELCConsole mainConsole] removeIndex:lastElement];
            }
            break;
        }
    }
}

- (void)layoutSubviews
{
	for (NSInteger i = 0; i < [_rowAssets count]; ++i)
    {
        CGRect frame = CGRectMake(thumbnail_borde + (thumbnail_borde + thumbnail_width) * i,
                                  thumbnail_borde,
                                  thumbnail_width,
                                  thumbnail_width);
		UIImageView *imageView = [_imageViewArray objectAtIndex:i];
		[imageView setFrame:frame];
		[self addSubview:imageView];
        
        ELCOverlayImageView *overlayView = [_overlayViewArray objectAtIndex:i];
        [overlayView setFrame:frame];
        [self addSubview:overlayView];
	}
}


@end
