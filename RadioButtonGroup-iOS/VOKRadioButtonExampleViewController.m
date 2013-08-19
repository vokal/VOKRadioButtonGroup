//
//  VOKRadioButtonExampleViewController.m
//  RadioButttonGroup-iOS
//
//  Created by Carl Hill-Popper on 8/18/13.
//  Copyright (c) 2013 Vokal Interactive. All rights reserved.
//

#import "VOKRadioButtonExampleViewController.h"

#import "VOKRadioButtonGroup.h"

@interface VOKRadioButtonExampleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *radioButtons;

@property (strong, nonatomic) VOKRadioButtonGroup *radioButtonGroup;

@end

@implementation VOKRadioButtonExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //sort the buttons in the outlet collection since order is not guaranteed from Interface Builder
    NSArray *sorted = [self.radioButtons sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"titleLabel.text" ascending:YES]]];
    
    [sorted enumerateObjectsUsingBlock:^(UIButton *button,
                                               NSUInteger idx,
                                               BOOL *stop) {
        NSLog(@"%dth button has text: %@", idx, button.titleLabel.text);
    }];
    
    self.radioButtonGroup = [[VOKRadioButtonGroup alloc] initWithButtons:sorted];
    [self.radioButtonGroup setTarget:self
            actionForSelectionChange:@selector(selectionChangedToButton:)];
    
    UIButton *selectedButton = self.radioButtonGroup.selectedButton;
    if (selectedButton) {
        [self selectionChangedToButton:selectedButton];
    }
}

- (void)selectionChangedToButton:(UIButton *)button
{
    self.titleLabel.text = [NSString stringWithFormat:@"Button %d selected",
                            self.radioButtonGroup.selectedButtonIndex + 1];
    NSLog(@"%@", button);
}

@end
