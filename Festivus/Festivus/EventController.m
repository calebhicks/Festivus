//
//  EventController.m
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "EventController.h"

@implementation EventController

- (NSArray *)favoritedEvents {
    NSPredicate *isFavorite = [NSPredicate predicateWithFormat:@"isFavorite == 1"];
    NSArray *favoritedEvents = [self.events filteredArrayUsingPredicate:isFavorite];
    
    return favoritedEvents;
}

- (NSArray *)events {
    
    NSURL *url1 =[NSURL fileURLWithPath:@"www.google.com"];
    
    Event *event1 = [Event new];
    Event *event2 = [Event new];
    Event *event3 = [Event new];
    Event *event4 = [Event new];
    
    event1.name = @"Event 1";
    event1.startDate =[NSDate date];
    event1.endDate = [NSDate date];
    event1.eventDescription = @"The first vendor";
    event1.locationName = @"Galivan Center";
    event1.url = url1;
    event1.isFavorite = FALSE;
    event1.category = @"Art";
    
    event2.name = @"Event 2";
    event2.startDate =[NSDate date];
    event2.endDate = [NSDate date];
    event2.eventDescription = @"The first vendor";
    event2.locationName = @"Galivan Center";
    event2.url = url1;
    event2.isFavorite = FALSE;
    event2.category = @"Art";
    
    event3.name = @"Event 3";
    event3.startDate =[NSDate date];
    event3.endDate = [NSDate date];
    event3.eventDescription = @"The first vendor";
    event3.locationName = @"Galivan Center";
    event3.url = url1;
    event3.isFavorite = FALSE;
    event3.category = @"Art";
    
    event4.name = @"Event 4";
    event4.startDate =[NSDate date];
    event4.endDate = [NSDate date];
    event4.eventDescription = @"The first vendor";
    event4.locationName = @"Galivan Center";
    event4.url = url1;
    event4.isFavorite = FALSE;
    event4.category = @"Art";
    
    return @[event1,event2,event3,event4];
}

- (void)setFavorite:(Event *)event {
    event.isFavorite =YES;
}

- (void)removeFavorite:(Event *)event {
    event.isFavorite = NO;
}

- (void)scheduleLocalNotificationsForEvent:(Event *)event {
 
    #warning incomplete implementation
    
    // schedule local notification for 24 hours before event starts
    // schedule local notification for 1 hour before event starts
    
}

- (void)createCalendarEventFromEvent:(Event *)event {
    
    #warning incomplete implementation, claimed by Alan Barth
    // use EventKit to create the calendar event for event
}

@end