//
//  WavyFlowLayout.m
//  Wavy-Collection-View
//
//  Created by Dave Augerinos on 2017-02-23.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "WavyFlowLayout.h"

@interface WavyFlowLayout ()

@property (nonatomic) NSArray *savedAttributes;

@end

@implementation WavyFlowLayout

-(void)prepareLayout {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    // Set minimum interitem spacing to be huge to force all items to be on their own line
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    
    NSArray<UICollectionViewLayoutAttributes *> *superAttrsArray = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrsArray = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *myAttribute in superAttrsArray) {
    
        // Need to copy attrs from super to avoid cached frame mismatch
        UICollectionViewLayoutAttributes *newAttribute = [myAttribute copy];
        
        CGFloat randY = arc4random_uniform(self.collectionView.bounds.size.height - newAttribute.size.height);
        
        newAttribute.frame = CGRectMake(newAttribute.frame.origin.x, randY, self.itemSize.width, self.itemSize.height);

        [newAttrsArray addObject:newAttribute];
    }
    
    return newAttrsArray;
}

@end
