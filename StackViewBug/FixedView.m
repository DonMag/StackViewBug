//
//  FixedView.m
//  StackViewBug
//
//  Created by Don Mag on 10/15/21.
//

#import "FixedView.h"

@implementation FixedView

- (void)setHidden:(BOOL)hidden {
	if (self.isHidden != hidden) {
		[super setHidden:hidden];
	}
}

@end
