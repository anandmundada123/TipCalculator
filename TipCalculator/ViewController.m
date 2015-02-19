//
//  ViewController.m
//  TipCalculator
//
//  Created by Anand Mundada on 1/15/15.
//  Copyright (c) 2015 Anand Mundada. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (IBAction)onSettingButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateValues];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingButton)];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    
    float tipAmpunt = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    
    float totalAmount = billAmount + tipAmpunt;
    
    self.tipLabel.text = [NSString stringWithFormat:@"%0.2f", tipAmpunt];
    self.totalLabel.text = [NSString stringWithFormat:@"%0.2f", totalAmount];
}

- (IBAction)onSettingButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];

}
@end