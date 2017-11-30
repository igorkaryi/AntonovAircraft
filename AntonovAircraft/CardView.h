//
//  CardView.h
//  AntonovAircraft
//
//  Created by Igor Karyi on 15.07.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *mainPhotoImage;
@property (strong, nonatomic) IBOutlet UIImageView *projectionImage;

@end
