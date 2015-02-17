//
//  PersistentViewController.m
//  BePersistent
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PersistentViewController.h"

static NSString * const nameKey = @"nameKey";
static NSString * const scoreKey = @"scoreKey";
static NSString * const steppetKey = @"stepperKey";
static NSString * const playerKey = @"playerKey";

@interface PersistentViewController ()

@property (weak, nonatomic) IBOutlet UITextField *playerNameTextField;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation PersistentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDictionary *player = [[NSUserDefaults standardUserDefaults] objectForKey:playerKey];
    
    [self updateWithPlayerDictionary:player];
    
}

- (void)updateWithPlayerDictionary: (NSDictionary *) player {
    
    NSNumber *score = player [scoreKey];
    
    self.playerNameTextField.text = player [nameKey];
    
    self.scoreLabel.text = [score stringValue];
    
    self.stepper.value = [score doubleValue];
    
}

- (IBAction)stepperVilueChanged:(id)sender {
    
    UIStepper *stepper = sender;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%.0f", stepper.value];
    
}

- (IBAction)save:(id)sender {
    NSMutableDictionary *playerDictionary = [NSMutableDictionary new];
    
    playerDictionary[nameKey] = self.playerNameTextField.text;
    playerDictionary[scoreKey] = @(self.stepper.value);
    
    [[NSUserDefaults standardUserDefaults] setObject:playerDictionary forKey:playerKey];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
