//
//  DMBQuizViewController.m
//  Quiz
//
//  Created by Douglas Barreto on 1/4/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "DMBQuizViewController.h"

@interface DMBQuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation DMBQuizViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        self.questions = @[@"What is object-c",
                           @"What is OSX?",
                           @"What is the capital of brazil?"];
        
        self.answers = @[@"I Big piece of crap!",
                         @"A shadow of Windows OS",
                         @"Buenos Aires"];
        
    }
    
    return self;
}

-(IBAction)showQuestion:(id)sender
{
    ++self.currentQuestionIndex;
    
    if( self.currentQuestionIndex == [self.questions count])
    {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

-(IBAction)showAsnwer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
