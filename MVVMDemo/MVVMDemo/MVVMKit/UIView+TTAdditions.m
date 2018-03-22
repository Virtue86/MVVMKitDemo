//
//  UIView+TTAdditions.m
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import "UIView+TTAdditions.h"
#import "Header.h"


@implementation UIView (TTAdditions)

/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Constraint
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Constraint

- (NSLayoutConstraint *)sui_constraintForAttribute:(NSLayoutAttribute)attribute
{
    NSArray *constraintArray = nil;
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    } else {
        constraintArray = [self.superview constraints];
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if (fillteredArray.count) {
        NSLayoutConstraint *curConstraint = fillteredArray.firstObject;
        return curConstraint;
    }
    return nil;
}

- (NSLayoutConstraint *)sui_constraintTop
{
    return [self sui_constraintForAttribute:NSLayoutAttributeTop];
}
- (NSLayoutConstraint *)sui_constraintBottom
{
    return [self sui_constraintForAttribute:NSLayoutAttributeBottom];
}
- (NSLayoutConstraint *)sui_constraintLeading
{
    return [self sui_constraintForAttribute:NSLayoutAttributeLeft];
}
- (NSLayoutConstraint *)sui_constraintTrailing
{
    return [self sui_constraintForAttribute:NSLayoutAttributeRight];
}
- (NSLayoutConstraint *)sui_constraintWidth
{
    return [self sui_constraintForAttribute:NSLayoutAttributeWidth];
}
- (NSLayoutConstraint *)sui_constraintHeight
{
    return [self sui_constraintForAttribute:NSLayoutAttributeHeight];
}
- (NSLayoutConstraint *)sui_constraintCenterX
{
    return [self sui_constraintForAttribute:NSLayoutAttributeCenterX];
}
- (NSLayoutConstraint *)sui_constraintCenterY
{
    return [self sui_constraintForAttribute:NSLayoutAttributeCenterY];
}
- (NSLayoutConstraint *)sui_constraintBaseline
{
    return [self sui_constraintForAttribute:NSLayoutAttributeBaseline];
}
- (void)sui_layoutPinnedToSuperview
{
    SUIAssert(self.superview, @"no superview ⤭ %@ ⤪", self);
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[self]-0-|"
                                             options:0
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(self)]];
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[self]-0-|"
                                             options:0
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(self)]];
}



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Layer
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Layer

- (CGFloat)sui_cornerRadius
{
    return self.layer.cornerRadius;
}
- (void)setSui_cornerRadius:(CGFloat)sui_cornerRadius
{
    self.layer.cornerRadius = sui_cornerRadius;
    self.layer.masksToBounds = (sui_cornerRadius > 0);
}

- (CGFloat )sui_borderWidth
{
    return self.layer.borderWidth;
}
- (void)setSui_borderWidth:(CGFloat)sui_borderWidth
{
    self.layer.borderWidth = sui_borderWidth;
}

- (UIColor *)sui_borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (void)setSui_borderColor:(UIColor *)sui_borderColor
{
    self.layer.borderColor = [sui_borderColor CGColor];
}

- (UIColor *)sui_shadowColor
{
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}
- (void)setSui_shadowColor:(UIColor *)sui_shadowColor
{
    self.layer.shadowColor = [sui_shadowColor CGColor];
}

- (CGFloat)sui_shadowOpacity
{
    return self.layer.shadowOpacity;
}
- (void)setSui_shadowOpacity:(CGFloat)sui_shadowOpacity
{
    self.layer.shadowOpacity = sui_shadowOpacity;
}

- (CGSize)sui_shadowOffset
{
    return self.layer.shadowOffset;
}
- (void)setSui_shadowOffset:(CGSize)sui_shadowOffset
{
    self.layer.shadowOffset = sui_shadowOffset;
}

- (CGFloat)sui_shadowRadius
{
    return self.layer.shadowRadius;
}
- (void)setSui_shadowRadius:(CGFloat)sui_shadowRadius
{
    self.layer.shadowRadius = sui_shadowRadius;
}

- (BOOL)sui_shadowPath
{
    if (self.layer.shadowRadius) return YES;
    return NO;
}
- (void)setSui_shadowPath:(BOOL)sui_shadowPath
{
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:self.layer.bounds] CGPath];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Relationship
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Relationship

- (UIViewController *)sui_currentVC
{
    Class aClass = NSClassFromString(@"UIViewController");
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:aClass]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIView *)sui_findSubview:(NSString *)className
{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:NSClassFromString(className)]) {
            return subView;
        }
    }
    return nil;
}
- (UIView *)sui_findSupview:(NSString *)className;
{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIView *curView = [next superview];
        if ([curView isKindOfClass:NSClassFromString(className)]) {
            return curView;
        }
    }
    return nil;
}


@end
