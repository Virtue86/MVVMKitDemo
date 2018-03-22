//
//  UIView+TTAdditions.h
//  tangtang
//
//  Created by Virtue on 2018/3/21.
//  Copyright © 2018年 pengTang. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIView (TTAdditions)
/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Constraint
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Constraint

- (nullable NSLayoutConstraint *)sui_constraintTop;
- (nullable NSLayoutConstraint *)sui_constraintBottom;
- (nullable NSLayoutConstraint *)sui_constraintLeading;
- (nullable NSLayoutConstraint *)sui_constraintTrailing;
- (nullable NSLayoutConstraint *)sui_constraintWidth;
- (nullable NSLayoutConstraint *)sui_constraintHeight;
- (nullable NSLayoutConstraint *)sui_constraintCenterX;
- (nullable NSLayoutConstraint *)sui_constraintCenterY;
- (nullable NSLayoutConstraint *)sui_constraintBaseline;
- (void)sui_layoutPinnedToSuperview;




/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Layer
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Layer

@property (nonatomic) IBInspectable CGFloat sui_cornerRadius; // Defaults to zero.

@property (nonatomic) CGFloat sui_borderWidth; // Defaults to zero.
@property (nonatomic,copy) UIColor *sui_borderColor; // Defaults to opaque black.

@property (nonatomic,copy) UIColor *sui_shadowColor; // Defaults to opaque black
@property (nonatomic) CGFloat sui_shadowOpacity; // Defaults to 0. [0,1]
@property (nonatomic) CGSize sui_shadowOffset; // Defaults to (0, -3).
@property (nonatomic) CGFloat sui_shadowRadius; // Defaults to 3.
@property (nonatomic) BOOL sui_shadowPath; // Defaults to NO. When using animation set YES.


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Relationship
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Relationship

@property (nullable,readonly,copy) __kindof UIViewController *sui_currentVC;

- (nullable __kindof UIView *)sui_findSubview:(NSString *)className;
- (nullable __kindof UIView *)sui_findSupview:(NSString *)className;


@end
NS_ASSUME_NONNULL_END
