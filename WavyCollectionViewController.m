//
//  WavyCollectionViewController.m
//  Wavy-Collection-View
//
//  Created by Dave Augerinos on 2017-02-23.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "WavyCollectionViewController.h"

@interface WavyCollectionViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *wavyCollectionView;

@end

@implementation WavyCollectionViewController

static NSString * const reuseIdentifier = @"wavyCell";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Custom cell
    WavyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.cellIDLabel.text = [NSString stringWithFormat:@"%ld/%ld", (long)indexPath.section, (long)indexPath.item];
    
    
    return cell;
}

@end
