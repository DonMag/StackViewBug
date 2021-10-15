//
//  ViewController.m
//  StackViewBug
//
//  Created by Don Mag on 10/15/21.
//

#import "ViewController.h"

#import "NotProblemViewController.h"
#import "ProblemViewController.h"
#import "FixedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	UIButton *b1 = [UIButton new];
	[b1 setTitle:@"Not a Problem" forState:UIControlStateNormal];
	[b1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[b1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
	[b1 setBackgroundColor:[UIColor systemRedColor]];
	
	UIButton *b2 = [UIButton new];
	[b2 setTitle:@"Show the Problem" forState:UIControlStateNormal];
	[b2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[b2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
	[b2 setBackgroundColor:[UIColor systemRedColor]];
	
	UIButton *b3 = [UIButton new];
	[b3 setTitle:@"Fix the Problem" forState:UIControlStateNormal];
	[b3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[b3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
	[b3 setBackgroundColor:[UIColor systemRedColor]];
	
	UIStackView *_stack = [UIStackView new];
	_stack.axis = UILayoutConstraintAxisVertical;
	_stack.spacing = 20;
	_stack.clipsToBounds = YES;
	
	[_stack addArrangedSubview:b1];
	[_stack addArrangedSubview:b2];
	[_stack addArrangedSubview:b3];

	_stack.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self.view addSubview:_stack];
	
	UILayoutGuide *g = self.view.safeAreaLayoutGuide;
	
	[NSLayoutConstraint activateConstraints:@[
		
		[_stack.centerYAnchor constraintEqualToAnchor:g.centerYAnchor constant:-40.0],
		[_stack.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:40.0],
		[_stack.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:-40.0],
		
	]];
	
	[b1 addTarget:self action:@selector(notAProblemTapped) forControlEvents:UIControlEventTouchUpInside];
	[b2 addTarget:self action:@selector(showProblemTapped) forControlEvents:UIControlEventTouchUpInside];
	[b3 addTarget:self action:@selector(fixProblemTapped) forControlEvents:UIControlEventTouchUpInside];


}

- (void)notAProblemTapped {
	NotProblemViewController *vc = [NotProblemViewController new];
	[self.navigationController pushViewController:vc animated:YES];
}

- (void)showProblemTapped {
	ProblemViewController *vc = [ProblemViewController new];
	[self.navigationController pushViewController:vc animated:YES];
}

- (void)fixProblemTapped {
	FixedViewController *vc = [FixedViewController new];
	[self.navigationController pushViewController:vc animated:YES];
}

@end
