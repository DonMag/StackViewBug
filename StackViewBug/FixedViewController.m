//
//  FixedViewController.m
//  StackViewBug
//
//  Created by Don Mag on 10/15/21.
//

#import "FixedViewController.h"

#import "FixedView.h"

@interface FixedViewController ()
@property (strong, nonatomic) UIStackView *stack;
@property (strong, nonatomic) FixedView *myView1;
@property (strong, nonatomic) FixedView *myView2;
@end

@implementation FixedViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor systemYellowColor];
	
	_myView1 = [FixedView new];
	_myView2 = [FixedView new];
	_myView1.backgroundColor = [UIColor systemBlueColor];
	_myView2.backgroundColor = [UIColor systemGreenColor];
	
	UIButton *b1 = [UIButton new];
	[b1 setTitle:@"Show" forState:UIControlStateNormal];
	[b1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[b1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
	[b1 setBackgroundColor:[UIColor systemRedColor]];
	
	UIButton *b2 = [UIButton new];
	[b2 setTitle:@"Hide" forState:UIControlStateNormal];
	[b2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[b2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
	[b2 setBackgroundColor:[UIColor systemRedColor]];
	
	UILabel *v = [UILabel new];
	v.textAlignment = NSTextAlignmentCenter;
	v.numberOfLines = 0;
	v.text = @"We're still animating, but even if we tap Hide several times in a row, one tap on Show will unhide the green view.";
	
	_stack = [UIStackView new];
	_stack.axis = UILayoutConstraintAxisVertical;
	_stack.spacing = 8;
	_stack.clipsToBounds = YES;
	
	[_stack addArrangedSubview:v];
	[_stack addArrangedSubview:b1];
	[_stack addArrangedSubview:b2];
	[_stack addArrangedSubview:_myView1];
	[_stack addArrangedSubview:_myView2];
	
	_stack.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self.view addSubview:_stack];
	
	UILayoutGuide *g = self.view.safeAreaLayoutGuide;
	
	[NSLayoutConstraint activateConstraints:@[
		
		[_stack.topAnchor constraintEqualToAnchor:g.topAnchor constant:80.0],
		[_stack.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:20.0],
		[_stack.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:-20.0],
		
		[_myView1.heightAnchor constraintEqualToConstant:60.0],
		[_myView2.heightAnchor constraintEqualToAnchor:_myView1.heightAnchor],
		
	]];
	
	[b1 addTarget:self action:@selector(showTapped) forControlEvents:UIControlEventTouchUpInside];
	[b2 addTarget:self action:@selector(hideTapped) forControlEvents:UIControlEventTouchUpInside];
	
}

- (void) showTapped {
	
	[UIView animateWithDuration:1.0 animations:^{
		self.myView2.hidden = NO;
	}];
	
}
- (void) hideTapped {
	
	[UIView animateWithDuration:1.0 animations:^{
		self.myView2.hidden = YES;
	}];
	
}

@end
