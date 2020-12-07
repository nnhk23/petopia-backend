# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Pet.delete_all

PERSONALITY_CAT = ["Playful", "Sleepy", "Chill", "Feisty but Adorbs", "Cuddly", "Hongry"]

PERSONALITY_DOG = ["Playful", "Sleepy", "Cuddle Bug", "Attention Seeker"]

contents = File.open('cat.txt')
cat_data = JSON.parse(contents.read)


contents = File.open('dog.txt')
dog_data = JSON.parse(contents.read)

5.times do
    User.create(name: Faker::Name.first_name, zip_code: Faker::Address.zip_code)  
end

cat_data.each do |cat|
    # check if kid_friendly tag exists
    if cat["environment"]["children"] 
        kid_friendly = "Yes"
    elsif !cat["environment"]["children"] 
        kid_friendly = "No"
    else
        kid_friendly = "Unknown"
    end

    #check if personality exists
    if cat["tags"].length > 0
        personality = cat["tags"].join(", ")
    else
        personality = PERSONALITY_CAT.sample
    end


    Pet.create(
        name: cat["name"],
        species: cat["species"],
        breed: cat["breeds"]["primary"],
        age: cat["age"],
        kid_friendly: kid_friendly,
        personality: personality,
        img_url: cat["photos"][0]["large"],
        description: cat["description"],
        url: cat["url"],
        email: cat["contact"]["email"]
    )
end

dog_data.each do |dog|
    # check if kid_friendly tag exists
    if dog["environment"]["children"] 
        kid_friendly = "yes"
    elsif !dog["environment"]["children"] 
        kid_friendly = "no"
    else
        kid_friendly = "unknown"
    end

    #check if personality exists
    if dog["tags"].length > 0
        personality = dog["tags"].join(", ")
    else
        personality = PERSONALITY_DOG.sample
    end


    Pet.create(
        name: dog["name"],
        species: dog["species"],
        breed: dog["breeds"]["primary"],
        age: dog["age"],
        kid_friendly: kid_friendly,
        personality: personality,
        img_url: dog["photos"][0]["large"],
        description: dog["description"],
        url: dog["url"],
        email: dog["contact"]["email"]
    )
end
