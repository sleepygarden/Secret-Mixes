//
//  SecretViewController.h
//  Secret Mixes
//
//  Created by Michael Cornell on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface SecretViewController : UIViewController

-(IBAction)playSound;
-(IBAction)nextButton;
-(IBAction)prevButton;
-(IBAction)pauseSound;

@property (strong)AVAudioPlayer *player;
@property NSInteger track;
@property (retain) NSURL *path;
@property (retain) NSURL *track1;
@property (retain) NSURL *track2;
@property (retain) NSURL *track3;
@property (retain) NSURL *track4;
@property (retain) NSURL *track5;
@property (strong) NSArray *tracklist;
@property (weak, nonatomic) IBOutlet UILabel *trackDisplay;

@end
