//
//  VOKRadioButtonGroup.m
//  RadioButttonGroup-iOS
//
//  Created by Carl Hill-Popper on 8/18/13.
//  Copyright (c) 2013 Vokal Interactive. All rights reserved.
//

#import "VOKRadioButtonGroup.h"

@interface VOKRadioButtonGroup ()

@property NSUInteger selectedButtonIndex;

@property (strong, nonatomic) NSArray *buttons;

@property (weak, nonatomic) id target;
@property (nonatomic) SEL action;

@end

@implementation VOKRadioButtonGroup

- (id)initWithButtons:(NSArray *)radioButtons
{
    self = [super init];
    if (self) {
        _selectedButtonIndex = NSNotFound;
        _buttons = radioButtons;
        [radioButtons enumerateObjectsUsingBlock:^(UIButton *button,
                                                   NSUInteger idx,
                                                   BOOL *stop) {
            if (button.isSelected) {
                _selectedButtonIndex = idx;
            }
            
            [button addTarget:self
                       action:@selector(changeSelectedButton:)
             forControlEvents:UIControlEventTouchUpInside];
        }];
    }
    return self;
}

- (UIButton *)selectedButton
{
    if (self.selectedButtonIndex != NSNotFound) {
        return self.buttons[self.selectedButtonIndex];
    } else {
        return nil;
    }
}

- (void)changeSelectedButton:(UIButton *)button
{
    UIButton *previousSelectedButton = self.selectedButton;
    if (previousSelectedButton != button) {
        previousSelectedButton.selected = NO;
        button.selected = YES;
        
        self.selectedButtonIndex = [self.buttons indexOfObject:button];
        
        if (self.target) {
            [[UIApplication sharedApplication] sendAction:self.action
                                                       to:self.target
                                                     from:button
                                                 forEvent:nil];
        }        
    }
}

- (void)setTarget:(id)target actionForSelectionChange:(SEL)action;
{
    self.target = target;
    self.action = action;
}

@end
