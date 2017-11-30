//
//  PassengerAircraftViewController.m
//  AntonovAircraft
//
//  Created by Igor Karyi on 15.07.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import "PassengerAircraftViewController.h"
#import "CardView.h"

@interface PassengerAircraftViewController () <UIScrollViewDelegate> {
    NSArray *passengerAircraftArray;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIView *descView;
@property (strong, nonatomic) IBOutlet UIButton *roundButton;
@property (strong, nonatomic) IBOutlet UIView *darkView;
@property (strong, nonatomic) IBOutlet UITextView *textView;


@end

@implementation PassengerAircraftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PassengerAircraftPlist" ofType:@"plist"];
    passengerAircraftArray = [[NSArray alloc] initWithContentsOfFile:path];
    
    self.textView.text = passengerAircraftArray[0][@"description"];
    
    for (int i = 0; i < 6; i++) {
        CardView *cardView = [[[NSBundle mainBundle] loadNibNamed:@"CardView" owner:self options:nil] objectAtIndex:0];
        cardView.titleLabel.text = passengerAircraftArray[i][@"title"];
        cardView.typeLabel.text = passengerAircraftArray[i][@"type"];
        cardView.mainPhotoImage.image = [UIImage imageNamed:passengerAircraftArray[i][@"title"]];
        cardView.projectionImage.image = [UIImage imageNamed:passengerAircraftArray[i][@"projectionImageTitle"]];
        cardView.frame = CGRectMake(self.scrollView.frame.size.width * i, 0, cardView.frame.size.width, cardView.frame.size.height);
        [self.scrollView addSubview:cardView];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * 6, 0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showDescription:(UIButton *)sender {
    
    if (CGAffineTransformIsIdentity(self.roundButton.transform)) {
        
        [self showDescription];
    }
    else {
        [self hideDescription];
    }
}

- (void)showDescription {
    [UIView animateWithDuration:1 animations:^{
        self.darkView.transform = CGAffineTransformScale(self.darkView.transform, 100, 100);
        self.roundButton.transform = CGAffineTransformRotate(self.roundButton.transform, [self getRadians:180.0]);
        self.descView.transform = CGAffineTransformTranslate(self.descView.transform, 0, -400);
    }];
}

- (void) hideDescription {
    
    self.darkView.transform = CGAffineTransformIdentity;
    self.roundButton.transform = CGAffineTransformIdentity;
    self.descView.transform = CGAffineTransformIdentity;
}

- (float) getRadians:(float)degreese {
    float radians = degreese * M_PI / 180.0;
    return radians;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float pageWidth = CGRectGetWidth(self.scrollView.bounds);
    float pageFraction = self.scrollView.contentOffset.x/pageWidth;
    self.pageControl.currentPage = round(pageFraction);
    
    self.textView.text = passengerAircraftArray[self.pageControl.currentPage][@"description"];
    
    [self hideDescription];
    
}

@end
