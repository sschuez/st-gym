namespace :enrich_exercises do
  desc "add new exercises to the database from ai"
  task new_exercises_1: :environment do
    exercises = [
      {
        name: "Spiderman Crawl",
        description: "Get into a push-up position and bring one foot up to the outside of your hand. Alternate sides and move forward as you go.",
        categories: %w[Mobility Core]
      },
      {
        name: "Bear Crawl",
        description: "Start on your hands and knees, lift your knees off the ground and move forward by stepping with your opposite hand and foot.",
        categories: %w[Mobility Core]
      },
      {
        name: "Lateral Lunge",
        description: "Take a big step to the side with one foot and bend the knee, keeping the other leg straight. Alternate sides.",
        categories: %w[Mobility Legs]
      },
      {
        name: "Prone Scorpion",
        description: "Lie on your stomach with your arms out to the sides. Bring one foot up towards your opposite hand, then switch sides.",
        categories: %w[Mobility Back]
      },
      {
        name: "Hip Circles",
        description: "Stand with your feet shoulder-width apart and place your hands on your hips. Circle your hips in one direction, then switch directions.",
        categories: %w[Mobility Core]
      },
      {
        name: "Plank Jacks",
        description: "A plank variation where you jump your feet in and out while maintaining a straight back and tight core.",
        categories: %w[Core Cardio Functional]
      },
      {
        name: "Flutter Kicks",
        description: "Lying on your back with your hands under your glutes, kick your legs up and down while keeping them straight.",
        categories: %w[Core Mobility Belly]
      },
      {
        name: "Leg Raises",
        description: "Lying on your back with your hands under your glutes, raise your legs straight up and slowly lower them back down without touching the ground.",
        categories: %w[Core Legs Belly]
      },
      {
        name: "Plank Knee to Elbow",
        description: "Start in a high plank position, bring your right knee to your left elbow and then switch to your left knee to your right elbow while keeping your hips level and core tight.",
        categories: %w[Core Shoulders Functional]
      },
      {
        name: "Warm up plank",
        description: "Hold a plank position for 30 seconds to warm up your core.",
        categories: %w[Core Mobility]
      },
      {
        name: "Dip",
        description: "Place your hands on parallel bars and dip down, engaging your triceps.",
        categories: ["Arms"]
      },
      {
        name: "Chin-up",
        description: "Hang from a bar with your palms facing towards you and pull yourself up to chin level.",
        categories: %w[Pull Back Arms]
      },
      {
        name: "Inverted Row",
        description: "Lie underneath a bar at hip height and pull yourself up towards the bar, engaging your back and arms.",
        categories: %w[Pull Back Arms]
      },
      {
        name: "L-Sit Pull-up",
        description: "Perform a pull-up, but with your legs extended out in front of you in an L-shape.",
        categories: %w[Pull Core Arms]
      },
      {
        name: "Australian Pull-up",
        description: "Lie underneath a bar at waist height and pull your chest up towards the bar, engaging your back and arms.",
        categories: %w[Pull Back Arms]
      },
      {
        name: "Bodyweight Row",
        description: "Using a suspension trainer or a bar at waist height, perform a rowing motion, engaging your back and arms.",
        categories: %w[Pull Back Arms]
      },
      {
        name: "Wall Push-Up",
        description: "A beginner-friendly push-up variation that targets the chest and triceps.",
        categories: %w[Push Chest Arms]
      },
      {
        name: "Incline Push-Up",
        description: "A push-up variation that targets the upper chest and shoulders.",
        categories: %w[Push Chest Shoulders]
      },
      {
        name: "Dive Bomber Push-Up",
        description: "A full-body push-up variation that targets the chest, shoulders, and triceps.",
        categories: %w[Push Chest Shoulders]
      },
      {
        name: "High Knees",
        description: "High knees is a simple but effective cardio exercise that can help you burn calories and improve your cardiovascular fitness.",
        categories: %w[Cardio Legs Core]
      },
      {
        name: "Jump Squats",
        description: "Jump squats are a powerful exercise that can help you burn fat, build strength, and improve your cardiovascular fitness.",
        categories: %w[Cardio Legs]
      },
      {
        name: "Superman",
        description: "Lie face down on the floor with arms and legs extended. Lift both arms and legs up simultaneously, hold for 2-3 seconds, then lower back down. Repeat for desired reps.",
        categories: %w[Back Core Functional]
      },
      {
        name: "Reverse Snow Angels",
        description: "Lie face down on the floor with arms at your sides. Lift your chest and arms off the ground, then move your arms up and down in a snow angel motion. Repeat for desired reps.",
        categories: %w[Back Shoulders Mobility]
      },
      {
        name: "Inverted Rows",
        description: "Find a sturdy horizontal bar (such as a table or low barbell rack) and lie underneath it. Grasp the bar with a shoulder-width, overhand grip and pull your body up towards the bar. Lower back down and repeat for desired reps.",
        categories: %w[Back Arms Functional]
      },
      {
        name: "Dolphin Kicks",
        description: "Start in a plank position with forearms on the ground. Lift your hips up and kick your feet towards your hands, keeping your legs straight. Lower back down and repeat for desired reps.",
        categories: %w[Back Core Cardio]
      },
      {
        name: "Bodyweight Row",
        description: "Find a sturdy horizontal bar (such as a table or low barbell rack) and lie underneath it. Grasp the bar with a shoulder-width, underhand grip and pull your body up towards the bar. Lower back down and repeat for desired reps.",
        categories: %w[Back Arms Functional]
      },
      {
        name: "Reverse Lunges",
        description: "Reverse lunges target the glutes, hamstrings, and quads. They can help to improve balance and stability.",
        categories: %w[Legs Functional Mobility]
      },
      {
        name: "Single Leg Deadlifts",
        description: "Single leg deadlifts are a great exercise to help improve balance and stability. They target the hamstrings and glutes.",
        categories: %w[Legs Functional Mobility]
      },
      {
        name: "Side Lunges",
        description: "Side lunges target the inner and outer thighs and can help to improve hip mobility.",
        categories: %w[Legs Functional Mobility]
      },
      {
        name: "Diamond Push-Up",
        description: "A push-up variation that targets the triceps and chest muscles",
        categories: %w[Push Chest Core]
      },
      {
        name: "Plyometric Push-Up",
        description: "A push-up variation that involves explosive movements to increase chest strength and power",
        categories: %w[Push Chest Cardio]
      },
      {
        name: "Incline Push-Up",
        description: "A push-up variation that targets the upper chest muscles",
        categories: %w[Push Chest Mobility]
      },
      {
        name: "Dumbbell Fly",
        description: "A chest exercise that targets the pectoral muscles and helps improve chest definition",
        categories: %w[Chest Arms Functional]
      },
      {
        name: "Wide-Grip Push-Up",
        description: "A push-up variation that targets the chest muscles and helps improve chest width",
        categories: %w[Push Chest Core]
      },
      {
        name: "Plank Jacks",
        description: "Start in a high plank position and jump your feet out and in like a jumping jack while maintaining a stable core.",
        categories: %w[Core Cardio Functional]
      },
      {
        name: "Reverse Crunch",
        description: "Lie on your back with your hands at your sides, lift your legs off the ground and pull your knees towards your chest while lifting your hips off the ground.",
        categories: %w[Core Belly Functional]
      },
      {
        name: "Spiderman Plank",
        description: "Start in a high plank position and bring your right knee to your right elbow, then return to plank position and repeat on the other side.",
        categories: %w[Core Mobility Functional]
      },
      {
        name: "Plank Up-Down",
        description: "A plank variation where the body moves from a forearm plank to a high plank, emphasizing shoulders and triceps.",
        categories: %w[Push Arms Core]
      },
      {
        name: "Bear Crawl",
        description: "A full-body exercise where hands and feet support the body in a crawling position, emphasizing shoulders and arms.",
        categories: %w[Functional Arms Core]
      },
      {
        name: "Side Plank with Arm Reach",
        description: "A side plank variation where the top arm reaches up and over the body, emphasizing shoulders and arms.",
        categories: %w[Mobility Arms Core]
      },
      {
        name: "Pike Push-up",
        description: "This exercise is similar to a traditional push-up but places more emphasis on the shoulders. Begin in a downward dog position with your hands shoulder-width apart and your feet hip-width apart. Slowly lower your head towards the ground, keeping your elbows close to your body. Push back up to the starting position.",
        categories: %w[Push Shoulders Core]
      },
      {
        name: "Handstand Hold",
        description: "This exercise requires strength and balance. Begin by facing a wall and placing your hands on the ground, shoulder-width apart. Walk your feet up the wall until your body is in a straight line. Hold this position for as long as possible.",
        categories: %w[Mobility Shoulders Core]
      },
      {
        name: "Shoulder Taps",
        description: "Start in a plank position with your hands shoulder-width apart. Lift one hand off the ground and tap the opposite shoulder. Return to the starting position and repeat with the other hand. Alternate sides for the desired number of repetitions.",
        categories: %w[Core Functional Shoulders]
      },
      {
        name: "Shoulder Circles",
        description: "Stand with your feet shoulder-width apart and raise your arms straight out to the sides. Slowly make small circles with your arms, gradually increasing the size of the circles. Reverse the direction of the circles after a set number of repetitions.",
        categories: %w[Mobility Shoulders Core]
      },
      {
        name: "Shoulder Blade Squeeze",
        description: "Stand with your feet shoulder-width apart and your arms at your sides. Squeeze your shoulder blades together and hold for a few seconds before releasing. Repeat for the desired number of repetitions.",
        categories: %w[Back Shoulders Core]
      },
      {
        name: "Jumping lunges",
        description: "Start in a lunge position, then jump up and switch legs in mid-air before landing in a lunge on the opposite side.",
        categories: %w[Functional Legs Cardio]
      },
      {
        name: "Broad jump",
        description: "Jump forward as far as you can while landing in a squat position. Repeat for reps.",
        categories: %w[Functional Legs Cardio]
      }
    ]

    exercises.each do |exercise|
      exr = Exercise.create(name: exercise[:name], description: exercise[:description])

      exercise[:categories].each do |category|
        if Category.find_by(name: category.downcase)
          ExerciseCategory.create(exercise_id: exr.id, category_id: Category.find_by(name: category.downcase).id)
        else
          cat = Category.create(name: category.downcase)
          ExerciseCategory.create(exercise_id: exr.id, category_id: cat.id)
        end
      end
    end
  end
end
