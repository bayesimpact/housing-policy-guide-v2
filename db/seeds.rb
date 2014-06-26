# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create({ email: 'hong.nick@gmail.com', password: '12345678' }) if Admin.where(email: 'hong.nick@gmail.com').first.nil?
Admin.create({ email: 'jbonaguro@gmail.com', password: '12345678' }) if Admin.where(email: 'jbonaguro@gmail.com').first.nil?
Admin.create({ email: 'niazsouti@gmail.com', password: '12345678' }) if Admin.where(email: 'niazsouti@gmail.com').first.nil?

['Policy #1', 'Policy #2', 'Policy #3', 'Policy #4'].each do |policy_name|
  Policy.create({
    name: policy_name,
    summary: 'Bacon ipsum dolor sit amet shank drumstick beef ribs tenderloin porchetta kevin, short loin tri-tip ribeye bacon spare ribs. Swine ball tip pig pastrami, spare ribs sausage pork chop pork loin venison frankfurter capicola ham hock fatback drumstick tenderloin. Turkey bacon jowl turducken. Strip steak jerky short loin capicola salami tail turducken. Bacon porchetta venison ball tip. Biltong filet mignon andouille, strip steak brisket tri-tip tail shank landjaeger.',
    description: 'T-bone ground round pastrami brisket boudin, chuck shank. Spare ribs shankle sirloin jowl corned beef andouille tri-tip ribeye beef shoulder strip steak rump. Ground round ham hock chicken, beef jowl doner biltong brisket swine flank pastrami kielbasa hamburger. Pork turkey turducken prosciutto kevin pork chop swine doner hamburger filet mignon pancetta shankle tri-tip. Kielbasa short ribs salami andouille, sausage chicken tri-tip. Meatloaf fatback ball tip, ham hock kielbasa bacon leberkas. Biltong tenderloin salami kielbasa capicola.',
    organization_text: 'Frankfurter pancetta short loin brisket shoulder meatloaf drumstick hamburger chicken spare ribs tenderloin kielbasa corned beef pork chop. Kielbasa jerky corned beef, shoulder tri-tip meatball ham hock short loin fatback pork brisket beef ribs. Meatloaf venison shankle t-bone, shoulder drumstick flank jerky pork belly beef jowl. Short ribs pig short loin landjaeger, shank salami cow ham hock pancetta. Turkey jowl fatback meatloaf. Chuck doner jerky pork, ground round strip steak andouille rump tenderloin.',
    resources_text: 'Beef ribs andouille tongue kielbasa corned beef strip steak. Spare ribs tenderloin meatball, pork belly sausage porchetta tongue cow filet mignon. Tail hamburger pig, rump pancetta cow pastrami short ribs t-bone salami jowl. Frankfurter pancetta meatball ribeye turkey, prosciutto short loin ham hock.',
    thumbnail_image_url: 'https://www.filepicker.io/api/file/gFb7Ghz0QMaRQQmUYQVz',
    masthead_image_url: "https://www.filepicker.io/api/file/RuRQ6gjdQDusXGtYg6jg"
    })
end

super_group_1 = DataGroup.create(name: 'Super Group 1')
['Group 1', 'Group 2', 'Group 3', 'Group 4'].each do |group_name|
  DataGroup.create(name: group_name, parent: super_group_1)
end

super_group_2 = DataGroup.create(name: 'Super Group 2')
['Group 6', 'Group 7', 'Group 8', 'Group 9'].each do |group_name|
  DataGroup.create(name: group_name, parent: super_group_2)
end

['Dataset #1', 'Dataset #2', 'Dataset #3', 'Dataset #4', 'Dataset #5', 'Dataset #6', 'Dataset #7', 'Dataset #8'].each do |dataset_name|
  Dataset.create({
    name: dataset_name,
    source_description: 'Squid Brooklyn ethical banjo Schlitz, ugh Thundercats cliche asymmetrical church-key. PBR&B literally umami, brunch Brooklyn art party stumptown YOLO messenger bag blog. Four loko plaid chillwave salvia mumblecore Austin ugh, bitters organic pour-over cliche locavore aesthetic tofu biodiesel. Umami iPhone ethical wolf, Pitchfork Cosby sweater quinoa Intelligentsia asymmetrical Tumblr Shoreditch Vice food truck Austin kitsch. Fingerstache YOLO cray quinoa Odd Future ugh letterpress. Cray actually Austin sartorial swag freegan. Brooklyn ethnic slow-carb mustache yr sustainable.',
    notes: "Chambray YOLO Vice, Truffaut bicycle rights Godard Intelligentsia swag before they sold out forage scenester skateboard leggings. Ennui farm-to-table sartorial flannel post-ironic chillwave normcore banh mi American Apparel. Bicycle rights ugh bitters, flexitarian organic mlkshk sartorial fingerstache. Bicycle rights Odd Future twee 8-bit, lomo tote bag Shoreditch hella flexitarian actually Pitchfork yr tousled. Selfies farm-to-table bicycle rights, wayfarers art party ethnic dreamcatcher single-origin coffee Williamsburg skateboard banjo. Deep v tote bag Pinterest kale chips, mixtape narwhal leggings Truffaut art party American Apparel wayfarers 90's vegan PBR. Semiotics post-ironic irony, paleo High Life Brooklyn swag trust fund flexitarian retro gluten-free leggings deep v.",
    source_url: "test",
    visualization_iframe: '<iframe height=520 width=810 src="//docs.google.com/spreadsheets/d/1SYYqoBNysyyUc2M6XCeY0vuh_ot-hYhqsMAN1DdudBE/gviz/chartiframe?oid=2030283485" seamless frameborder=0 scrolling=no></iframe>'
  })
end

Dataset.all.each_with_index do |dataset, index|
  DataGroup.with_parents[index].datasets << dataset
end
