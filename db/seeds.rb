# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artwork.create({
  artist_id: (1..5).to_a.sample,
  title: ['Picture', 'Art', 'Stuff', 'Something', 'Trash', 'NotAnArt', 'High', 'Foot'].sample,
  year: (1000..2017).to_a.sample,
  image: Rails.root.join("db/images.png").open,
  mediums: ['someone', 'nobody', 'agency', 'whoknowswho'].sample
})

unless Artist.count > 0
  Artist.create({
    name: 'Maria Martine',
    date_of_birth: Time.now - 50.years,
    biography: 'Text & Talk: An Interdisciplinary Journal of Language, Discourse & Communication Studies is an academic journal published by Mouton de Gruyter. From 1981 through 1995, the journal was published under the name Te'
  })

  Artist.create({
    name: 'Aubrey Graham',
    date_of_birth: Time.now - 30.years,
    biography: 'This article about a linguistics journal is a stub. You can help Wikipedia by expanding it.
                See tips for writing articles about academic journals. Further suggestions might be found on the articles t'
  })

  Artist.create({
    name: 'Eithne Ní Bhraonáin',
    date_of_birth: Time.now - 100.years,
    biography: 'Because she knew that most of the world would scratch their heads when presented with the Irish “Eithne,” Enya changed her name to the phonetic spelling of her real name. Yep, “Eithne” = “Enya.”'
  })

  Artist.create({
    name: 'Michael Peter Balzary',
    date_of_birth: Time.now - 130.years,
    biography: 'The itchy moniker goes back to his high school days, when friends called him “Mike B the Flea.”'
  })

  Artist.create({
    name: 'Wouter Backer',
    date_of_birth: Time.now - 10.years
  })
end
