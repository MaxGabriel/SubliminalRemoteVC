//
//  STModalTest.m
//  SubliminalTest
//
//  Created by Maximilian Tagher on 6/7/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import <Subliminal/Subliminal.h>

@interface STModalTest : SLTest

@end

@implementation STModalTest

- (void)testRegularModal
{
    SLButton *button = [SLButton elementWithAccessibilityLabel:@"RegularModal"];
    [UIAElement(button) tap];
    
    SLButton *cancelButton = [SLButton elementWithAccessibilityLabel:@"Cancel"];
    SLAssertTrueWithTimeout([cancelButton isValidAndVisible], 3, @"Regular Modal cancel button valid and visible");
    [cancelButton tap];
}

- (void)focus_testSKStoreProductInteractionUsingStaticElement
{
    SLButton *button = [SLButton elementWithAccessibilityLabel:@"SKStoreProduct"];
    [UIAElement(button) tap];
    
    [self wait:2];
    
    SLStaticElement *cancel = [[SLStaticElement alloc] initWithUIARepresentation:@"UIATarget.localTarget().frontMostApp().navigationBar().leftButton()"];
    SLAssertTrueWithTimeout([UIAElement(cancel) isValidAndVisible], 3, @"Cancel button is valid");
    [cancel tap];
}

- (void)testSKStoreProductInteraction
{
    SLButton *button = [SLButton elementWithAccessibilityLabel:@"SKStoreProduct"];
    [UIAElement(button) tap];
    
    [self wait:5];
    
    [[SLWindow mainWindow] logElementTree];
    
    //    SLElement *cancelButton  =[SLElement elementWithAccessibilityLabel:nil value:@"Cancel" traits:SLUIAccessibilityTraitAny];
    SLButton *cancelButton = [SLButton elementWithAccessibilityLabel:@"Cancel"];
    SLAssertTrueWithTimeout([cancelButton isValidAndVisible], 5, @"cancel button should be visible on SKStoreProduct");
}

@end
