# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end
# #
puts "destroying everything"
  Log.destroy_all
  Workout.destroy_all
  SplitExercise.destroy_all
  Split.destroy_all
  Programme.destroy_all
  Exercise.destroy_all
  User.destroy_all


puts "creating exercises"
  exercises = [
    {
      "name": "Barbell Bench Press",
      "description": "The barbell bench press is a fundamental push exercise that targets the chest, shoulders, and triceps. It is performed lying on a bench while pressing a barbell upward.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Dumbbell Chest Press",
      "description": "The dumbbell chest press strengthens the chest, shoulders, and triceps. Using dumbbells allows for a greater range of motion compared to a barbell.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Overhead Shoulder Press",
      "description": "The overhead shoulder press works the shoulders and triceps, focusing on building strength and size in the upper body. It can be done standing or seated with a barbell or dumbbells.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Push-Ups",
      "description": "Push-ups are a bodyweight exercise targeting the chest, shoulders, and triceps. It also engages the core and helps build overall upper body strength.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Incline Bench Press",
      "description": "The incline bench press emphasizes the upper portion of the chest and shoulders. It's performed with a barbell or dumbbells on a bench set at an incline.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Dumbbell Lateral Raises",
      "description": "Dumbbell lateral raises primarily target the lateral deltoids, helping to build wider shoulders and improve shoulder definition.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Tricep Dips",
      "description": "Tricep dips are a bodyweight exercise that focus on strengthening the triceps, shoulders, and chest. They can be performed using parallel bars or a bench.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Cable Chest Fly",
      "description": "The cable chest fly isolates the chest muscles and helps in developing pectoral definition and strength. It is performed using a cable machine.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Dumbbell Front Raises",
      "description": "Dumbbell front raises target the front deltoid muscles, improving shoulder strength and definition. It can be performed with dumbbells or a barbell.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Tricep Pushdowns",
      "description": "Tricep pushdowns target the triceps, helping to increase arm size and strength. It's typically performed using a cable machine with a straight or rope attachment.",
      "category_array": ["push", "upperbody"]
    },
    {
      "name": "Pull-Ups",
      "description": "Pull-ups are a bodyweight exercise that primarily targets the back, biceps, and shoulders. It helps build pulling strength and upper body muscle mass.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Lat Pulldown",
      "description": "The lat pulldown targets the latissimus dorsi and helps develop back width and pulling strength. It's performed on a cable machine.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Barbell Row",
      "description": "The barbell row is a compound movement that targets the back, shoulders, and biceps. It strengthens the pulling muscles of the upper body.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Dumbbell Row",
      "description": "The dumbbell row works the back, particularly the lats, as well as the biceps and shoulders. It is typically performed one arm at a time.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Face Pulls",
      "description": "Face pulls target the rear deltoids and upper back muscles, helping improve posture and shoulder health. It is performed using a cable machine with a rope attachment.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Seated Cable Row",
      "description": "The seated cable row targets the muscles of the upper and lower back, improving pulling strength and back thickness.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Dumbbell Bicep Curl",
      "description": "Dumbbell bicep curls isolate the biceps, helping to build arm size and strength. They can be performed standing or seated.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Barbell Bicep Curl",
      "description": "The barbell bicep curl is a classic exercise that isolates the biceps, promoting growth and strength in the upper arms.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Hammer Curls",
      "description": "Hammer curls target both the biceps and the brachialis, helping to build strength and size in the upper arms. It's performed using dumbbells with a neutral grip.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "T-Bar Row",
      "description": "The T-bar row is a compound exercise that targets the back, particularly the lats and middle back. It's great for developing pulling strength and back thickness.",
      "category_array": ["pull", "upperbody"]
    },
    {
      "name": "Barbell Squat",
      "description": "The barbell squat is a foundational leg exercise that targets the quads, glutes, and hamstrings. It also engages the core for stability.",
      "category_array": ["legs", "lowerbody"]
    },
    {
      "name": "Leg Press",
      "description": "The leg press targets the quads, hamstrings, and glutes, providing an effective way to build leg strength while placing less stress on the lower back.",
      "category_array": ["legs", "lowerbody"]
    },
    {
      "name": "Lunges",
      "description": "Lunges are a unilateral leg exercise that works the quads, hamstrings, glutes, and calves. It helps improve balance, coordination, and leg strength.",
      "category_array": ["legs", "lowerbody"]
    },
    {
      "name": "Romanian Deadlift",
      "description": "The Romanian deadlift targets the hamstrings, glutes, and lower back. It helps improve posterior chain strength and flexibility.",
      "category_array": ["legs", "lowerbody"]
    },
    {
      "name": "Leg Extension",
      "description": "The leg extension isolates the quadriceps, helping to build strength and muscle mass in the front of the thighs.",
      "category_array": ["legs", "lowerbody"]
    },
    {
      "name": "Leg Curl",
      "description": "Leg curls isolate the hamstrings, helping to strengthen the muscles in the back of the thigh and improve overall leg stability.",
      "category_array": ["legs", "lowerbody"]
    },
    {
      "name": "Bulgarian Split Squat",
      "description": "The Bulgarian split squat is a unilateral leg exercise that targets the quads, glutes, and hamstrings while also improving balance and stability.",
      "category_array": ["legs", "lowerbody"]
    },
    {
      "name": "Calf Raises",
      "description": "Calf raises focus on the calves, specifically the gastrocnemius and soleus muscles, helping to improve lower leg strength and definition.",
      "category_array": ["legs", "lowerbody"]
    },
    {
      "name": "Deadlifts",
      "description": "The deadlift is a compound movement that targets the entire posterior chain, including the back, glutes, hamstrings, and core. It's a full-body strength-building exercise.",
      "category_array": ["legs", "lowerbody", "pull"]
    },
    {
      "name": "Goblet Squat",
      "description": "The goblet squat is a squat variation where a dumbbell or kettlebell is held at chest level, targeting the quads, glutes, and core for improved lower body strength.",
      "category_array": ["legs", "lowerbody"]
    }
  ]
  exercises.each do |exercise|
    Exercise.create!(exercise)
  end

  puts "create a user"
  user = User.create!(email: "abc@abc.com", password: "123456", username: "abc", weight: 70, height: 180, date_of_birth: "1990-01-01")

  puts "create a programme"
  programme = Programme.create!(name: "Programme 1", user: user, weeks: 4, splits_per_week: 2)

  puts "create 3 splits"
  puts programme.user
  split1 = Split.create!(programme: programme, category: "Upperbody")
  split2 = Split.create!(programme: programme, category: "Lowerbody")

  puts "create 3 split exercises for each split"
  # create 2 exercises for each split
  SplitExercise.create!(exercise: Exercise.first, split: split1)
  SplitExercise.create!(exercise: Exercise.second, split: split1)
  SplitExercise.create!(exercise: Exercise.last, split: split2)
  SplitExercise.create!(exercise: Exercise.first, split: split2)


  puts "create 4 workouts for each split"
  workout1_1 = Workout.create!(split: Split.first, date: "2024-01-01")
  workout1_2 = Workout.create!(split: Split.first, date: "2024-01-08")
  workout1_3 = Workout.create!(split: Split.first, date: "2024-01-15")
  workout1_4 = Workout.create!(split: Split.first, date: "2024-01-22")
  workout2_1 = Workout.create!(split: Split.last, date: "2024-01-09")
  workout2_2 = Workout.create!(split: Split.last, date: "2024-01-16")
  workout2_3 = Workout.create!(split: Split.last, date: "2024-01-23")
  workout2_4 = Workout.create!(split: Split.last, date: "2024-01-30")


  puts "create 1 log for each split exercise"
  # for each workout, create a log for each split exercise
  # for each log, set weight and repetitions
  workouts = Workout.all
  workouts.each do |workout|
    workout.split.split_exercises.each do |split_exercise|
      Log.create!(workout: workout, split_exercise: split_exercise, weight: rand(30..60), repetitions: rand(6..12))
    end
  end

puts "done"
