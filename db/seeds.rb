# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Pet.delete_all

PERSONALITY = ["Playful", "Sleepy", "Chill", "Feisty", "Cuddly"]
CAT_PIC = [
    "https://static01.nyt.com/images/2020/04/22/science/22VIRUS-PETCATS1/22VIRUS-PETCATS1-mediumSquareAt3X.jpg",
    "https://static.scientificamerican.com/sciam/cache/file/92E141F8-36E4-4331-BB2EE42AC8674DD3_source.jpg",
    "https://undark.org/wp-content/uploads/2020/02/GettyImages-1199242002-1-scaled.jpg",
    "https://www.nationalgeographic.com/content/dam/news/2018/05/17/you-can-train-your-cat/02-cat-training-NationalGeographic_1484324.ngsversion.1526587209178.adapt.1900.1.jpg",
    "https://image.cnbcfm.com/api/v1/image/105828578-1554223245858gettyimages-149052633.jpeg?v=1554223281"
]
DOG_PIC = [
    "https://cdn.akc.org/content/article-body-image/samoyed_puppy_dog_pictures.jpg",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/smartest-dog-breeds-1553287693.jpg?crop=0.673xw:1.00xh;0.167xw,0&resize=640:*",
    "https://i.pinimg.com/originals/62/17/ca/6217ca093721676961303611047e0670.jpg",
    "https://images2.minutemediacdn.com/image/upload/c_crop,h_1194,w_2119,x_0,y_70/v1554738239/shape/mentalfloss/63484-istock-533859316.jpg?itok=iSRiZkeg",
    "https://static.stacker.com/s3fs-public/styles/properly_sized_image/s3/croppeddoberman11779191280jpg.JPEG"
]

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
        kid_friendly = "yes"
    elsif !cat["environment"]["children"] 
        kid_friendly = "no"
    else
        kid_friendly = "unknown"
    end

    #check if personality exists
    if cat["tags"].length > 0
        personality = cat["tags"].join(", ")
    else
        personality = PERSONALITY.sample
    end

    #check if image url exists
    if cat["photos"].length > 0
        cat_photo = cat["photos"][0]["medium"]
    else
        cat_photo = CAT_PIC.sample
    end

    #check if description is available
    # if cat["description"]
    #     description = cat["description"]
    # else
    #     description = 'There is no description :('
    # end


    Pet.create(
        name: cat["name"],
        species: cat["species"],
        breed: cat["breeds"]["primary"],
        age: cat["age"],
        kid_friendly: kid_friendly,
        personality: personality,
        img_url: cat_photo
        # ,description: description
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
        personality = PERSONALITY.sample
    end

    #check if image url exists
    if dog["photos"].length > 0
        dog_photo = dog["photos"][0]["medium"]
    else
        dog_photo = DOG_PIC.sample
    end

    # check if description exists
    # if dog["description"]
    #     description = dog["description"]
    # else
    #     description = 'There is no description :('
    # end


    Pet.create(
        name: dog["name"],
        species: dog["species"],
        breed: dog["breeds"]["primary"],
        age: dog["age"],
        kid_friendly: kid_friendly,
        personality: personality,
        img_url: dog_photo
        # ,description: description
    )
end