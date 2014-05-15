//
//  VOKRadioButtonGroup.h
//  RadioButttonGroup-iOS
//
//  Created by Carl Hill-Popper on 8/18/13.
//  Copyright (c) 2013 Vokal Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VOKRadioButtonGroup : NSObject

@property (nonatomic, readonly) UIButton *selectedButton;
@property (nonatomic, readonly) NSUInteger selectedButtonIndex;

@property (strong, nonatomic, readonly) NSArray *buttons;

- (id)initWithButtons:(NSArray *)radioButtons;

- (void)setTarget:(id)target actionForSelectionChange:(SEL)action;

- (void)clearSelection;

@end
