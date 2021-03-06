//
//  Jedi1CorrectController.m
//  StarWords1
//
//  Created by Jeffrey Johnston on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Jedi1CorrectController.h"
#import "Jedi1GameController.h"
#import "MainMenuController.h"
#import "Globals.h"


@implementation Jedi1CorrectController


@synthesize playAgain;
@synthesize mainMenu;
@synthesize nextLevel;
@synthesize recordLabel;
@synthesize bestTime;

@synthesize mainMenuController;


-(IBAction) playAgainButtonPressed:(id)sender  {
    CFURLRef url = CFBundleCopyResourceURL(CFBundleGetMainBundle(),(CFStringRef) @"techterr",CFSTR("wav"),NULL);
    AudioServicesCreateSystemSoundID(url, &terrorQuoteSound);	
    AudioServicesPlaySystemSound(terrorQuoteSound);
}

-(IBAction) mainButtonPressed:(id)sender  {
    mainMenuController = [[MainMenuController alloc] initWithNibName:@"MainMenuController" bundle:nil];
    [UIView setAnimationDuration: 2.0];
    self.mainMenuController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:self.mainMenuController animated:YES];
}

-(IBAction) nextButtonPressed:(id)sender  {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Coming Soon"
                          message:@"More Jedi Levels Coming!  Choose Newbie or Padawan Level at Main Menu to experience additional levels of Star Words!"
                          delegate:self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles: nil];
    [alert show];
}


-(void) showRecordTime  { 
    recordLabel.text = [NSString stringWithFormat:@"%02d:%02d", jed1 / 60, jed1 % 60]; 
    NSLog(@"Record Time IN N1CG CORRECT IS:     %2d:%2d", jed1 / 60, jed1 % 60 );}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    CFURLRef url = CFBundleCopyResourceURL(CFBundleGetMainBundle(),(CFStringRef) @"techterr",CFSTR("wav"),NULL);
    AudioServicesCreateSystemSoundID(url, &terrorQuoteSound);	
    AudioServicesPlaySystemSound(terrorQuoteSound);
    if (myTimer == FALSE) {
        self.recordLabel.hidden = YES;
        self.bestTime.hidden = YES;}
    else {[self showRecordTime];}
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return ((interfaceOrientation != UIInterfaceOrientationPortrait) && (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown));}



@end
