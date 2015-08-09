//
//  EventController.m
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "EventController.h"
@import UIKit;

static NSString * const kEventsKey = @"Events";
static NSString * const kWorkshopsKey = @"Workshops";


@interface EventController ()

@property (strong, nonatomic) NSArray *events;
@property (strong, nonatomic) NSArray *workshops;

@end


@implementation EventController

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:kEventsKey]) {
            [self loadFromDefaults];
        } else {
            [self serializeJSONData];
        }
    }
    return self;
}

- (void)loadFromDefaults {
    
    
    #warning eric is working on nscoding, so simplify this whole method
    
    // load events
    
    NSArray *eventDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:kEventsKey];
    
    NSMutableArray *events = [NSMutableArray new];
    
    for (NSDictionary *dictionary in eventDictionaries) {
        Event *event = [[Event alloc] initWithDictionary:dictionary];
        [events addObject:event];
    }
    
    self.events = events;
    
    // load workshops
    
    NSArray *workshopDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:kWorkshopsKey];
    
    NSMutableArray *workshops = [NSMutableArray new];
    
    for (NSDictionary *dictionary in workshopDictionaries) {
        Event *event = [[Event alloc] initWithDictionary:dictionary];
        [workshops addObject:event];
    }
    
    self.workshops = workshops;
}

- (NSArray *)favoritedEvents {
    NSPredicate *isFavorite = [NSPredicate predicateWithFormat:@"isFavorite == 1"];
    NSArray *favoritedEvents = [self.events filteredArrayUsingPredicate:isFavorite];
    
    return favoritedEvents;
}

- (NSArray *)favoritedWorkshops {
    NSPredicate *isFavorite = [NSPredicate predicateWithFormat:@"isFavorite == 1"];
    NSArray *favoritedEvents = [self.events filteredArrayUsingPredicate:isFavorite];
    
    return favoritedEvents;
}

- (void)serializeJSONData {
    
    self.events = [self getDataForResorce:@"clcmusic"];
    self.workshops = [self getDataForResorce:@"clcworkshops"];
    
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
    
    NSMutableArray *events = [NSMutableArray new];

    for (NSDictionary *eventDictionary in eventDictionaries) {
        Event *event = [[Event alloc] initWithDictionary:eventDictionary];
        [events addObject:event];
    }
    
    return eventDictionaries;
}

- (void)setFavorite:(Event *)event {
    event.isFavorite =YES;
    
    [self scheduleLocalNotificationsForEvent:event];
    
    [self saveEvents];
}

- (void)removeFavorite:(Event *)event {
    event.isFavorite = NO;
    
    [self saveEvents];
}

- (void)saveEvents {
    [[NSUserDefaults standardUserDefaults] setObject:self.events forKey:kEventsKey];
    [[NSUserDefaults standardUserDefaults] setObject:self.workshops forKey:kWorkshopsKey];
}

- (void)scheduleLocalNotificationsForEvent:(Event *)event {
 
    #warning incomplete implementation
    
    // schedule local notification for 24 hours before event starts
    // schedule local notification for 1 hour before event starts
    
}

- (void)cancelNotificationsForEvent:(Event *)event {
    
    #warning this cancels all notifications, not just the ones for the specific event
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)createCalendarEventFromEvent:(Event *)event {
    
    #warning incomplete implementation, claimed by Alan Barth
    // use EventKit to create the calendar event for event
}

@end