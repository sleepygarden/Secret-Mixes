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
@property (nonatomic,retain) NSString *track;
@property (retain) NSURL *path;

@end
