//
//  SecretViewController.m
//  Secret Mixes
//
//  Created by Michael Cornell on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecretViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@implementation SecretViewController
@synthesize player;
@synthesize track;
@synthesize path;
@synthesize tracklist;
@synthesize trackDisplay;
@synthesize track1;
@synthesize track2;
@synthesize track3;
@synthesize track4;
@synthesize track5;

-(IBAction)playSound {
       [player play];
    NSLog(@"play");
}

-(IBAction)nextButton{    
    if(track<4){track++;}
        else {track=0;}
    self.path = [tracklist objectAtIndex:track];
    NSError *error;           
    AVAudioPlayer* newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:path error:&error];
    player = newPlayer;
    [player setDelegate:self];
    [player play]; 
    NSLog(@"now playing track: %i",track+1); 
      self.trackDisplay.text=[NSString stringWithFormat:@"Currently playing track: %d", track+1];
}


-(IBAction)prevButton{    
    if(track>0){track--;}
        else {track=4;}
    self.path = [tracklist objectAtIndex:track];
    NSError *error;           
    AVAudioPlayer* newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:path error:&error];
    player = newPlayer;
    [player setDelegate: self];
    [player play]; 
    NSLog(@"now playing track: %i",track+1); 
      self.trackDisplay.text=[NSString stringWithFormat:@"Currently playing track: %d", track+1];
}
-(IBAction)pauseSound{
    [player pause];
    NSLog(@"pause");
    
}


-(void)viewDidLoad{
    NSLog(@"program launch!");
    track=0;           
    self.track1=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bigtoe.mp3", [[NSBundle mainBundle] resourcePath]]];
    self.track2=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/buscando.mp3", [[NSBundle mainBundle] resourcePath]]];
    self.track3=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/harmony.mp3", [[NSBundle mainBundle] resourcePath]]];
    self.track4=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/ithoughtiknew.mp3", [[NSBundle mainBundle] resourcePath]]];
    self.track5=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/liftthatlatch.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    tracklist = [[NSArray alloc] initWithObjects:
                 track1,
                 track2,
                 track3,
                 track4,
                 track5,
                 nil];
    
    self.path = [tracklist objectAtIndex:track];

    NSError *error;           
    AVAudioPlayer* newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:path error:&error];
    self.player = newPlayer;
    [player setDelegate:self];
    [player prepareToPlay];
    [player play];
    self.trackDisplay.text=[NSString stringWithFormat:@"Currently playing track: %d", track+1];

}

@end

