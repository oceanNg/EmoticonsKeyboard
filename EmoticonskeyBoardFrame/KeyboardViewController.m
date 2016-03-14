//
//  KeyboardViewController.m
//  EmoticonskeyBoardFrame
//
//  Created by duongnguyen on 3/12/16.
//  Copyright © 2016 carpediem. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *characterListBtn;
@property (weak, nonatomic) IBOutlet UIButton *SpaceBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *globeBtn;
@property (weak, nonatomic) IBOutlet UIButton *returnBtn;

@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeKeyboard];
    

}


#pragma mark - initialization method

- (void) initializeKeyboard {
    
    //start with shift on
    
    //initialize space key double tap
    UITapGestureRecognizer *spaceDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(spaceKeyDoubleTapped:)];
    
    spaceDoubleTap.numberOfTapsRequired = 2;
    [spaceDoubleTap setDelaysTouchesEnded:NO];
    
    [self.SpaceBtn addGestureRecognizer:spaceDoubleTap];
    
    //initialize shift key double and triple tap
   
    
}



#pragma mark - key methods
- (IBAction)characterPress:(id)sender
{
    UIButton * btn = (UIButton *) sender;
    [self.textDocumentProxy insertText:btn.titleLabel.text];
    
}
- (IBAction)globeDidPress:(id)sender {
    [self advanceToNextInputMode];
}


- (IBAction)deleteDidPress:(id)sender
{
    [self.textDocumentProxy deleteBackward];
}
- (IBAction)returnDidpress:(id)sender
{
    [self.textDocumentProxy insertText:@"\n"];
    
}
- (IBAction)spaceDidPress:(id)sender {
    [self.textDocumentProxy insertText:@" "];

}
-(void) spaceKeyDoubleTapped: (UIButton*) sender
{
    
    //double tapping the space key automatically inserts a period and a space
    //if necessary, activate the shift button
    [self.textDocumentProxy deleteBackward];
    [self.textDocumentProxy insertText:@". "];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
//    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
