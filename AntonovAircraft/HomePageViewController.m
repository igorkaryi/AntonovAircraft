//
//  ViewController.m
//  AntonovAircraft
//
//  Created by Igor Karyi on 15.07.17.
//  Copyright © 2017 Igor Karyi. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIView *transportAircraftView;
@property (strong, nonatomic) IBOutlet UIView *passengerAircraftView;
@property (strong, nonatomic) IBOutlet UIView *specialPurposeAircraftView;



@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.backgroundImageView.alpha = 0;
    self.transportAircraftView.alpha = 0;
    self.passengerAircraftView.alpha = 0;
    self.specialPurposeAircraftView.alpha = 0;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.backgroundImageView.alpha = 1;
    } completion:^(BOOL completion) {
        [self animateTransportAircraftView];
    }];
}

- (void)animateTransportAircraftView {
    [UIView animateWithDuration:0.5 animations:^{
        self.transportAircraftView.alpha = 1;
    } completion:^(BOOL completion) {
        [self animatePassengerAircraftView];
    }];
}


- (void)animatePassengerAircraftView {
    [UIView animateWithDuration:0.5 animations:^{
        self.passengerAircraftView.alpha = 1;
    } completion:^(BOOL completion) {
        [self animateSpecialPurposeAircraftView];
    }];
}

- (void)animateSpecialPurposeAircraftView {
    [UIView animateWithDuration:0.5 animations:^{
        self.specialPurposeAircraftView.alpha = 1;
    }    ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
